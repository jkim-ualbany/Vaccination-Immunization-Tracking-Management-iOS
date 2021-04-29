//
//  HomeModel.swift
//  Capstone Project iOS
//
//  Created by Patrick on 4/29/21.
//

import Foundation

protocol HomeModelProtocol: class {
    func itemsDownloaded(type: String, obj: NSObject?)
}


class HomeModel: NSObject, URLSessionDataDelegate {
    
    //properties
    
    weak var delegate: HomeModelProtocol!
    
    let urlPath = "http://hftsoft.hopto.org:8341/api.php"

    func downloadItems(_ type:String, _ data:NSDictionary?) {
        var theUrl = urlPath + "&type=\(type)"
        // add parameters from data for each type to the url. will be given in excel
        
        
        var url: URL = URL(string: theUrl)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Failed to download data")
            }else {
                print("Data downloaded")
                self.parseJSON(type, data!)
            }
            
        }
        
        task.resume()
    }
    
    func parseJSON(_ type:String, _ data:Data) {
           
           var jsonResult = NSDictionary()
           
           do{
               jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
            
           } catch let error as NSError {
               print(error)
               
           }
           
           var jsonElement = NSDictionary()
            var obj:NSObject? = nil

           for i in 0 ..< jsonResult.count
           {
               
               jsonElement = jsonResult[i] as! NSDictionary
            if let code = jsonElement["code"] as? Int {
                if code < 0 {
                    print("api failed")
                } else {
                    if let datas = jsonElement["data"] as? NSMutableArray {
                        switch type {
                        case "login":
                            obj = LoginModel.parseJSON(datas);
                            break;
                        case "patient":
                            obj = PatientModel.parseJSON(datas);
                            break;
                        default:
                            print("invalid type");
                            
                        }
                      }
                }
            }
               

           }
           
           DispatchQueue.main.async(execute: { () -> Void in
               
            self.delegate.itemsDownloaded(type: type, obj: obj)
               
           })
       }

}
