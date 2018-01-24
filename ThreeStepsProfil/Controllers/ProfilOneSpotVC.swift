//
//  ProfilOneSpotVC.swift
//  ThreeStepsProfil
//
//  Created by CoachThys on 24/01/2018.
//  Copyright © 2018 CoachThys. All rights reserved.
//

import UIKit

class ProfilOneSpotVC: UIViewController, UITableViewDelegate {
    
    let backgroundContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = .yellow
        return v
    }()
    
    let defaultCellId = "defaultCellId"
    let imageCellId = "imageCellId"
    let userCellId = "userCellId"
    let captionCellId = "captionCellId"
    
    var tableView: UITableView!
    var spotToReceive: Spot! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(backgroundContainerView)
        backgroundContainerView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)

        setupNavBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        setupTableView()
        
        UIApplication.shared.isStatusBarHidden = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.isStatusBarHidden = false

    }
    
    fileprivate func setupNavBar() {
        
        // Navigation bar transparente
        let navBar = self.navigationController?.navigationBar
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.shadowImage = UIImage()
        navBar?.isTranslucent = true
        navBar?.backgroundColor = UIColor.clear
        navBar?.tintColor = .white
        
    }
    
    fileprivate func setupTableView() {
        
        tableView = UITableView()
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        
        guard let navBarHeight = self.navigationController?.navigationBar.intrinsicContentSize.height else { return }
        
        tableView.contentInset = UIEdgeInsets(top: -navBarHeight, left: 0, bottom: 0, right: 0)
        tableView.scrollIndicatorInsets = UIEdgeInsets(top: -navBarHeight, left: 0, bottom: 0, right: 0)
        
        backgroundContainerView.addSubview(tableView)
        tableView.anchor(top: backgroundContainerView.topAnchor, left: backgroundContainerView.leftAnchor, bottom: backgroundContainerView.bottomAnchor, right: backgroundContainerView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        //        self.edgesForExtendedLayout = []
        //        self.extendedLayoutIncludesOpaqueBars = true
        //        self.automaticallyAdjustsScrollViewInsets = false
        
        tableView.backgroundColor = .lightGray
        tableView.separatorColor = .clear
        
        tableView.register(ProfilOneSpotImageCell.self, forCellReuseIdentifier: imageCellId)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: defaultCellId)
        tableView.register(ProfilOneSpotUserCell.self, forCellReuseIdentifier: userCellId)
        tableView.register(ProfilOneSpotCaptionCell.self, forCellReuseIdentifier: captionCellId)
        
        tableView.delegate = self
        tableView.dataSource = self        
    }
}

// MARK - TableView Datasource
extension ProfilOneSpotVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: imageCellId, for: indexPath) as! ProfilOneSpotImageCell
            cell.spot = spotToReceive
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: userCellId, for: indexPath) as! ProfilOneSpotUserCell
            
            cell.spot = spotToReceive
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: captionCellId, for: indexPath) as! ProfilOneSpotCaptionCell
            cell.spot = spotToReceive
            return cell

            cell.spot = spotToReceive
            //            cell.titleLabel.text = spotToReceive.description
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: defaultCellId, for: indexPath)
            cell.backgroundColor = .green
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return UIScreen.main.bounds.width
        case 1:
            return UITableViewAutomaticDimension
        case 2:
            return UITableViewAutomaticDimension
        case 3:
            return UITableViewAutomaticDimension
        default:
            return 100
        }
    }
    
}


