//
//  CustomBar.swift
//  TabBarAnimationProject
//
//  Created by Admin on 04.11.2021.
//

import UIKit
import Kingfisher


// MARK: - CustomBarViewDelegate
protocol CustomBarViewDelegate: AnyObject {
  func viewMenuButtonAction(view: CustomBarViewProtocol)
  func viewLeftAction(view: CustomBarViewProtocol)
  func viewRightAction(view: CustomBarViewProtocol)
}

// MARK: - CustomBarViewProtocol
protocol CustomBarViewProtocol: UIView {
  var delegate: CustomBarViewDelegate? { get set }
  var leftCustomBarItem: CustomItem? { get }
  var rightCustomBarItem: CustomItem? { get }
  var contentView: UIView! { get }
}

// MARK: - CustomBarView
final class CustomBarView: UIView, CustomBarViewProtocol {
  
  struct Defaults {
    struct View {
      static let shadowRadius: CGFloat = 2.0
      static let shadowOpacity: Float = 0.5
      static let shadowOffset: CGSize = CGSize(width: 0, height: 5)
    }
  }
  
  @IBOutlet weak private var leftView: UIView!
  @IBOutlet weak private var middleView: UIView!
  @IBOutlet weak private var rightView: UIView!
  @IBOutlet internal weak var contentView: UIView!
  @IBOutlet weak private var tabBar: UIStackView!
  internal var leftCustomBarItem: CustomItem?
  internal var rightCustomBarItem: CustomItem?
  
  weak var delegate: CustomBarViewDelegate?
  
  // MARK: - Overrided methods
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
    setupMiddleButton()
    menuButtonAction()
  }
  
  func setupMiddleButton() {
    let menuButton = UIButton(frame: CGRect(x: 0, y: -15, width: 65, height: 65))
    menuButton.backgroundColor = Resources.Colors.orangeColor
    menuButton.setImage(UIImage(named: Resources.Text.buttonImage)?.withTintColor(.white), for: .normal)
    menuButton.layer.cornerRadius = menuButton.frame.height/2
    menuButton.applyStyle()
    middleView.addSubview(menuButton)
    menuButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
    self.layoutIfNeeded()
  }
}

// MARK: - Private extensions
private extension CustomBarView {
  func setup() {
    let leftCustomBarItem: CustomItem = CustomItem.create()
    guard let imageForLeftAnimation = UIImage(named: Resources.Text.bookImage) else { return }
    leftCustomBarItem.state = .init(title: Resources.Text.leftTitle,
                                    imageAnimation: imageForLeftAnimation,
                                    pathGif: Resources.Text.bookGif)
    leftView.addSubview(leftCustomBarItem)
    leftCustomBarItem.translatesAutoresizingMaskIntoConstraints = false
    leftCustomBarItem.layoutAttachAll(to: leftView)
    leftCustomBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(leftAction)))
    leftView.clipsToBounds = true
    self.leftCustomBarItem = leftCustomBarItem
    
    let rightCustomBarItem: CustomItem = CustomItem.create()
    guard let imageForRightAnimation = UIImage(named: Resources.Text.homeImage) else { return }
    rightCustomBarItem.state = .init(title: Resources.Text.rightTitle,
                                     imageAnimation: imageForRightAnimation,
                                     pathGif: Resources.Text.homeGif)
    rightView.addSubview(rightCustomBarItem)
    rightCustomBarItem.translatesAutoresizingMaskIntoConstraints = false
    rightCustomBarItem.layoutAttachAll(to: rightView)
    rightCustomBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rightAction)))
    rightView.clipsToBounds = true
    self.rightCustomBarItem = rightCustomBarItem
  }
}

//MARK: - Actions
private extension CustomBarView {
  @objc
  func menuButtonAction() {
    self.delegate?.viewMenuButtonAction(view: self)
  }
  
  @objc
  func leftAction() {
    self.delegate?.viewLeftAction(view: self)
  }
  
  @objc
  func rightAction() {
    self.delegate?.viewRightAction(view: self)
  }
}

private extension UIButton {
  func applyStyle() {
    clipsToBounds = true
    layer.shadowColor = Resources.Colors.orangeColor.cgColor
    layer.shadowOffset = CustomBarView.Defaults.View.shadowOffset
    layer.masksToBounds = false
    layer.shadowRadius = CustomBarView.Defaults.View.shadowRadius
    layer.shadowOpacity = CustomBarView.Defaults.View.shadowOpacity
  }
}


