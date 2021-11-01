//
//  TabBarController.swift
//  TabBarAnimationProject
//
//  Created by Admin on 31.10.2021.
//

import UIKit
import RAMAnimatedTabBarController


class TabBarController: UITabBarController {
  
  struct Defaults {
    struct View {
      static let shadowRadius: CGFloat = 2.0
      static let shadowOpacity: Float = 0.5
      static let shadowOffset: CGSize = CGSize(width: 0, height: 5)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupBarItems()
    setupMiddleButton()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tabBar.backgroundColor = UIColor.white
    
  }
  
  func setupMiddleButton() {
    let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 55, height: 55))
    var menuButtonFrame = menuButton.frame
    menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 40
    menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
    menuButton.frame = menuButtonFrame
    menuButton.backgroundColor = Colors.orangeColor
    menuButton.setImage(UIImage(named: "focus")?.withTintColor(.white), for: .normal)
    menuButton.layer.cornerRadius = menuButtonFrame.height/2
    menuButton.applyStyle()
    view.addSubview(menuButton)
    menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
    view.layoutIfNeeded()
  }
  
  func setupBarItems() {
    if let items = self.tabBar.items {
      for (index, item) in items.enumerated() {
        item.image = self.getImage(by: index)
//        item.value(forKeyPath: "titlePositionAdjustment")
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.iconColor = Colors.greyColor
        appearance.stackedLayoutAppearance.selected.iconColor = .black
        item.standardAppearance = appearance
      }
    }
    
  }
  
  // MARK: - Actions
  @objc private func menuButtonAction(sender: UIButton) {
    let vc = ScanViewController()
    self.present(vc, animated: true, completion: nil)
  }
}

extension TabBarController {
  func getImage(by index: Int) -> UIImage? {
    switch index {
    case 0:
      return UIImage(named: "imageBlack")
    case 1:
      return UIImage(named: "mailBlack")
    default:
      return nil
    }
  }
}

private extension UIButton {
  func applyStyle() {
    clipsToBounds = true
    layer.shadowColor = Colors.orangeColor.cgColor
    layer.shadowOffset = TabBarController.Defaults.View.shadowOffset
    layer.masksToBounds = false
    layer.shadowRadius = TabBarController.Defaults.View.shadowRadius
    layer.shadowOpacity = TabBarController.Defaults.View.shadowOpacity
  }
}

