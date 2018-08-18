//
//  ImagedisplayVC.swift
//  Test
//
//  Created by Patez on 18/8/18.
//  Copyright © 2018 Vaishali Patel. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ImagedisplayVC: UIViewController , UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tbldata: UITableView!
    var dictdatalist : NSDictionary = [:]
    var dictcitydatalist : NSDictionary = [:]
    var arrdatalist : NSArray = []
    var arrayList = [Any]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getdata()
        
    }
    func getdata()
    {
        
        Constants.alamofireObj.callWebServiceWithURLWithoutParameterGet(methodName: Constants.APIURLs.IMAGELIST, completion: { (result : [String: AnyObject]) in
         
            let status : Int = result["status"] as! Int
            if status == 200 {
                self.arrayList = result["data"]!["images"] as! [Any]
          
                self.tbldata.reloadData()
            }
            else{
                print("Error!!!")
            }
         
        })
        
  
    }
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! DataTableViewCell
        
        var dictlist : NSDictionary = [:]
        dictlist = self.arrayList[indexPath.row] as! NSDictionary
        

        let date = NSDate(timeIntervalSince1970:(dictlist["datetime"] as? Double)!)
      
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "dd/MM/YYYY hh:mm a"
        
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
      
        cell.lbldate.text = dateString as? String
        cell.lblimgname.text = dictlist["id"] as? String

        let url = URL(string: (dictlist["link"] as? String)!)!
        cell.imgdisplay.af_setImage(withURL: url, placeholderImage: nil)
      return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayList.count
    }

}

