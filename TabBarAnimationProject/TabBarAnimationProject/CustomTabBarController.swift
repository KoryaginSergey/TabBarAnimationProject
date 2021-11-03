//
//  CustomTabBarController.swift
//  TabBarAnimationProject
//
//  Created by macuser on 03.11.2021.
//

import UIKit
import Kingfisher


class CustomTabBarController: UIViewController {
  
  struct Defaults {
    struct View {
      static let shadowRadius: CGFloat = 2.0
      static let shadowOpacity: Float = 0.5
      static let shadowOffset: CGSize = CGSize(width: 0, height: 5)
    }
  }
  
  @IBOutlet weak var leftView: UIView!
  @IBOutlet weak var middleView: UIView!
  @IBOutlet weak var rightView: UIView!
  @IBOutlet weak var labelForBorder: UILabel!
  private var leftCustomBarItem: CustomItem?
  private var rightCustomBarItem: CustomItem?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
    setupMiddleButton()
  }
  
  func setupMiddleButton() {
    let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
    var menuButtonFrame = menuButton.frame
    menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 40
    menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
    menuButton.frame = menuButtonFrame
    menuButton.backgroundColor = Resources.Colors.orangeColor
    menuButton.setImage(UIImage(named: "focus")?.withTintColor(.white), for: .normal)
    menuButton.layer.cornerRadius = menuButtonFrame.height/2
    menuButton.applyStyle()
    view.addSubview(menuButton)
    menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
    view.layoutIfNeeded()
  }
  
  // MARK: - Actions
  @objc private func menuButtonAction(sender: UIButton) {
    let viewController = ScanViewController()
    self.present(viewController, animated: true, completion: nil)
  }
}

// MARK: - Private extensions
private extension CustomTabBarController {
  func setup() {
    
    let leftCustomBarItem: CustomItem = CustomItem.create()
    leftCustomBarItem.state = .init(title: "Kitaplar", imageAnimation: UIImage(named: "openBook")!.withTintColor(Resources.Colors.blueColor))
    leftView.addSubview(leftCustomBarItem)
    leftCustomBarItem.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      leftCustomBarItem.topAnchor.constraint(equalTo: leftView.topAnchor),
      leftCustomBarItem.bottomAnchor.constraint(equalTo: leftView.bottomAnchor),
      leftCustomBarItem.leftAnchor.constraint(equalTo: leftView.leftAnchor),
      leftCustomBarItem.rightAnchor.constraint(equalTo: leftView.rightAnchor)
    ])
    self.leftCustomBarItem = leftCustomBarItem
    
    let rightCustomBarItem: CustomItem = CustomItem.create()
    rightCustomBarItem.state = .init(title: "Magaza", imageAnimation: UIImage(named: "shop")!.withTintColor(Resources.Colors.blueColor))
    rightView.addSubview(rightCustomBarItem)
    rightCustomBarItem.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      rightCustomBarItem.topAnchor.constraint(equalTo: rightView.topAnchor),
      rightCustomBarItem.bottomAnchor.constraint(equalTo: rightView.bottomAnchor),
      rightCustomBarItem.leftAnchor.constraint(equalTo: rightView.leftAnchor),
      rightCustomBarItem.rightAnchor.constraint(equalTo: rightView.rightAnchor)
    ])
    self.rightCustomBarItem = rightCustomBarItem
  }
}

private extension UIButton {
  func applyStyle() {
    clipsToBounds = true
    layer.shadowColor = Resources.Colors.orangeColor.cgColor
    layer.shadowOffset = CustomTabBarController.Defaults.View.shadowOffset
    layer.masksToBounds = false
    layer.shadowRadius = CustomTabBarController.Defaults.View.shadowRadius
    layer.shadowOpacity = CustomTabBarController.Defaults.View.shadowOpacity
  }
}
