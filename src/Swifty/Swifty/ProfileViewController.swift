//
//  ProfileViewController.swift
//  Swifty
//
//  Created by Spencer SCHAFER on 2018/11/13.
//  Copyright © 2018 Spencer SCHAFER. All rights reserved.
//

import UIKit
import SwiftyJSON



class ProfileViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    var userInformation: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usernameLabel.text = userInformation!["login"].stringValue
        print("done")
    }
}
