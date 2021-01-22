//
//  EnrollCell.swift
//  Demo_App
//
//  Created by Naveen on 18/01/21.
//  Copyright © 2021 com.NaveenVangalapudi. All rights reserved.
//

import UIKit
import Firebase

class EnrollCell: UsersCell,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
   let cellIdenroll = "cellIdenroll"
    let template = UIView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
    let labels = ["First Name","Last Name","Date of birth","Gender","Country","State","Home Town","Phone Number","Telephone Number"]

    let db = Firestore.firestore()
    
    var dataFile : [DataFile] = []
    @IBAction func editButtonTapped() -> Void {
        print(FirstLabel.text!)
        print(SecondLabel.text!)
        print(ThirdLabel.text!)
        print(FourthLabel.text!)
        print(FifthLabel.text!)
        print(SixthLabel.text!)
        print(SeventhLabel.text!)
        print(EightLabel.text!)
        print(NinLabel.text!)
        if let FirstLabelText = FirstLabel.text, let SecondLabelText = SecondLabel.text,let ThirdLabelText = ThirdLabel.text,let FourthLabelText = FourthLabel.text,let FifthLabelText = FifthLabel.text,let SixthLabelText = SixthLabel.text,let SeventhLabelText = SeventhLabel.text,let EightLabelText = EightLabel.text,let NinLabelText = NinLabel.text {
            db.collection("userdata").addDocument(data: ["First Name" : FirstLabelText,"Last Name" : SecondLabelText,"Date of Birth" : ThirdLabelText,"Gender" : FourthLabelText,"Country" : FifthLabelText,"State" : SixthLabelText,"HomeTown" : SeventhLabelText,"PhoneNumber" : EightLabelText,"Telephone Number" : NinLabelText,"date" : Date().timeIntervalSince1970]) { (error) in
                if let e = error {
                    print("There was a issue in saving data to firestore \(e)")
                }else {
                    print("successfully saved data")
                }
            }
            
        }
        
        FirstLabel.text = ""
        SecondLabel.text = ""
        ThirdLabel.text = ""
        FourthLabel.text = ""
        FifthLabel.text = ""
        SixthLabel.text = ""
        SeventhLabel.text = ""
        EightLabel.text = ""
        NinLabel.text =  ""

       }

    let profileIG : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "1")
        imageView.layer.cornerRadius=22
        imageView.layer.masksToBounds=true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let TLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Profile Photo"
        label.textColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let UserDataButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        button.setTitle("ADD USER", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let FirstLabel : UITextField = {
        let Firstlb = UITextField()
        let myColor : UIColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        Firstlb.placeholder = "First Name"
        Firstlb.textColor = .lightGray
        Firstlb.borderStyle = .line
        Firstlb.layer.borderColor = myColor.cgColor
        Firstlb.layer.borderWidth = 1
        Firstlb.layer.cornerRadius = 5
        Firstlb.layer.masksToBounds = true
        Firstlb.keyboardAppearance = .default
        Firstlb.font = UIFont(name: "HelveticaNeue", size: 16)
        Firstlb.translatesAutoresizingMaskIntoConstraints = false
        return Firstlb
    }()
    
    let SecondLabel : UITextField = {
        let Secondlb = UITextField()
        let myColor : UIColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        Secondlb.placeholder = "Last Name"
        Secondlb.textColor = .lightGray
        Secondlb.borderStyle = .line
        Secondlb.layer.borderColor = myColor.cgColor
        Secondlb.layer.borderWidth = 1
        Secondlb.layer.cornerRadius = 5
        Secondlb.layer.masksToBounds = true
        Secondlb.keyboardAppearance = .default
        Secondlb.font = UIFont(name: "HelveticaNeue", size: 16)
        Secondlb.translatesAutoresizingMaskIntoConstraints = false
        return Secondlb
    }()
    
    let ThirdLabel : UITextField = {
        let Thirdlb = UITextField()
        let myColor : UIColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        Thirdlb.placeholder = "Date of birth"
        Thirdlb.textColor = .lightGray
        Thirdlb.borderStyle = .line
        Thirdlb.layer.borderColor = myColor.cgColor
        Thirdlb.layer.borderWidth = 1
        Thirdlb.layer.cornerRadius = 5
        Thirdlb.layer.masksToBounds = true
        Thirdlb.keyboardAppearance = .default
        Thirdlb.font = UIFont(name: "HelveticaNeue", size: 16)
        Thirdlb.translatesAutoresizingMaskIntoConstraints = false
        return Thirdlb
    }()
    
    let FourthLabel : UITextField = {
        let Fourthlb = UITextField()
        let myColor : UIColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        Fourthlb.placeholder = "Gender"
        Fourthlb.textColor = .lightGray
        Fourthlb.borderStyle = .line
        Fourthlb.layer.borderColor = myColor.cgColor
        Fourthlb.layer.borderWidth = 1
        Fourthlb.layer.cornerRadius = 5
        Fourthlb.layer.masksToBounds = true
        Fourthlb.keyboardAppearance = .default
        Fourthlb.font = UIFont(name: "HelveticaNeue", size: 16)
        Fourthlb.translatesAutoresizingMaskIntoConstraints = false
        return Fourthlb
    }()

    let FifthLabel : UITextField = {
        let Fifthlb = UITextField()
        let myColor : UIColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        Fifthlb.placeholder = "Country"
        Fifthlb.textColor = .lightGray
        Fifthlb.borderStyle = .line
        Fifthlb.layer.borderColor = myColor.cgColor
        Fifthlb.layer.borderWidth = 1
        Fifthlb.layer.cornerRadius = 5
        Fifthlb.layer.masksToBounds = true
        Fifthlb.keyboardAppearance = .default
        Fifthlb.font = UIFont(name: "HelveticaNeue", size: 16)
        Fifthlb.translatesAutoresizingMaskIntoConstraints = false
        return Fifthlb
    }()

    let SixthLabel : UITextField = {
        let Sixthlb = UITextField()
        let myColor : UIColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        Sixthlb.placeholder = "State"
        Sixthlb.textColor = .lightGray
        Sixthlb.borderStyle = .line
        Sixthlb.layer.borderColor = myColor.cgColor
        Sixthlb.layer.borderWidth = 1
        Sixthlb.layer.cornerRadius = 5
        Sixthlb.layer.masksToBounds = true
        Sixthlb.keyboardAppearance = .default
        Sixthlb.font = UIFont(name: "HelveticaNeue", size: 16)
        Sixthlb.translatesAutoresizingMaskIntoConstraints = false
        return Sixthlb
    }()

    let SeventhLabel : UITextField = {
        let Seventhlb = UITextField()
        let myColor : UIColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        Seventhlb.placeholder = "Home Town"
        Seventhlb.textColor = .lightGray
        Seventhlb.borderStyle = .line
        Seventhlb.layer.borderColor = myColor.cgColor
        Seventhlb.layer.borderWidth = 1
        Seventhlb.layer.cornerRadius = 5
        Seventhlb.layer.masksToBounds = true
        Seventhlb.keyboardAppearance = .default
        Seventhlb.font = UIFont(name: "HelveticaNeue", size: 16)
        Seventhlb.translatesAutoresizingMaskIntoConstraints = false
        return Seventhlb
    }()

    let EightLabel : UITextField = {
        let Eightdlb = UITextField()
        let myColor : UIColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        Eightdlb.placeholder = "Phone Number"
        Eightdlb.textColor = .lightGray
        Eightdlb.borderStyle = .line
        Eightdlb.layer.borderColor = myColor.cgColor
        Eightdlb.layer.borderWidth = 1
        Eightdlb.layer.cornerRadius = 5
        Eightdlb.layer.masksToBounds = true
        Eightdlb.keyboardAppearance = .default
        Eightdlb.font = UIFont(name: "HelveticaNeue", size: 16)
        Eightdlb.translatesAutoresizingMaskIntoConstraints = false
        return Eightdlb
    }()

    let NinLabel : UITextField = {
        let Ninlb = UITextField()
        let myColor : UIColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        Ninlb.placeholder = "Telephone Number"
        Ninlb.textColor = .lightGray
        Ninlb.borderStyle = .line
        Ninlb.layer.borderColor = myColor.cgColor
        Ninlb.layer.borderWidth = 1
        Ninlb.layer.cornerRadius = 5
        Ninlb.layer.masksToBounds = true
        Ninlb.keyboardAppearance = .default
        Ninlb.font = UIFont(name: "HelveticaNeue", size: 16)
        Ninlb.translatesAutoresizingMaskIntoConstraints = false
        return Ninlb
    }()

   

    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        return cv
    }()

    
    override func setupViews() {
//        addSubview(collectionView)
        addSubview(profileIG)
        addSubview(TLabel)
        addSubview(UserDataButton)
        addSubview(FirstLabel)
        addSubview(SecondLabel)
        addSubview(ThirdLabel)
        addSubview(FourthLabel)
        addSubview(FifthLabel)
        addSubview(SixthLabel)
        addSubview(SeventhLabel)
        addSubview(EightLabel)
        addSubview(NinLabel)
        template.backgroundColor = .white
        TLabel.backgroundColor = .white
        UserDataButton.addTarget(self, action: #selector(editButtonTapped), for: UIControl.Event.touchUpInside)
        

//        addConstraintsWithFormat("H:|[v0]|", views: collectionView)
//        addConstraintsWithFormat("V:|[v0(\(frame.height - 30))]|", views: collectionView)

    
        addConstraintsWithFormat("H:|-150-[v0(100)]-150-|", views: profileIG)
        addConstraintsWithFormat("V:|-50-[v0(100)]-16-|", views: profileIG)
        print(frame.width)
        
        
        addConstraintsWithFormat("H:|-125-[v0(\(frame.width/2))]|", views: TLabel)
        addConstraintsWithFormat("V:|-150-[v0(35)]|", views: TLabel)

     

        addConstraintsWithFormat("H:|-16-[v0(\(frame.width - 32))]-16-|", views: FirstLabel)
        addConstraintsWithFormat("V:|-(\(frame.width/2))-[v0(39)]|", views: FirstLabel,SecondLabel)
        
        addConstraintsWithFormat("H:|-16-[v0(\(frame.width - 32))]-16-|", views: SecondLabel)
        addConstraintsWithFormat("V:|-(\(frame.width/2 * 1.25))-[v0(39)]|", views: SecondLabel)

        addConstraintsWithFormat("H:|-16-[v0(\(frame.width - 32))]-16-|", views: ThirdLabel)
        addConstraintsWithFormat("V:|-(\(frame.width/2 * 1.5))-[v0(39)]|", views: ThirdLabel)
        
        addConstraintsWithFormat("H:|-16-[v0(\(frame.width - 32))]-16-|", views: FourthLabel)
        addConstraintsWithFormat("V:|-(\(frame.width/2 * 1.75))-[v0(39)]|", views: FourthLabel)
        
        addConstraintsWithFormat("H:|-16-[v0(\(frame.width - 32))]-16-|", views: FifthLabel)
        addConstraintsWithFormat("V:|-(\(frame.width/2 * 2))-[v0(39)]|", views: FifthLabel)
        
        addConstraintsWithFormat("H:|-16-[v0(\(frame.width - 32))]-16-|", views: SixthLabel)
        addConstraintsWithFormat("V:|-(\(frame.width/2 * 2.25))-[v0(39)]|", views: SixthLabel)
        
        addConstraintsWithFormat("H:|-16-[v0(\(frame.width - 32))]-16-|", views: SeventhLabel)
        addConstraintsWithFormat("V:|-(\(frame.width/2 * 2.5))-[v0(39)]|", views: SeventhLabel)
        
        addConstraintsWithFormat("H:|-16-[v0(\(frame.width - 32))]-16-|", views: EightLabel)
        addConstraintsWithFormat("V:|-(\(frame.width/2 * 2.75))-[v0(39)]|", views: EightLabel)
        
        addConstraintsWithFormat("H:|-16-[v0(\(frame.width - 32))]-16-|", views: NinLabel)
        addConstraintsWithFormat("V:|-(\(frame.width/2 * 3))-[v0(39)]|", views: NinLabel)
        
        
        addConstraintsWithFormat("H:|[v0]|", views: UserDataButton)
        addConstraintsWithFormat("V:|-(\(frame.height - 50))-[v0]|", views: UserDataButton)
        
        
        
////        collectionView.register(enrollCell.self, forCellWithReuseIdentifier: cellIdenroll)
//        collectionView.contentInset = UIEdgeInsets(top: 130, left: 0, bottom: 0, right: 0)
//        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 130, left: 0, bottom: 0, right: 0)
     }
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 9
//    }

// func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdenroll, for: indexPath) as! enrollCell
//    cell.label.placeholder = labels[indexPath.item]
//    UserDataButton.addTarget(self, action: #selector(editButtonTapped), for: UIControl.Event.touchUpInside)
//       return cell
//   }
//  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       frameWidth = Int(frame.width)
//    return CGSize(width: frame.width, height: frame.height / 11)
//   }
// func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//       return 0
//   }
//}

//class enrollCell : BaseCell {
//    override func setupViews() {
//        addSubview(label)
//        addConstraintsWithFormat("H:|-16-[v0(\(frame.width - 32))]-16-|", views: label)
//        addConstraintsWithFormat("V:|[v0(39)]|", views: label)
//
//    }
//    let label : UITextField = {
//        let lb = UITextField()
//        let myColor : UIColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
//        lb.placeholder = "First Name"
//        lb.textColor = .lightGray
//        lb.borderStyle = .line
//        lb.layer.borderColor = myColor.cgColor
//        lb.layer.borderWidth = 1
//        lb.layer.cornerRadius = 5
//        lb.layer.masksToBounds = true
//        lb.keyboardAppearance = .default
//        lb.font = UIFont(name: "HelveticaNeue", size: 16)
//        lb.translatesAutoresizingMaskIntoConstraints = false
//        return lb
//    }()
//}
//
//
}
