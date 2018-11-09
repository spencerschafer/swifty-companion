//
//  ViewController.swift
//  test1
//
//  Created by Spencer SCHAFER on 2018/11/09.
//  Copyright © 2018 Spencer SCHAFER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func button(_ sender: Any) {
        label.text = textField.text!
    }
}

