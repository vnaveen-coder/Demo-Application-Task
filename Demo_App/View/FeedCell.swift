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
    var documentdata = ""
    lazy var collectionView : UICollectionView = {
        let layout = type(of: UICollectionViewFlowLayout()).init()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    var profileImages : [String]  = ["1","2","3","4","5","6","7","8","9","10"]
    var dataFile : [DataFile] = []
    
    
        override  func setupViews() {
        super.setupViews()
        addSubview(collectionView)
        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
            collectionView.register(UsersCell.self, forCellWithReuseIdentifier: UsersCell.identifer)
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
                        let documentId = doc.documentID
                        self.documentdata = documentId
                        if let Fnamedata = data["First Name"] as? String,let Lnamedata = data["Last Name"] as? String,let DOBdata = data["Date of Birth"] as? String,let genderdata = data["Gender"] as? String,let countrydata = data["Country"] as? String,let statedata = data["State"] as? String,let hometowndata = data["HomeTown"] as? String,let phnumberdata = data["PhoneNumber"] as? String,let telnumberdata = data["Telephone Number"] as? String,let URLdata = data["ProfileURL"] as? String{
                            let NewDataFile = DataFile(FirstName: Fnamedata, LastName: Lnamedata, Dateofbirth: DOBdata, Gender: genderdata, countrydata: countrydata, statedata: statedata, homeTowndata: hometowndata, phoneNumberdata: phnumberdata, telephoneNumberdata: telnumberdata, ProfileURLdata: URLdata)
                                self.dataFile.append(NewDataFile)
    
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()
                                print(documentId)
                            }
                        }
                    }
                }
            }
        }
        
    }

    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataFile.count
    }

    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCell.identifer, for: indexPath) as! UsersCell
        cell.titleLabel.text = dataFile[indexPath.item].FirstName
        cell.titleLabel.text?.append(" \(dataFile[indexPath.item].LastName)")
        cell.subtitleTextView.text = dataFile[indexPath.item].Gender
        cell.subtitleTextView.text.append(" | \(dataFile[indexPath.item].Age()) |")
        cell.subtitleTextView.text.append(" \(dataFile[indexPath.item].homeTowndata)")
        if let profileImageUrl = dataFile[indexPath.row].ProfileURLdata as? String {
            let url = NSURL(string: profileImageUrl)
            URLSession.shared.dataTask(with: url! as URL) { (data, response, error) in
                if let error = error {
                    print("error at loading images \(error)")
                }
                DispatchQueue.main.async {
                    cell.userProfileImageView.image = UIImage(data: data!)
                    print("data is being loaded")
                }
            }.resume()
        }
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
