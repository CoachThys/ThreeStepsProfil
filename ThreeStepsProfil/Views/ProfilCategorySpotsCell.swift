//
//  ProfilCategorySpotsCell.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit

class ProfilCategorySpotsCell: UICollectionViewCell {
    
    // MARK - Views
    var spotImageView: UIImageView =  {
        let iv = UIImageView()
        iv.backgroundColor = .lightGray
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK - Properties
    private var currentSpot: Spot?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(spotImageView)
        spotImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK - Functions
    func configure(spot: Spot) {
        
        currentSpot = spot
        
        spotImageView.backgroundColor = .red
        spotImageView.image = nil
        spotImageView.layer.cornerRadius = 5.0
        spotImageView.layer.masksToBounds = true
        
        if let image = currentSpot?.imageFileURL {
            spotImageView.image = UIImage(named: image)
        }
    }
}
