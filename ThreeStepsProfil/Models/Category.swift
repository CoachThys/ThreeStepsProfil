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
    var isoCountry: String
    var imageUrl: String
    var timestamp: Int
    var nbOfSpots : Int?
    
    // MARK: - Firebase Keys
    
    enum CategoryInfoKey {
        static let imageFileURL = "imageFileURL"
        static let isoCountry = "isoCountry"
        static let country = "country"
        static let timestamp = "timestamp"
    }
    
    // MARK: - Initialization
    
    init(countryId: String, isoCountry: String, imageUrl: String, timestamp: Int = Int(NSDate().timeIntervalSince1970 * 1000), nbOfSpots: Int? = nil) {
        
        self.countryId = countryId
        self.isoCountry = isoCountry
        self.imageUrl = imageUrl
        self.timestamp = timestamp
        self.nbOfSpots = nbOfSpots
        
    }
    
    init?(countryId: String, categoryInfo: [String: Any]) {
        guard let imageFileUrl = categoryInfo[CategoryInfoKey.imageFileURL] as? String,
            let isoCountry = categoryInfo[CategoryInfoKey.isoCountry] as? String,
            let timestamp = categoryInfo[CategoryInfoKey.timestamp] as? Int
            
            else {
                print("La structure “Category“ n'est pas respectée")
                return nil
        }
        
        self = Category(countryId: countryId, isoCountry: isoCountry, imageUrl: imageFileUrl, timestamp: timestamp, nbOfSpots: nbOfSpots)
    }
    
}

