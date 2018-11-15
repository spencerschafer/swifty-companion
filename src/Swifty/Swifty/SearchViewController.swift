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
    }
    
    @IBAction func goButton(_ sender: Any) {
        print("Function 3")
        if searchField.text != "" {
            authenticate.requestUser(username: searchField.text!.trimmingCharacters(in: .whitespacesAndNewlines)) {
                completion in
                if completion != nil {
                    print("Function 5")
                    json = completion
                    self.performSegue(withIdentifier: "goButtonSegue", sender: self)
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
