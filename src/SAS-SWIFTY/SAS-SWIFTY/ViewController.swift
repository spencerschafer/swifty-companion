//
//  ViewController.swift
//  SAS-SWIFTY
//
//  Created by Spencer SCHAFER on 2018/11/06.
//  Copyright © 2018 sschafer. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    let clientID = "58d6b29b6707b80ca3207127dfec6699d107a48f2a761b312d92c844c7ece155"
    let clientSecret = "6a70b5a180a7b46f4fc78359e6827e843448f404b97d03d58d15960fdc392f41"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Start")
        
        Alamofire.request("https://api.intra.42.fr/v2/users/sschafer?access_token=46662c19e8a23e1c9b22b0ec131049858f7f30ee6d4cdeb1064a8631aee638d3").responseJSON { (response) -> Void in
            print("Request")
            if let JSON = response.result.value {
                print(JSON)
            }
        }
        print("End")
    }
}
