//
//  ProfileViewController.swift
//  Swifty
//
//  Created by Spencer SCHAFER on 2018/11/13.
//  Copyright © 2018 Spencer SCHAFER. All rights reserved.
//

import UIKit



class ViewController2: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    var string = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameLabel.text = string
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
