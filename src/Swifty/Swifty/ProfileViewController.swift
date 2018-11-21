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
    
    struct skill {
        var name: String
        var level: Int
    }
    
    struct project {
        var name: String
        var level: Int
    }
    
    var userInformation: JSON?
    var skills: [String] = ["1"]
    var projects: [String] = ["A"]
    
    override func viewDidLoad() {
        print("Function 6")
        super.viewDidLoad()
        //print(userInformation)
        
        print("Function 6.1")
        getProfileAttributes()
        print("Function 6.2")
        getProfileImage()
        getSkills()
        getProjects()
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
    
    
    func getSkills() {
        skillsTableView.layer.cornerRadius = 10
        
        for (_, value): (String, JSON) in userInformation!["cursus_users"][0]["skills"] {
            print("Name: ", value["name"], "Level: ", value["level"])
        }
    }
    
    func getProjects() {
        projectsTableView.layer.cornerRadius = 10
        /*
        // not quite correct yet
        for (_, value): (String, JSON) in userInformation!["cursus_users"][0]["projects_users"] {
            print("Name: ", value["name"], "Level: ", value["level"])
        }
         */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 1 {
            return skills.count
        } else {
            return projects.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let referenceCell =  tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        
        if tableView.tag == 1 {
            referenceCell.textLabel?.text = skills[indexPath.row]
            return referenceCell
        } else {
            referenceCell.textLabel?.text = projects[indexPath.row]
            return referenceCell
        }
    }
}
