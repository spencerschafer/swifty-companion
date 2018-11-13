//
//  ViewController.swift
//  Swifty
//
//  Created by Spencer SCHAFER on 2018/11/10.
//  Copyright © 2018 Spencer SCHAFER. All rights reserved.
//

import UIKit

var username:String = ""

class ViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var goButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func goButton(_ sender: Any) {
        if searchField.text != "" {
            username = searchField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            print(username)
            performSegue(withIdentifier: "buttonSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController2
        vc.string = username
    }
    
}
