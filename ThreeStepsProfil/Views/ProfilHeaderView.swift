//
//  ProfilHeaderView.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit

class ProfilHeaderView: UICollectionViewCell {
    
    // Views
    let containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let countriesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 14.0)
        return label
    }()
    
    let spotsLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "HelveticaNeue", size: 14.0)
        return label
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 25
        iv.clipsToBounds = true
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        contentView.addSubview(containerView)
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        containerView.addSubview(profileImageView)
        profileImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        profileImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        
        containerView.addSubview(spotsLabel)
        spotsLabel.anchor(top: nil, left: profileImageView.rightAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 50, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        containerView.addSubview(countriesLabel)
        countriesLabel.anchor(top: nil, left: nil, bottom: containerView.bottomAnchor, right: profileImageView.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 50, width: 0, height: 0)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
