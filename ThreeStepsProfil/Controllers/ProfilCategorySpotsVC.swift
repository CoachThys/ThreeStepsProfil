//
//  ProfilCategorySpotsVC.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit
import CoreLocation

class ProfilCategorySpotsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK - Properties
    let cellId = "cellId"
    var collectionView: UICollectionView!
    var spotList:[Spot] = []
    var imageToSend: UIImage?
    var spotToSend: Spot?
    var allspotsLoaded: Bool = false
    var categoryToReceive: Category?
    let insets: CGFloat = 8
    
    // MARK - Data to fetch
    var categoryDict: [String:[Spot]] = [
        "FRANCE": [
            Spot(imageFileURL: "nature1", description: "Quelle splendeur"),
            Spot(imageFileURL: "nature2", description: "C'est fantastique"),
            Spot(imageFileURL: "nature3", description: "J'en ai les larmes aux yeux"),

        ],
        "ESPAGNE": [
            Spot(imageFileURL: "nature2", description: "Quelle splendeur"),
            Spot(imageFileURL: "nature3", description: "C'est fantastique"),

        ],
        "AUSTRALIE": [
            Spot(imageFileURL: "nature3", description: "Quelle splendeur"),
            Spot(imageFileURL: "nature4", description: "C'est fantastique"),
            Spot(imageFileURL: "nature5", description: "J'en ai les larmes aux yeux"),
            Spot(imageFileURL: "nature6", description: "Vivre libre les amis"),
        ],
        "MEXIQUE": [
            Spot(imageFileURL: "nature4", description: "Quelle splendeur"),
            Spot(imageFileURL: "nature5", description: "C'est fantastique"),
            Spot(imageFileURL: "nature6", description: "J'en ai les larmes aux yeux"),
            Spot(imageFileURL: "nature7", description: "Vivre libre les amis"),
            Spot(imageFileURL: "nature8", description: "Venez voir comme c'est beau ici")
        ],
        "TUNISIE": [
            Spot(imageFileURL: "nature5", description: "Quelle splendeur"),
            Spot(imageFileURL: "nature6", description: "C'est fantastique"),
            Spot(imageFileURL: "nature7", description: "J'en ai les larmes aux yeux"),
            Spot(imageFileURL: "nature8", description: "Vivre libre les amis"),
            Spot(imageFileURL: "nature9", description: "Venez voir comme c'est beau ici")
        ]
    ]

    // MARK - Setup Views
    let backgroundContainerView: UIView = {
        let view = UIView()
        
        // Background Gradient color
        let blueToWhiteLayer = CAGradientLayer()
        blueToWhiteLayer.frame = UIScreen.main.bounds
        blueToWhiteLayer.colors = [UIColor(red: 32/255.5, green: 100/255.5,blue: 178/255.5, alpha: 1.0).cgColor, UIColor.white.cgColor]
        blueToWhiteLayer.locations = [0.0, 0.9, 1.0]
        view.layer.insertSublayer(blueToWhiteLayer, at: 0)
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundView()
        setupNavBar()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let currentCategory = categoryToReceive else { return }
        if let list = categoryDict[currentCategory.countryId] {
            self.spotList = list
        }
    }
    
    fileprivate func setupBackgroundView() {
        view.addSubview(backgroundContainerView)
        backgroundContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    fileprivate func setupNavBar() {
        
        self.navigationController?.navigationBar.barStyle = .black
        // Title
        self.navigationController?.navigationBar.tintColor = .white
        
        guard let category = categoryToReceive else {
            print("La catégorie n'existe pas")
            return
        }
        navigationItem.title = category.countryId
        
        // Navigation bar transparente
        let navBar = self.navigationController?.navigationBar
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        navBar?.backgroundColor = UIColor.clear
    }
    
    fileprivate func setupCollectionView() {
        // Do any additional setup after loading the view.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets)
        let itemWidth: CGFloat = (view.bounds.width - insets * 3) / 2
        let itemHeight: CGFloat = itemWidth
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        guard let navBarHeight = self.navigationController?.navigationBar.intrinsicContentSize.height else { return }
        print("nabBarHeight:", navBarHeight)
        
        let collectionViewYPosition = UIApplication.shared.statusBarFrame.height + navBarHeight
        
        let frame = CGRect(x: 0, y: collectionViewYPosition, width: view.frame.width, height: view.frame.height - navBarHeight - 2 * insets)
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        self.backgroundContainerView.addSubview(collectionView)
        
        // Cell
        collectionView?.register(ProfilCategorySpotsCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
}

// MARK - CollectionView DataSource
extension ProfilCategorySpotsVC {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return spotList.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProfilCategorySpotsCell
        
        cell.backgroundColor = .clear
        cell.spotImageView.contentMode = .scaleAspectFill
        cell.layer.cornerRadius = 5
        
        let currentSpot = self.spotList[indexPath.row]
        
        cell.configure(spot: currentSpot)
        self.imageToSend = cell.spotImageView.image
        
        return cell
    }
}

// MARK - CollectionView Delegate
extension ProfilCategorySpotsVC {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let userSpotDetail = ProfilOneSpotVC()
        let spotSelected = spotList[indexPath.item]
        
        userSpotDetail.spotToReceive = spotSelected

        navigationController?.pushViewController(userSpotDetail, animated: true)
    }
    
}




