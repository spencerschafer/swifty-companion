//
//  ProfileViewController.swift
//  Swifty
//
//  Created by Spencer SCHAFER on 2018/11/13.
//  Copyright © 2018 Spencer SCHAFER. All rights reserved.
//

import UIKit
import SwiftyJSON



class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var skillsTableView: UITableView!
    @IBOutlet weak var projectsTableView: UITableView!
    
    var userInformation: JSON?
    var skillsInformation: [String] = ["1", "2", "3", "4", "5", "6", "7"]
    var projectsInformation: [String] = ["A", "B", "C", "D", "E", "F", "G"]
    
    override func viewDidLoad() {
        print("Function 6")
        super.viewDidLoad()
        //print(userInformation)
        
        print("Function 6.1")
        getProfileAttributes()
        print("Function 6.2")
        getProfileImage()
        getTableViews()
        print("Function 6.end")
    }
    
    func getProfileImage() {
        let imageURL = userInformation!["image_url"].stringValue
        let image = NSData(contentsOf: NSURL(string:imageURL)! as URL)
        
        profileImage.image = UIImage(data:image! as Data)
        profileImage.layer.cornerRadius = 10
        profileImage.clipsToBounds = true
    }
    
    func getProfileAttributes() {
        displayNameLabel.text = userInformation!["displayname"].stringValue
        
        usernameLabel.text = userInformation!["login"].stringValue
        
        levelLabel.text = userInformation!["cursus_users"][0]["level"].stringValue
        //TODO: truncate string as some users level value contains x.xxxxxxx
        //print(userInformation!["cursus_users"][0]["level"].stringValue)
        levelLabel.layer.cornerRadius = 10
        levelLabel.layer.masksToBounds = true
        
        locationLabel.text = userInformation!["campus"][0]["city"].stringValue + ", " + userInformation!["campus"][0]["country"].stringValue
        
        emailLabel.text = userInformation!["email"].stringValue
    }
    
    
    func getTableViews() {
        skillsTableView.layer.cornerRadius = 10
        projectsTableView.layer.cornerRadius = 10
        
        // get information for tableViews to display
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return skillsInformation.count
        } else {
            return projectsInformation.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let referenceCell =  tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        
        if tableView.tag == 1 {
            referenceCell.textLabel?.text = skillsInformation[indexPath.row]
            return referenceCell
        } else {
            referenceCell.textLabel?.text = projectsInformation[indexPath.row]
            return referenceCell
        }
    }
}
