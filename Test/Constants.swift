
import UIKit


class Constants : NSObject {
    
    static let appDel = UIApplication.shared.delegate as! AppDelegate
    static var alamofireObj : AlamoFireCommon = AlamoFireCommon()
 
    struct APIURLs {
        static let BASEURL : String = "https://api.imgur.com/3/" 
        static let IMAGELIST = "gallery/CkOPyBa"
      }
    
  
  
}
