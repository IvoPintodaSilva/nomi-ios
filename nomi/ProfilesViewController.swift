//
//  ProfilesViewController.swift
//  nomi
//
//  Created by Ivo Silva on 25/11/15.
//  Copyright © 2015 Ivo Silva. All rights reserved.
//

import UIKit


class ProfilesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var new_profile_btn: UIButton!
    @IBOutlet weak var profile_table: UITableView!
    
    var profile_id: Int?
    var profile_row: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNeedsStatusBarAppearanceUpdate()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Avenir-heavy", size: 18)!]

        
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        profile_table.separatorStyle = UITableViewCellSeparatorStyle.None
        
        new_profile_btn.backgroundColor = UIColor(red: 0.71, green: 0.23, blue: 0.21, alpha: 1)
        new_profile_btn.layer.cornerRadius = new_profile_btn.frame.size.width / 2
        new_profile_btn.clipsToBounds = true
        
        // Do any additional setup after loading the view.
        
        profile_table.delegate = self
        profile_table.dataSource = self
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        profile_table.reloadData()
        print("viewWillAppear")
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .Default
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserProfilesModel.sharedInstance.user_profiles.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell", forIndexPath: indexPath) as! ProfileCell
        
//        let colors = [
//            "BLACK",
//            "BLUE",
//            "GREEN",
//            "RED",
//            "WHITE"
//        ]
        
        if UserProfilesModel.sharedInstance.user_profiles[indexPath.row].color == "BLACK" {
            cell.colorView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
        else if UserProfilesModel.sharedInstance.user_profiles[indexPath.row].color == "BLUE" {
            cell.colorView.backgroundColor = UIColor(red: 41/255, green: 128/255.0, blue: 185/255, alpha: 1)
        }
        else if UserProfilesModel.sharedInstance.user_profiles[indexPath.row].color == "GREEN" {
            cell.colorView.backgroundColor = UIColor(red: 0/255, green: 150/96, blue: 136/255, alpha: 1)
        }
        else if UserProfilesModel.sharedInstance.user_profiles[indexPath.row].color == "RED" {
            cell.colorView.backgroundColor = UIColor(red: 192/255, green: 57/255, blue: 43/255, alpha: 1)
        }
        else if UserProfilesModel.sharedInstance.user_profiles[indexPath.row].color == "WHITE" {
            cell.colorView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        cell.colorView.layer.borderWidth = 1
        cell.colorView.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).CGColor
        cell.colorView.layer.cornerRadius = cell.colorView.frame.size.width / 2
        cell.colorView.clipsToBounds = true
        
        
        // Example of how to write an icon into textbox
        
        //var androidIcon: FAKMaterialIcons = FAKMaterialIcons.androidIconWithSize(48)
        //var result: NSMutableAttributedString = androidIcon.attributedString().mutableCopy() as! NSMutableAttributedString
        //result.appendAttributedString(NSMutableAttributedString(string:" - askjdnkajsnd"))
        //contact_details_name.attributedText = result
        
        
        let result: NSMutableAttributedString = NSMutableAttributedString(string:"").mutableCopy() as! NSMutableAttributedString
        
        
        for (attribute) in UserProfilesModel.sharedInstance.user_profiles[indexPath.row].attributes {
            if attribute.name == "FACEBOOK"{
                result.appendAttributedString(FAKMaterialIcons.facebookIconWithSize(20).attributedString())
                result.appendAttributedString(NSMutableAttributedString(string: " "))
            }
            else if attribute.name == "TWITTER"{
                result.appendAttributedString(FAKMaterialIcons.twitterIconWithSize(20).attributedString())
                result.appendAttributedString(NSMutableAttributedString(string: " "))
            }
            else if attribute.name == "INSTAGRAM"{
                result.appendAttributedString(FAKMaterialIcons.instagramIconWithSize(20).attributedString())
                result.appendAttributedString(NSMutableAttributedString(string: " "))
            }
            else if attribute.name == "GOOGLE"{
                result.appendAttributedString(FAKMaterialIcons.googlePlusIconWithSize(17).attributedString())
                result.appendAttributedString(NSMutableAttributedString(string: " "))
            }
            else if attribute.name == "EMAIL"{
                result.appendAttributedString(FAKMaterialIcons.emailIconWithSize(20).attributedString())
                result.appendAttributedString(NSMutableAttributedString(string: " "))
            }
            else if attribute.name == "NUMBER"{
                result.appendAttributedString(FAKMaterialIcons.phoneIconWithSize(20).attributedString())
                result.appendAttributedString(NSMutableAttributedString(string: " "))
            }
            else if attribute.name == "LINKEDIN"{
                result.appendAttributedString(FAKMaterialIcons.linkedinBoxIconWithSize(20).attributedString())
                result.appendAttributedString(NSMutableAttributedString(string: " "))
            }
        }
        
        cell.iconLabel.attributedText = result


        cell.titleLabel.text = UserProfilesModel.sharedInstance.user_profiles[indexPath.row].name
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = UserProfilesModel.sharedInstance.user_profiles[indexPath.row]
        profile_id = item.id
        profile_row = indexPath.row
        
        performSegueWithIdentifier("profileDetails", sender: self)
        profile_table.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "profileDetails") {
            let svc = segue.destinationViewController as! ProfileDetailsViewController
            svc.profile_id = self.profile_id
            svc.profile_row = self.profile_row
        }
    }
}
