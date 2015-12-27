//
//  Profile.swift
//  nomi
//
//  Created by Ivo Silva on 23/12/15.
//  Copyright © 2015 Ivo Silva. All rights reserved.
//

import Foundation

class ProfileModel{
    
    var id: Int
    var user_id: Int
    
    //"first_name": "Daniel",
    //"last_name": "Silva",
    //"email": "daniel.silva@ua.pt",

    var user_fname: String
    var user_lname: String
    var user_email: String
    
    var name: String
    var color: String
    var connections: [Int]
    var attributes: [ProfileAttributeModel]
    
    init(id: Int, user_id: Int, user_fname: String, user_lname: String, user_email: String, name: String, color: String, connections: [Int], attributes: [ProfileAttributeModel]) {
        self.id = id
        self.user_id = user_id
        self.user_fname = user_fname
        self.user_lname = user_lname
        self.user_email = user_email
        self.name = name
        self.color = color
        self.connections = connections
        self.attributes = attributes
    }
    
    func addAttribute(attribute: ProfileAttributeModel){
        self.attributes.append(attribute)
    }
    
    
    
}