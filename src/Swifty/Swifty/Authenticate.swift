//
//  Authenticate.swift
//  Swifty
//
//  Created by Spencer SCHAFER on 2018/11/14.
//  Copyright © 2018 Spencer SCHAFER. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Authenticate {
    
    let url = "https://api.intra.42.fr/oauth/token"
    let credentials: [String : String] = [
        "grant_type": "client_credentials",
        "client_id": "58d6b29b6707b80ca3207127dfec6699d107a48f2a761b312d92c844c7ece155",
        "client_secret": "6a70b5a180a7b46f4fc78359e6827e843448f404b97d03d58d15960fdc392f41",
        ]
    
    var json:JSON?
    var token:String = ""
    
    func requestToken(){
        print("Function 2")
        Alamofire.request(url, method: .post, parameters: credentials).responseJSON { (response) in
            if (response.result.isSuccess) {
                print("Function 2.2")
                let value = response.result.value
                let json = JSON(value!)
                
                if (json["error"].exists()) {
                    print("Error: Please review request.")
                    print("Request: ", self.credentials)
                    print("Response: ", response)
                    
                    //TODO: create popup
                    exit(0)
                }
                else {
                    print("Function 2.3")
                    self.token = json["access_token"].stringValue
                }
            }
            else {
                print ("Error: Please review request.")
                
                //TODO: create popup
                exit(0)
            }
        }
        print("Function 2.end")
    }

    func requestUser (username:String, completion: @escaping (JSON?) -> Void) {
        print("Function 4")
        let request = "https://api.intra.42.fr/v2/users/" + username + "?access_token=" + self.token
        //print(request)
        print("Function 4.1")
        Alamofire.request(request)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error-@@")
                    return
                }
                print("Function 4.2")
                let value = response.result.value
                let json = JSON(value!)
                completion(json)
                print("Function 4.end")
        }
    }
}
