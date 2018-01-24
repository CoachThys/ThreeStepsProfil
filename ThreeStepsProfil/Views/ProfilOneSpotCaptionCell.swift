//
//  ProfilOneSpotCaptionCell.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit

class ProfilOneSpotCaptionCell: UITableViewCell {
    
    // MARK - Views
    let containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    lazy var captionLabel : UILabel = {
        let label = UILabel()
        label.text = "Blablabla"
        label.font = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK - Properties
    var spot: Spot? {
        didSet {
            guard let spot = spot else { return }
            captionLabel.text = spot.description
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupContainer()
        
    }
    
    // MARK - Functions
    fileprivate func setupContainer() {
        contentView.addSubview(containerView)
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 6, paddingRight: 12, width: 0, height: 0)
        
        containerView.addSubview(captionLabel)
        captionLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
