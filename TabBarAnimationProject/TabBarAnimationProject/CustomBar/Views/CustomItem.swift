//
//  CustomItem.swift
//  TabBarAnimationProject
//
//  Created by Admin on 02.11.2021.
//

import UIKit
import Kingfisher


final class CustomItem: UIView {
  
  struct Defaults {
    struct View {
      static let viewCornerRadius: CGFloat = 14
    }
  }
  
  private var isActive = false {
    didSet {
      self.reloadTab(animated: true)
    }
  }
  
  @IBOutlet weak var stackView: UIStackView!
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
  
  public func openItem() {
    isActive = true
  }
  
  public func closeItem() {
    isActive = false
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupUI()
  }
}

// MARK: - Private extensions
private extension CustomItem {
  func reloadTab(animated: Bool = false) {
    UIView.animate(withDuration: animated ? 0.25 : 0) { [weak self] in
      guard let self = self else { return }
      self.titleLabel.text = self.isActive ? self.state?.title : ""
      self.viewForStackView.backgroundColor = self.isActive ? Resources.Colors.blueColorForBackground : .clear
      
      if self.isActive {
        guard let path = Bundle.main.url(forResource: "book", withExtension: "gif") else { return }
        let resource = LocalFileImageDataProvider(fileURL: path)
        self.imageView.kf.setImage(with: resource)
      } else {
        self.imageView.image = self.state?.imageAnimation
      }
    }
  }
  
  func setupUI() {
    viewForStackView.layer.cornerRadius = Defaults.View.viewCornerRadius
    viewForStackView.backgroundColor = Resources.Colors.blueColorForBackground
  }
  
  func configure() {
    //    imageView.image = state?.imageAnimation
    //    titleLabel.text = state?.title
    reloadTab()
  }
}

//    let path = Bundle.main.url(forResource: "loading", withExtension: "gif")!
//    let resource = LocalFileImageDataProvider(fileURL: path)
//    imageView.kf.setImage(with: resource)




//private extension UIView {
//  func applyStyle() {
//    layer.cornerRadius = frame.size.width / 2
//    clipsToBounds = true
//  }
//}
