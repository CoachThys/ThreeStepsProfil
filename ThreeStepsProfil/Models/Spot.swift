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
    var description: String
    
    // MARK: - Firebase Keys
    
    enum SpotInfoKey {
        
        static let imageUrl = "imageUrl"
        static let description = "description"

    }
    
    // MARK: - Initialization
    
    init(imageFileURL: String, description: String) {
        
        self.imageFileURL = imageFileURL
        self.description = description
        
    }
    
}
