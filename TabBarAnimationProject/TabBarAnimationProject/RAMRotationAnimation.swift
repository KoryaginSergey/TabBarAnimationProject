//
//  RAMRotationAnimation.swift
//  TabBarAnimationProject
//
//  Created by Admin on 01.11.2021.
//

import QuartzCore
import UIKit
import RAMAnimatedTabBarController


/// The RAMRotationAnimation class provides rotation animation.
open class RAMRotationAnimation: RAMItemAnimation {

    /**
     Animation direction

     - Left:  left direction
     - Right: right direction
     */
    public enum RAMRotationDirection {
        case left
        case right
    }

    /// Animation direction (left, right)
    open var direction: RAMRotationDirection!

    /**
     Start animation, method call when UITabBarItem is selected

     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    open override func playAnimation(_ icon: UIImageView, textLabel: UILabel) {
        playRoatationAnimation(icon)
        textLabel.textColor = textSelectedColor
    }

    /**
     Start animation, method call when UITabBarItem is unselected

     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     - parameter defaultTextColor: default UITabBarItem text color
     - parameter defaultIconColor: default UITabBarItem icon color
     */
    open override func deselectAnimation(_ icon: UIImageView, textLabel: UILabel, defaultTextColor: UIColor, defaultIconColor: UIColor) {
        textLabel.textColor = defaultTextColor

        if let iconImage = icon.image {
            let renderMode = defaultIconColor.cgColor.alpha == 0 ? UIImage.RenderingMode.alwaysOriginal :
                UIImage.RenderingMode.alwaysTemplate
            let renderImage = iconImage.withRenderingMode(renderMode)
            icon.image = renderImage
            icon.tintColor = defaultIconColor
        }
    }

    /**
     Method call when TabBarController did load

     - parameter icon:      animating UITabBarItem icon
     - parameter textLabel: animating UITabBarItem textLabel
     */
    open override func selectedState(_ icon: UIImageView, textLabel: UILabel) {
        textLabel.textColor = textSelectedColor

        if let iconImage = icon.image {
            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
            icon.image = renderImage
            icon.tintColor = iconSelectedColor
        }
    }

    func playRoatationAnimation(_ icon: UIImageView) {

//        let rotateAnimation = CABasicAnimation(keyPath: Constants.AnimationKeys.rotation)
//        rotateAnimation.fromValue = 0.0
//
//        var toValue = CGFloat.pi * 2
//        if direction != nil && direction == RAMRotationDirection.left {
//            toValue = toValue * -1.0
//        }
//
//        rotateAnimation.toValue = toValue
//        rotateAnimation.duration = TimeInterval(duration)
//
//        icon.layer.add(rotateAnimation, forKey: nil)
//
//        if let iconImage = icon.image {
//            let renderImage = iconImage.withRenderingMode(.alwaysTemplate)
//            icon.image = renderImage
//            icon.tintColor = iconSelectedColor
//        }
    }
}

/// The RAMLeftRotationAnimation class provides letf rotation animation.
open class RAMLeftRotationAnimation: RAMRotationAnimation {

    public override init() {
        super.init()
        direction = RAMRotationDirection.left
    }
}

/// The RAMRightRotationAnimation class provides rigth rotation animation.
open class RAMRightRotationAnimation: RAMRotationAnimation {

    public override init() {
        super.init()
        direction = RAMRotationDirection.right
    }
}
