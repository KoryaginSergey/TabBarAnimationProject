//
//  TabBarController.swift
//  TabBarAnimationProject
//
//  Created by Admin on 31.10.2021.
//

import UIKit

class TabBarController: UITabBarController {
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let items = self.tabBar.items {
      for (index, item) in items.enumerated() {
        item.image = self.getImage(by: index)
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(red: 180.0/255.0, green: 180/255.0, blue: 180/255.0, alpha: 1.0)
//        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(red: 95.0/255.0, green: 122.0/255.0, blue: 150.0/255.0, alpha: 1.0)
        appearance.stackedLayoutAppearance.selected.iconColor = .black
//        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 180.0/255.0, green: 180/255.0, blue: 180/255.0, alpha: 1.0), NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14.0, weight: .semibold)]
//        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 95.0/255.0, green: 122.0/255.0, blue: 150.0/255.0, alpha: 1.0), NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14.0, weight: .semibold)]
        
        item.standardAppearance = appearance
      }
    }
    
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
    
    menuButton.backgroundColor = UIColor(red: 250/255, green: 145/255, blue: 45/255, alpha: 1)
    menuButton.setImage(UIImage(named: "focus")?.withTintColor(.white), for: .normal)
    menuButton.layer.cornerRadius = menuButtonFrame.height/2
    view.addSubview(menuButton)
    
    menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
    
    view.layoutIfNeeded()
  }
  
  // MARK: - Actions
  @objc private func menuButtonAction(sender: UIButton) {
    
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

