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
      static let viewCornerRadius: CGFloat = 20
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
    let pathGif: String
    
    init(title: String, imageAnimation: UIImage, pathGif: String) {
      self.title = title
      self.imageAnimation = imageAnimation
      self.pathGif = pathGif
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
      self.titleLabel.text = self.isActive ? self.state?.title : Resources.Text.defaultString
      self.viewForStackView.backgroundColor = self.isActive ? Resources.Colors.blueColorForBackground : .clear
      
      if self.isActive {
        guard let path = Bundle.main.url(forResource: self.state?.pathGif,
                                         withExtension: Resources.Text.gifFormat) else { return }
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
    reloadTab()
  }
}
