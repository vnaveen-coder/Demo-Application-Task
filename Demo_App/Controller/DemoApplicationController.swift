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
import Firebase
class DemoApplicationController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //title Label
        navigationController?.navigationBar.isTranslucent = false
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 250, height: view.frame.height))
        titleLabel.text = "Demo Application"
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        navigationItem.titleView = titleLabel
        titleLabel.textColor = UIColor(red: 0.12, green: 0.56, blue: 1.00, alpha: 1.00)
        setupMenuBar()
        setupCollectionView()
    }
    

   lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.demoController = self
        return mb
    }()
    
   lazy var enroll: EnrollCell = {
        let en = EnrollCell()
        en.delegate = self
        return en
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat("V:|[v0(50)]", views: menuBar)
    }
    
    func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        collectionView?.backgroundColor = .white
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: UsersCell.identifer)
        collectionView?.register(EnrollCell.self, forCellWithReuseIdentifier: EnrollCell.identifier)
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.isPagingEnabled = true
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 2
       
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexPath = IndexPath(item: index, section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
   
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCell.identifer, for: indexPath)
        if indexPath.item == 1 {
            return collectionView.dequeueReusableCell(withReuseIdentifier: EnrollCell.identifier, for: indexPath)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 60)
    }
    
}

extension DemoApplicationController : UIImagePickerControllerDelegate,UINavigationControllerDelegate,pickTheImageDelegate{
    
        func pickTheImage() {
        print(123)
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
                print("imagepicked")
                enroll.profileIG.image=image
            }
            dismiss(animated: true, completion: nil)
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
    }
   
}
    


