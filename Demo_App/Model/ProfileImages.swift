//
//  ProfileImages.swift
//  Demo_App
//
//  Created by Naveen on 21/01/21.
//  Copyright © 2021 com.NaveenVangalapudi. All rights reserved.
//

import UIKit

struct ProfileImages {
    func profile(input : String) -> UIImage {
        let image : UIImage = UIImage(named: input)!
      return image
    }
}
