//
//  ViewController.swift
//  Demo_App
//
//  Created by Naveen on 16/01/21.
//  Copyright © 2021 com.NaveenVangalapudi. All rights reserved.
//
//

import UIKit

var frameWidth = 0
class DemoApplicationController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let profileImages  = ["1","2","3","4","5","6","7","8","9","10"]
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 250, height: view.frame.height))
        titleLabel.text = "Demo Application"
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        navigationItem.titleView = titleLabel
        titleLabel.textColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        collectionView?.backgroundColor = .white
        collectionView.register(UsersCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupMenuBar()
    }
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! UsersCell
        cell.userProfileImageView.image = UIImage(named: profileImages[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        frameWidth = Int(view.frame.width)
        return CGSize(width: view.frame.width, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



