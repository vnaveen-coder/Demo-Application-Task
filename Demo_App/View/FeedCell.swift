//
//  FeedCell.swift
//  Demo_App
//
//  Created by Naveen on 18/01/21.
//  Copyright © 2021 com.NaveenVangalapudi. All rights reserved.
//

import UIKit
import Firebase

class FeedCell: BaseCell,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
  
    let db = Firestore.firestore()
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    let cellId = "cellId"
    var profileImages : [String]  = ["1","2","3","4","5","6","7","8","9","10"]
    var dataFile : [DataFile] = []
    
    
        override  func setupViews() {
        super.setupViews()
        
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        collectionView.register(UsersCell.self, forCellWithReuseIdentifier: cellId)
        loadUserData()
    }
    
    
    func loadUserData() {
        db.collection("userdata").order(by: "date", descending: true).addSnapshotListener { (querySnapshot, error) in
            self.dataFile = []
            if let e = error {
                print("There was an issue in retrieving data from Firebase \(e)  ")
            }else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let Fnamedata = data["First Name"] as? String,let Lnamedata = data["Last Name"] as? String,let DOBdata = data["Date of Birth"] as? String,let genderdata = data["Gender"] as? String,let countrydata = data["Country"] as? String,let statedata = data["State"] as? String,let hometowndata = data["HomeTown"] as? String,let phnumberdata = data["PhoneNumber"] as? String,let telnumberdata = data["Telephone Number"] as? String {
                            let NewDataFile = DataFile(FirstName: Fnamedata, LastName: Lnamedata, Dateofbirth: DOBdata, Gender: genderdata, countrydata: countrydata, statedata: statedata, homeTowndata: hometowndata, phoneNumberdata: phnumberdata, telephoneNumberdata: telnumberdata)
                            self.dataFile.append(NewDataFile)
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    func deleteUserData() {
        db.collection("userdata").document("data").delete()
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFile.count
    }

    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! UsersCell
        cell.titleLabel.text = dataFile[indexPath.item].FirstName
        cell.titleLabel.text?.append(" \(dataFile[indexPath.item].LastName)")
        cell.subtitleTextView.text = dataFile[indexPath.item].Gender
        cell.subtitleTextView.text.append(" | \(dataFile[indexPath.item].Age()) |")
        cell.subtitleTextView.text.append(" \(dataFile[indexPath.item].homeTowndata)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        frameWidth = Int(frame.width)
        return CGSize(width: frame.width, height: frame.height/8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
