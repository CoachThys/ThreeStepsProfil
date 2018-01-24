//
//  CategoryCell.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit

class ProfilCategoryCell: UICollectionViewCell {
    
    // MARK - Views
    let categoryImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    let filterImageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    let countryStatsLabel: UILabel = {
        let label = UILabel()
        label.layer.shadowOpacity = 0.8
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = ""
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        return label
    }()
    
    // MARK - Properties
    private var currentCategory: Category?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        layer.cornerRadius = 4
        
        addSubview(categoryImageView)
        categoryImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        categoryImageView.addSubview(filterImageView)
        filterImageView.anchor(top: categoryImageView.topAnchor, left: categoryImageView.leftAnchor, bottom: categoryImageView.bottomAnchor, right: categoryImageView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        categoryImageView.addSubview(countryStatsLabel)
        countryStatsLabel.translatesAutoresizingMaskIntoConstraints = false
        countryStatsLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        countryStatsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        loadCategoryTitle()
        layoutIfNeeded()
    }
    
    // MARK - Functions
    
    fileprivate func loadCategoryTitle() {
        guard let category = currentCategory else { return }
        countryStatsLabel.text = category.countryId
    }
    
    func configure(category: Category) {
        
        // Set current post
        currentCategory = category
        
        // Reset image view's image
        categoryImageView.image = nil
        categoryImageView.layer.cornerRadius = 5.0
        categoryImageView.layer.masksToBounds = true
        
        if let image = currentCategory?.imageUrl {
            categoryImageView.image = UIImage(named: image)
        } else {
            print("There was an error fetching the image")
        }

    }

}
