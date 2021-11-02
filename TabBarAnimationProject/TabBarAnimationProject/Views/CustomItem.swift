//
//  CustomItem.swift
//  TabBarAnimationProject
//
//  Created by Admin on 02.11.2021.
//

import UIKit


final class CustomItem: UIView {
  
  struct Defaults {
    struct View {
      static let viewCornerRadius: CGFloat = 14
    }
  }
  
  @IBOutlet weak private var viewForStackView: UIView!
  @IBOutlet weak private var imageView: UIImageView!
  @IBOutlet weak private var titleLabel: UILabel!
  
  public struct State {
    let title: String
    let imageAnimation: UIImage
    
    init(title: String, imageAnimation: UIImage) {
      self.title = title
      self.imageAnimation = imageAnimation
    }
  }
  
  public var state: State? {
    didSet {
      configure()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
}

// MARK: - Private extensions
private extension CustomItem {
  func setupUI() {
    viewForStackView.layer.cornerRadius = Defaults.View.viewCornerRadius
    viewForStackView.backgroundColor = Colors.blueColorForBackground
  }
  
  func configure() {
    imageView.image = state?.imageAnimation
    titleLabel.text = state?.title
  }
}

//private extension UIView {
//  func applyStyle() {
//    layer.cornerRadius = frame.size.width / 2
//    clipsToBounds = true
//  }
//}
