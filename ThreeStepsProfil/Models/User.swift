//
//  User.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import Foundation

struct User {
    
    let username: String
    let profileImageUrl: String
    
    init(username: String, profileImageUrl: String) {
        
        self.username = username
        self.profileImageUrl = profileImageUrl
        
    }
}
