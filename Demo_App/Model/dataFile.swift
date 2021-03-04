//
//  dataFile.swift
//  Demo_App
//
//  Created by Naveen on 21/01/21.
//  Copyright © 2021 com.NaveenVangalapudi. All rights reserved.
//

import Foundation

struct DataFile {
    let FirstName : String
    let LastName : String
    let Dateofbirth : String
    let Gender : String
    let countrydata : String
    let statedata : String
    let homeTowndata : String
    let phoneNumberdata : String
    let telephoneNumberdata : String
    
//    let documentID : String
   
    func Age() -> Int {
        var aged : Int = 0
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd-MM-yyyy"
        if let date = dateFormatter.date(from: Dateofbirth) {
            let age = Calendar.current.dateComponents([.year], from: date, to: Date()).year!
            aged = age
        }
        return aged
    }

}

