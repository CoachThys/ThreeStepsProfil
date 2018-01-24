//
//  ProfilHeaderView.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit

class ProfilHeaderView: UICollectionViewCell {
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Bill Gates"
        return label
    }()
    
    let profilePhotoImage: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    let statsBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let spotImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "MapMarker")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let spotLabel: UILabel = {
        let label = UILabel()
        label.text = "123 spots"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    let verticalSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.widthAnchor.constraint(equalToConstant: 0.5).isActive = true
        return view
    }()
    
    let countryImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "EmptyFlag")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let countryLabel: UILabel = {
        let label = UILabel()
        label.text = "6 pays"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        
        layoutIfNeeded()
    }
    
    override func awakeFromNib() {
    }
    
    override func layoutSubviews() {
        setupProfileImageView()
        
        addSubview(statsBackgroundView)
        statsBackgroundView.anchor(top: profilePhotoImage.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        testStackViews()
    }
    
    
    func testStackViews() {
        
        let width: CGFloat = frame.width/5
        
        // Creating the container views
        let leftView = UIView()
        leftView.backgroundColor = .clear
        leftView.widthAnchor.constraint(equalToConstant: width).isActive = true
        leftView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
        let spotView = UIView()
        spotView.backgroundColor = .clear
        spotView.widthAnchor.constraint(equalToConstant: width).isActive = true
        spotView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
        let middleView = UIView()
        middleView.backgroundColor = .clear
        middleView.widthAnchor.constraint(equalToConstant: width).isActive = true
        middleView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
        let countryView = UIView()
        countryView.backgroundColor = .clear
        countryView.widthAnchor.constraint(equalToConstant: width).isActive = true
        countryView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
        let rightView = UIView()
        rightView.backgroundColor = .clear
        rightView.widthAnchor.constraint(equalToConstant: width).isActive = true
        rightView.heightAnchor.constraint(equalToConstant: width).isActive = true
        
        // Add a separator in the middle view
        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .white
        
        middleView.addSubview(separatorView)
        separatorView.anchor(top: middleView.topAnchor, left: nil, bottom: middleView.bottomAnchor, right: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 12, paddingRight: 0, width: 0.5, height: middleView.frame.height)
        separatorView.centerXAnchor.constraint(equalTo: middleView.centerXAnchor).isActive = true
        
        // Create stack views inside containers
        let countryStackView = UIStackView(arrangedSubviews: [self.countryImageView, self.countryLabel])
        countryStackView.translatesAutoresizingMaskIntoConstraints = false
        countryStackView.axis = .vertical
        countryStackView.distribution = .fillProportionally
        countryStackView.alignment = .center
        countryStackView.spacing = 0
        countryView.addSubview(countryStackView)
        countryStackView.anchor(top: countryView.topAnchor, left: countryView.leftAnchor, bottom: countryView.bottomAnchor, right: countryView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        let spotStackView = UIStackView(arrangedSubviews: [self.spotImageView, self.spotLabel])
        spotStackView.translatesAutoresizingMaskIntoConstraints = false
        spotStackView.axis = .vertical
        spotStackView.distribution = .fillProportionally
        spotStackView.alignment = .center
        spotStackView.spacing = 0
        spotView.addSubview(spotStackView)
        spotStackView.anchor(top: spotView.topAnchor, left: spotView.leftAnchor, bottom: spotView.bottomAnchor, right: spotView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        // Create one stack view for all the containers view
        let statStackView = UIStackView(arrangedSubviews: [leftView, spotView, middleView, countryView, rightView])
        statStackView.translatesAutoresizingMaskIntoConstraints = false
        statStackView.axis  = UILayoutConstraintAxis.horizontal
        statStackView.distribution  = UIStackViewDistribution.fillProportionally
        statStackView.alignment = UIStackViewAlignment.center
        
        
        statsBackgroundView.addSubview(statStackView)
        statStackView.anchor(top: statsBackgroundView.topAnchor, left: statsBackgroundView.leftAnchor, bottom: statsBackgroundView.bottomAnchor, right: statsBackgroundView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
    }
    
    
    
    
    func setupProfileImageView() {
        
        addSubview(usernameLabel)
        usernameLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        usernameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        usernameLabel.font = UIFont.systemFont(ofSize: 20)
        usernameLabel.textColor = .white
        
        profilePhotoImage.backgroundColor = .black
        profilePhotoImage.image = UIImage(named: "gates")
        addSubview(profilePhotoImage)
        
        let imageWidth: CGFloat = 100
        profilePhotoImage.anchor(top: usernameLabel.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: imageWidth, height: imageWidth)
        profilePhotoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profilePhotoImage.layer.cornerRadius = imageWidth / 2
        profilePhotoImage.layer.masksToBounds = true
    }
    
    func setupStatStackView() {
        
        //Spot Stack View
        let spotStackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [spotImageView, spotLabel])
            stackView.axis = UILayoutConstraintAxis.vertical
            stackView.distribution  = UIStackViewDistribution.equalSpacing
            stackView.alignment = UIStackViewAlignment.center
            stackView.spacing   = 0.0
            
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        addSubview(spotStackView)
        spotStackView.anchor(top: profilePhotoImage.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 12, paddingLeft: 12, paddingBottom: 0, paddingRight: 0, width: 100, height: 100)
        
        // Country Stack View
        let countryStackView = UIStackView(arrangedSubviews: [countryImageView, countryLabel])
        countryStackView.axis = UILayoutConstraintAxis.vertical
        countryStackView.distribution = UIStackViewDistribution.equalSpacing
        countryStackView.alignment = UIStackViewAlignment.center
        countryStackView.spacing = 0.0
        
        countryStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let statStackView = UIStackView(arrangedSubviews: [countryStackView, verticalSeparatorView, spotStackView])
        statStackView.axis = .horizontal
        statStackView.distribution = .fillEqually
        statStackView.alignment = .center
        
        statStackView.translatesAutoresizingMaskIntoConstraints = false
        
        //        addSubview(statStackView)
        statStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        statStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        
    }
    
    fileprivate func setupSeparator() {
        addSubview(verticalSeparatorView)
        verticalSeparatorView.anchor(top: profilePhotoImage.bottomAnchor, left: nil, bottom: bottomAnchor, right: nil, paddingTop: 12, paddingLeft: 0, paddingBottom: 12, paddingRight: 0, width: 0.5, height: 0)
        verticalSeparatorView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
