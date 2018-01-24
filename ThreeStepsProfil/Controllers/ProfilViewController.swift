//
//  ViewController.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit

struct UserConnected {
    static var user:User!
}

class ProfilViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    let cellId = "cellId"
    let headerId = "headerId"
    
    var categoryFeed: [Category]? = [
        Category(countryId: "FRANCE", imageUrl: "nat1"),
        Category(countryId: "ESPAGNE", imageUrl: "nat2"),
        Category(countryId: "AUSTRALIE", imageUrl: "nat3"),
        Category(countryId: "MEXIQUE", imageUrl: "nat4"),
        Category(countryId: "TUNISIE", imageUrl: "nat5")
    ]
    
    var categoryToSend: Category?
    var generalSpotList: [Spot]? = []
    var profileImage: UIImage? = nil
    
    let backgroundContainerView: UIView = {
        let v = UIView()
        
        // Background gradient color
        let blueToWhiteLayer = CAGradientLayer()
        blueToWhiteLayer.frame = UIScreen.main.bounds
        blueToWhiteLayer.colors = [UIColor(red: 32/255.5, green: 100/255.5,blue: 178/255.5, alpha: 1.0).cgColor, UIColor.white.cgColor]
        blueToWhiteLayer.locations = [0.0, 0.9, 1.0]
        v.layer.insertSublayer(blueToWhiteLayer, at: 0)
        
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupUser()
        setupNavBar()
        setupCollectionView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setupUser() {
        
        UserConnected.user = User(username: "Billy", profileImageUrl: "gates")
        
        self.profileImage = UIImage(named: UserConnected.user.profileImageUrl)
        self.title = UserConnected.user.username
        
    }
    
    fileprivate func setupNavBar() {
        edgesForExtendedLayout = [.top]
        
        view.addSubview(backgroundContainerView)
        backgroundContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        self.navigationController?.navigationBar.barStyle = .black
        
        // Title
        self.navigationController?.navigationBar.titleTextAttributes = [ NSAttributedStringKey.font: UIFont(name: "HelveticaNeue", size: 18) ?? print("FONT EXISTE PAS"), NSAttributedStringKey.foregroundColor: UIColor.white]
        self.title = UserConnected.user.username
        
        // Navigation bar transparente
        let navBar = self.navigationController?.navigationBar
        navBar?.setBackgroundImage(UIImage(), for: .default)
        
        // Get rid of the separator
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        navBar?.backgroundColor = UIColor.clear
        navBar?.tintColor = .white
        
    }
    
    fileprivate func setupCollectionView() {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let insets: CGFloat = 16
        layout.sectionInset = UIEdgeInsets(top: insets, left: insets, bottom: insets / 2, right: insets)
        let itemWidth: CGFloat = view.bounds.width - (insets * 2)
        let itemHeight: CGFloat = itemWidth / 5 * 2
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        guard let navBarHeight = self.navigationController?.navigationBar.intrinsicContentSize.height else { return }

        print("navBarHeight:",navBarHeight)
        let collectionViewYPosition = UIApplication.shared.statusBarFrame.height + navBarHeight
        let frame = CGRect(x: 0, y: collectionViewYPosition, width: view.frame.width, height: view.frame.height - navBarHeight - (insets * 3/2))
        
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear
        self.backgroundContainerView.addSubview(collectionView)
        
        // Header
        collectionView?.register(ProfilHeaderView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        
        // Cell
        collectionView?.register(ProfilCategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
}

// MARK - Data Source
extension ProfilViewController {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let cellNb = categoryFeed?.count {
            return cellNb
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProfilCategoryCell
        
        cell.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        cell.layer.cornerRadius = 8
        cell.categoryImageView.contentMode = .scaleAspectFill
        
        if let categories = categoryFeed {
            cell.configure(category: categories[indexPath.row])
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! ProfilHeaderView
        
        if let image = self.profileImage {
            header.profileImageView.image = image
        }
        
        if let spotNb = generalSpotList?.count, spotNb != 0 {
            header.spotsLabel.text = "\(spotNb)\nspots"
        } else {
            header.spotsLabel.text = "16\nspots"
        }
        
        if let countryNb = categoryFeed?.count {
            header.countriesLabel.text = "\(countryNb)\npays"
        } else {
            header.countriesLabel.text = "0\npays"
        }
        
        return header
    }
}

// MARK - Delegate
extension ProfilViewController {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("You selected cell #\(indexPath.item)")
        
        let categorySpotsVC = ProfilCategorySpotsVC()
        
        if let categories = categoryFeed {
            categorySpotsVC.categoryToReceive = categories[indexPath.row]
        }
        
        navigationController?.pushViewController(categorySpotsVC, animated: true)
        
    }
}

