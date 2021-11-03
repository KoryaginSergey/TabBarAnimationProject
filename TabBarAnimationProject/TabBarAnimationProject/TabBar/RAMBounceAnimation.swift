//
//  RAMBounceAnimation.swift
//  TabBarAnimationProject
//
//  Created by Admin on 01.11.2021.
//

import Foundation
import RAMAnimatedTabBarController


class RAMBounceAnimation : RAMItemAnimation {
  
  override func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
    playBounceAnimation(icon)
    textLabel.textColor = .black
  }
  
  override func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
    textLabel.textColor = Resources.Colors.greyColor
    icon.tintColor = Resources.Colors.greyColor
  }
  
  override func deselectedState(_ icon: UIImageView, textLabel: UILabel) {
    textLabel.textColor = Resources.Colors.greyColor
    if let iconImage = icon.image {
      let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
      icon.image = renderImage
      icon.tintColor = Resources.Colors.greyColor
    }
  }
  
  override func selectedState(_ icon: UIImageView, textLabel: UILabel) {
    textLabel.textColor = .black
    if let iconImage = icon.image {
      let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
      icon.image = renderImage
      icon.tintColor = .black
    }
  }
  
  func playBounceAnimation(_ icon : UIImageView) {
    let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
    bounceAnimation.values = [1.0 ,1.4, 0.9, 1.15, 0.95, 1.02, 1.0]
    bounceAnimation.duration = TimeInterval(duration)
    bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
    icon.layer.add(bounceAnimation, forKey: "bounceAnimation")
    
    if let iconImage = icon.image {
      let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
      icon.image = renderImage
      icon.tintColor = .black
    }
  }
}

