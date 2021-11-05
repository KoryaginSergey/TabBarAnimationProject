//
//  Resources.swift
//  TabBarAnimationProject
//
//  Created by Admin on 01.11.2021.
//

import Foundation
import UIKit


struct Resources {
  
  struct Colors {
    static let greyColor = UIColor(red: 180.0/255.0, green: 180.0/255.0, blue: 180.0/255.0, alpha: 1.0)
    static let orangeColor = UIColor(red: 250.0/255.0, green: 145.0/255.0, blue: 45.0/255.0, alpha: 1.0)
    static let blueColorForBackground = UIColor(red: 236.0/255.0, green: 241.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    static let blueColor = UIColor(red: 72.0/255.0, green: 114.0/255.0, blue: 252.0/255.0, alpha: 1.0)
  }
  
  struct Icons {
    static let mailBlackIcon = UIImage(named: "mailBlack")
    static let imageBlackIcon = UIImage(named: "imageBlack")
  }
  
  struct Text {
    static let gifFormat = "gif"
    static let leftTitle = "Kitaplar"
    static let rightTitle = "Magaza"
    static let bookImage = "bookClosed"
    static let bookGif = "book"
    static let homeImage = "homeStand"
    static let homeGif = "home"
    static let defaultString = ""
    static let buttonImage = "focus"
  }
}
