//
//  Category.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit

struct Category {
    
    // MARK: - Properties
    
    var countryId: String
    var imageUrl: String
    var nbOfSpots : Int?
    
    // MARK: - Firebase Keys
    
    enum CategoryInfoKey {
        
        static let imageFileURL = "imageFileURL"
        static let isoCountry = "isoCountry"
        static let country = "country"
        
    }
    
    // MARK: - Initialization
    
    init(countryId: String, imageUrl: String, nbOfSpots: Int? = nil) {
        
        self.countryId = countryId
        self.imageUrl = imageUrl
        self.nbOfSpots = nbOfSpots
        
    }
    
}

