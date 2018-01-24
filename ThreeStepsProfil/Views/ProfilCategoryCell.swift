//
//  CategoryCell.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit

class ProfilCategoryCell: UICollectionViewCell {
    
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
        //        label.font = UIFont(name: "HelveticaNeue", size: 20)
        return label
    }()
    
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
//        loadCategoryTitle()
        layoutIfNeeded()
    }
    
//    fileprivate func loadCategoryTitle() {
//        countryStatsLabel.textColor = .white
//
//        guard let category = currentCategory else { return }
//
//        countryStatsLabel.attributedText = NSMutableAttributedString(string: "", attributes: [NSAttributedStringKey.font : UIFont(name: "HelveticaNeue", size: 14.0) ?? UIFont.systemFont(ofSize: 12)])
//
//        let capText = category.countryId.uppercased()
//        guard let nbSpot = category.nbOfSpots else {
//            print(category.nbOfSpots)
//            return
//        }
//
//        var nbSpotText = ""
//        if nbSpot > 1 {
//            nbSpotText = ("\(nbSpot) spots")
//        } else {
//            nbSpotText = ("\(nbSpot) spot")
//        }
//
//        let attributedText = NSMutableAttributedString(string: nbSpotText, attributes: [NSAttributedStringKey.font : UIFont(name: "HelveticaNeue", size: 14.0) ?? UIFont.systemFont(ofSize: 12)])
//
//        attributedText.append(NSAttributedString(string: "\n", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10)]))
//
//        attributedText.append(NSAttributedString(string: capText, attributes: [NSAttributedStringKey.font : UIFont(name: "HelveticaNeue-Bold", size: 20.0) ?? UIFont.systemFont(ofSize: 10)]))
//
//        countryStatsLabel.attributedText = attributedText
//    }
    
    func configure(category: Category) {
        
        // Set current post
        currentCategory = category
        
        // Reset image view's image
        categoryImageView.image = nil
        categoryImageView.layer.cornerRadius = 5.0
        categoryImageView.layer.masksToBounds = true
        
        // Download post image
        if let image = CacheManager.shared.getFromCache(key: category.imageUrl) as? UIImage {
            categoryImageView.image = image
        } else {
            if let url = URL(string: category.imageUrl) {
                print("L'image va etre téléchargée du Storage")
                
                let downloadTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    
                    guard let imageData = data else {
                        return
                    }
                    
                    DispatchQueue.main.async {
                        guard let image = UIImage(data: imageData) else { return }
                        
                        if self.currentCategory?.imageUrl == category.imageUrl {
                            self.categoryImageView.image = image
                            self.filterImageView.backgroundColor = .black
                            self.filterImageView.alpha = 0.2
                        }
                        
                        // Add the downloaded image to cache
                        CacheManager.shared.cache(object: image, key: category.imageUrl)
                    }
                })
                
                downloadTask.resume()
            }
        }
    }
    
    
}
