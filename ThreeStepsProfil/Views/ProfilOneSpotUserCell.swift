//
//  ProfilOneSpotUserCell.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit

class ProfilOneSpotUserCell: UITableViewCell {
    
    let containerView : UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let userImageView : UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .clear
        return iv
    }()
    
    let usernameLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        return label
    }()
    
    let dateLabel : UILabel = {
        let label = UILabel()
        label.text = "03/10/17"
        label.font = UIFont(name: "HelveticaNeue-Light", size: 12.0)
        return label
    }()
    
    var spot: Spot? {
        didSet {

        }
    }
    
    var user: User? {
        didSet {
            setupUserInfos()
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupUserInfos()
    }
    
    fileprivate func setupViews() {
        contentView.addSubview(containerView)
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 12, width: 0, height: 35)
        
        containerView.addSubview(userImageView)
        userImageView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 35, height: 35)
        userImageView.layer.cornerRadius = 35/2
        userImageView.clipsToBounds = true
        
        containerView.addSubview(usernameLabel)
        usernameLabel.anchor(top: containerView.topAnchor, left: userImageView.rightAnchor, bottom: containerView.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    override func layoutSubviews() {
    }
    
    fileprivate func setupUserInfos() {
        
        guard let user = user else { return }
        
        self.userImageView.image = UIImage(named: user.profileImageUrl)
        self.usernameLabel.text = user.username
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
