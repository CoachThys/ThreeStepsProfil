//
//  Spot.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit
import Firebase
import CoreLocation

struct Spot {
    
    // MARK: - Properties
    
    var imageFileURL: String
    var country: String
    var description: String
    
    // MARK: - Firebase Keys
    
    enum SpotInfoKey {
        
        static let imageUrl = "imageUrl"
        static let country = "country"
        static let description = "description"

    }
    
    // MARK: - Initialization
    
    init(imageFileURL: String, country: String, description: String) {
        
        self.imageFileURL = imageFileURL
        self.country = country
        self.description = description
        
    }
    
}
