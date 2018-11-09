//
//  ViewController.swift
//  test1
//
//  Created by Spencer SCHAFER on 2018/11/09.
//  Copyright © 2018 Spencer SCHAFER. All rights reserved.
//
/*
"displayname": "Spencer Schafer",
"email": "sschafer@student.wethinkcode.co.za",
"expertises_users": [],
"first_name": "Spencer",
"groups": [],
"id": 24609,
"image_url": "https://cdn.intra.42.fr/users/sschafer.jpg",
"languages_users": [
{
"created_at": "2017-03-08T13:17:55.035Z",
"id": 38511,
"language_id": 2,
"position": 1,
"user_id": 24609
}
],
"last_name": "Schafer",
"location": null,
"login": "sschafer",
"partnerships": [],
"patroned": [],
"patroning": [],
"phone": null,
"pool_month": "march",
"pool_year": "2017",
*/

/*"address": "84 Albertina Sisulu Rd, Johannesburg",
 "city": "Johannesburg",
 "country": "South Africa",
 "facebook": "https://www.facebook.com/wethinkcode/",
 "id": 5,
 "language": {
 "created_at": "2015-04-14T16:07:38.122Z",
 "id": 2,
 "identifier": "en",
 "name": "English",
 "updated_at": "2018-10-29T13:38:40.425Z"
 },
 "name": "Johannesburg",
 "time_zone": "Africa/Johannesburg",
 "twitter": "https://twitter.com/wethinkcode",
 "users_count": 1753,
 "vogsphere_id": 1,
 "website": "https://www.wethinkcode.co.za/",
 "zip": "2000"
 */


/*
 "skills": [
 {
 "id": 1,
 "level": 9.75,
 "name": "Algorithms & AI"
 },
 {
 "id": 3,
 "level": 5.33,
 "name": "Rigor"
 },
 {
 "id": 2,
 "level": 4.83,
 "name": "Imperative programming"
 },
 {
 "id": 14,
 "level": 4.45,
 "name": "Adaptation & creativity"
 },
 {
 "id": 7,
 "level": 3.35,
 "name": "Group & interpersonal"
 },
 {
 "id": 17,
 "level": 3.06,
 "name": "Object-oriented programming"
 },
 {
 "id": 13,
 "level": 1.0,
 "name": "Organization"
 }
 ],
 */

import UIKit
import Alamofire
import SwiftyJSON

// UID: 58d6b29b6707b80ca3207127dfec6699d107a48f2a761b312d92c844c7ece155```

// Secret: 6a70b5a180a7b46f4fc78359e6827e843448f404b97d03d58d15960fdc392f41

//Token: 88eb554e76e723d2906d817a1a9f8c14d0aa942c578c3fe416c160dd70306a0b

//struct user: Decodable {
  //  var name: String
    //var username: String
    //var level: Double
//}

var token: String = "894c73fd366396dc1404d9f34ef3a2e604d26e8738946eaf191d76ca6e5adf1c"

var request: String = ""
var username: String = ""

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func button(_ sender: Any) {
        inputLabel.text = textField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        username = textField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        search()
    }
    
    func search() {
        request = "https://api.intra.42.fr/v2/users/" + username + "?access_token=" + token
        print(request)

    Alamofire.request(request)
    .validate()
    .responseJSON { response in
        guard response.result.isSuccess else {
            print("Error")
            return
        }
    
        let value = response.result.value
        let json = JSON(value!)
        
       self.displayNameLabel.text = json["displayname"].stringValue
        
        self.usernameLabel.text = json["login"].stringValue

        self.levelLabel.text = json["cursus_users"][0]["level"].stringValue

        print(self.displayNameLabel.text!)
        print(self.usernameLabel.text!)
        print(self.levelLabel.text!)
        }
    }
}
