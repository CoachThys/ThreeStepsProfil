//
//  ProfilOneSpotLocationCell.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit
import GoogleMaps

class ProfilOneSpotLocationCell: UITableViewCell {
    
    // MARK - Views
    let containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    } ()
    
    let mapContainer: UIView = {
        let v = UIView()
        v.backgroundColor = .yellow
        return v
    }()
    
    var myMapView: UIView = {
        var v = UIView()
        v.backgroundColor = .black
        return v
    } ()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 10.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        //        label.backgroundColor = .orange
        return label
    }()
    
    // MARK - Properties
    var mapIsSet = false
    var spot:Spot? {
        didSet {
            if !mapIsSet {
                setupMap()
                mapIsSet = true
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    // MARK - Functions
    fileprivate func setupViews() {
        contentView.addSubview(containerView)
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 6, paddingLeft: 12, paddingBottom: 12, paddingRight: 12, width: 0, height: 0)
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(mapContainer)
        
        mapContainer.anchor(top: nil, left: containerView.leftAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 250)
        
        titleLabel.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: mapContainer.topAnchor, right: containerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 3, paddingRight: 0, width: 0, height: 0)
        
    }
    
    fileprivate func setupMap() {
        
        GMSServices.provideAPIKey("AIzaSyAYOxXLk6JpFsG3J79xovx3n0a2ZDoCznk")
        
        let camera = GMSCameraPosition.camera(withLatitude: 55.0, longitude: 85.0, zoom: 10)
        myMapView = GMSMapView.map(withFrame: self.mapContainer.bounds, camera: camera)
        myMapView.isUserInteractionEnabled = false
        
        containerView.addSubview(myMapView)
        myMapView.anchor(top: mapContainer.topAnchor, left: mapContainer.leftAnchor, bottom: mapContainer.bottomAnchor, right: mapContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 250)
        
        let marker = GMSMarker()
        marker.position = camera.target
        
//        marker.icon = UIImage(named:"profil-select")
        marker.map = myMapView as? GMSMapView
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
