//
//  ViewController.swift
//  Swifty
//
//  Created by Spencer SCHAFER on 2018/11/10.
//  Copyright © 2018 Spencer SCHAFER. All rights reserved.
//

import UIKit
import SwiftyJSON

var authenticate = Authenticate()
var json: JSON?

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Function 1")
        authenticate.requestToken()
        print("Function 1.end")
    }
    
    @IBAction func goButton(_ sender: Any) {
        print("Function 3")
        if searchField.text != "" {
            print("Function 3.1")
            authenticate.requestUser(username: searchField.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
                completion in
                print("Function 3.2")
                if completion != nil {
                    print("Function 5")
                    json = completion
                    print("Function 5.1")
                    if ((json?.isEmpty)!) {
                        print("User does not exist")
                    } else {
                    self.performSegue(withIdentifier: "goButtonSegue", sender: self)
                    }
                    print("Function 5.end")
                } else {
                    print("Error in goButton")
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProfileViewController
        vc.userInformation = json
    }
}
