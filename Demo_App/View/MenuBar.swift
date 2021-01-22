//
//  menuBar.swift
//  Demo_App
//
//  Created by Naveen on 16/01/21.
//  Copyright © 2021 com.NaveenVangalapudi. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    var demoController : DemoApplicationController?
  lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    
    let cellId = "cellId"
    let titles = ["Users","Enroll"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
      addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: .bottom)
        setupHorizontalBar()
    }
    
    
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        demoController?.scrollToMenuIndex(menuIndex: indexPath.item)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.useEnroll.text = titles[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 2, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

class MenuCell : BaseCell {
    
    let useEnroll : UILabel = {
        let Users = UILabel()
        Users.text = "Users"
        Users.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        Users.textColor = .systemGray
        Users.translatesAutoresizingMaskIntoConstraints = false
        return Users
    }()
    
    override var isHighlighted: Bool {
        didSet{
            useEnroll.textColor = isHighlighted ? UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00) : UIColor.systemGray
        }
    }
    
    override var isSelected: Bool {
        didSet{
            useEnroll.textColor = isSelected ?UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00) : UIColor.systemGray
        }
    }
    override func setupViews() {
        super.setupViews()
       addSubview(useEnroll)
        addConstraint(NSLayoutConstraint(item: useEnroll, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: useEnroll, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
