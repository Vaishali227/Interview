

import Foundation
import Alamofire



class AlamoFireCommon:  NSObject{
   
    func callWebServiceWithURLWithoutParameterGet(methodName: String, completion: @escaping (([String: AnyObject]) -> Void ))
    {
        var headers: HTTPHeaders? = nil
     
            headers = [
                "Content-Type" :"application/x-www-form-urlencoded",
                "Authorization": "Bearer 7df317f326ed03d53b8598da01c60313301339f4"
            ]
        

        print("API: \(Constants.APIURLs.BASEURL + methodName)")
        
        Alamofire.request(Constants.APIURLs.BASEURL + methodName, method: .get, encoding: URLEncoding.httpBody, headers: headers).responseJSON { response in
            
            switch response.result {
                
            case .success( _): break
                
            case .failure(let encodingError ):
                print(encodingError)
                
            }
            
            if let status = response.response?.statusCode
            {
                switch(status){
                case 200:
                    print("response success")
                default:
                    print("error with response status: \(status)")
                }
            }
            //to get JSON return value
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                print(JSON)
                completion(JSON as! [String : AnyObject])
            }
        }
    }
 
  
  
    
}


