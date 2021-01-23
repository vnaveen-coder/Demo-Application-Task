//
//  UserCell.swift
//  Demo_App
//
//  Created by Naveen on 16/01/21.
//  Copyright © 2021 com.NaveenVangalapudi. All rights reserved.
//

import UIKit
import Firebase


class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
}




class UsersCell: BaseCell {
    
    let db = Firestore.firestore()
    let feedCell = FeedCell()
    let thumbnailImage : UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let userProfileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.layer.cornerRadius=22
        imageView.layer.masksToBounds=true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let seperatorView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Taylor Swift"
        label.textColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Female | 25 | New York"
        textView.textContainerInset = UIEdgeInsets(top: -3, left: -4, bottom:  0, right: 0)
        textView.textColor = .lightGray
        textView.font = UIFont(name: "HelveticaNeue", size: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let deleteButton : UIButton = {
        let image = UIImage(named: "delete") as UIImage?
        let button   = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @IBAction func btnTouched() -> Void {
        
        db.collection("userdata").document("\(feedCell.documentdata)").delete(){ err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
//                }
                
            }
        }
        
    }
    

    override func setupViews() {
        addSubview(thumbnailImage)
        addSubview(seperatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        addSubview(deleteButton)
        
        
        deleteButton.addTarget(self, action: #selector(btnTouched), for: UIControl.Event.touchUpInside)
        //horizontal
        addConstraintsWithFormat("H:|-16-[v0(54)]-8-[v1(\(frameWidth-146))]-8-[v2(34)]-16-|", views: userProfileImageView,titleLabel,deleteButton)
//        //vertical
        addConstraintsWithFormat("V:|-16-[v0(54)]-[v1(1)]|", views: userProfileImageView,seperatorView)
        addConstraintsWithFormat("V:|-16-[v0(20)]|", views: titleLabel)
        addConstraintsWithFormat("V:|-16-[v0(34)]", views: deleteButton)
        addConstraintsWithFormat("H:|[v0]|", views: seperatorView)
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        // left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: titleLabel, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
    }
    

}


