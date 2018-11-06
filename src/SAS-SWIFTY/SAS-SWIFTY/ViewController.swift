//
//  ViewController.swift
//  SAS-SWIFTY
//
//  Created by Spencer SCHAFER on 2018/11/06.
//  Copyright © 2018 sschafer. All rights reserved.
//

import UIKit

struct campus: Decodable {
    let country: String
    let city: String
    let students: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let token = "Authorization: Bearer 8ea97ceb20e742bdc8a515d3ee7aed195ca724e5c31ba4ea5b9e966495cb379f"
        let url = token + "https://api.intra.42.fr/v2/campus"
        let urlObject = URL(string: url)
        
        URLSession.shared.dataTask(with: urlObject!) {(data, response, error) in
            do {
                var campuses = try JSONDecoder().decode([campus].self, from: data!)
                
                for campus in campuses {
                    print(campus.country)
                }
            } catch {
                print("ERROR")
            }
        }.resume()
        
    }
}
