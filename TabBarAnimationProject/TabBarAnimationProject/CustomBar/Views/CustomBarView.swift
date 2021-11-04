//
//  CustomBar.swift
//  TabBarAnimationProject
//
//  Created by Admin on 04.11.2021.
//

import UIKit
import Kingfisher

  
  // MARK: - CustomBarViewDelegate
  protocol CustomBarViewDelegate: class {
    
//    func viewContinueAction(view: CustomBarViewProtocol)
  }

  // MARK: - CustomBarViewProtocol
  protocol CustomBarViewProtocol: UIView {
    
//    func setState(_ state: CustomItem.State)
    var delegate: CustomBarViewDelegate? { get set }
  }

  // MARK: - CustomBarView
  class CustomBarView: UIView, CustomBarViewProtocol {
    
//    let inputMailView: TextInputFieldView = TextInputFieldView.create()
    
//    func setState(_ state: TextInputFieldView.State) {
//      inputMailView.snapshot = state
//    }
    
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
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBar: UIStackView!
    private var leftCustomBarItem: CustomItem?
    private var rightCustomBarItem: CustomItem?
    
    private var viewControllers: [UIViewController] = []
    
    weak var delegate: CustomBarViewDelegate?
    
    
    // MARK: - Overrided methods
    override func awakeFromNib() {
      super.awakeFromNib()
      
      let vc1 = UIViewController()
      vc1.view.backgroundColor = .red
      
      let vc2 = UIViewController()
      vc2.view.backgroundColor = .orange
      
      let vc3 = UIViewController()
      vc3.view.backgroundColor = .green
      
      viewControllers = [vc1, vc2, vc3]
      
      setup()
      setupMiddleButton()
      menuButtonAction()
      
//      setupUI()
//      setValuesForgotPasswordView()
    }
    
//    @IBAction func continueButton(_ sender: Any) {
//      self.delegate?.viewContinueAction(view: self)
//    }
    
    func setupMiddleButton() {
      let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
      var menuButtonFrame = menuButton.frame
      menuButtonFrame.origin.y = self.bounds.height - menuButtonFrame.height - 120
      menuButtonFrame.origin.x = self.bounds.width/2 - menuButtonFrame.size.width/2
      menuButton.frame = menuButtonFrame
      menuButton.backgroundColor = Resources.Colors.orangeColor
      menuButton.setImage(UIImage(named: "focus")?.withTintColor(.white), for: .normal)
      menuButton.layer.cornerRadius = menuButtonFrame.height/2
      menuButton.applyStyle()
      self.addSubview(menuButton)
      menuButton.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
      self.layoutIfNeeded()
    }
  }

// MARK: - Private extensions
private extension CustomBarView {
  func setup() {
    
    let leftCustomBarItem: CustomItem = CustomItem.create()
    leftCustomBarItem.state = .init(title: "Kitaplar", imageAnimation: UIImage(named: "bookClosed")!)
    leftView.addSubview(leftCustomBarItem)
    leftCustomBarItem.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      leftCustomBarItem.topAnchor.constraint(equalTo: leftView.topAnchor),
      leftCustomBarItem.bottomAnchor.constraint(equalTo: leftView.bottomAnchor),
      leftCustomBarItem.leftAnchor.constraint(equalTo: leftView.leftAnchor),
      leftCustomBarItem.rightAnchor.constraint(equalTo: leftView.rightAnchor)
    ])
    leftCustomBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(leftAction)))
    self.leftCustomBarItem = leftCustomBarItem
    
    let rightCustomBarItem: CustomItem = CustomItem.create()
    rightCustomBarItem.state = .init(title: "Magaza", imageAnimation: UIImage(named: "homeStand")!)
    rightView.addSubview(rightCustomBarItem)
    rightCustomBarItem.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      rightCustomBarItem.topAnchor.constraint(equalTo: rightView.topAnchor),
      rightCustomBarItem.bottomAnchor.constraint(equalTo: rightView.bottomAnchor),
      rightCustomBarItem.leftAnchor.constraint(equalTo: rightView.leftAnchor),
      rightCustomBarItem.rightAnchor.constraint(equalTo: rightView.rightAnchor)
    ])
    rightCustomBarItem.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(rightAction)))
    self.rightCustomBarItem = rightCustomBarItem
  }
}

//MARK: - Actions
private extension CustomBarView {
  
  @objc
  func menuButtonAction() {
    self.leftCustomBarItem?.closeItem()
    self.rightCustomBarItem?.closeItem()
    let selectedController = viewControllers[1]
    
//    addChild(selectedController)
//    selectedController.view.frame = contentView.bounds
//    contentView.addSubview(selectedController.view)
//    selectedController.didMove(toParent: self)
  }
  
  @objc
  func leftAction() {
    self.leftCustomBarItem?.openItem()
    self.rightCustomBarItem?.closeItem()
    guard let selectedController = viewControllers.first else { return }
    
//    addChild(selectedController)
//    selectedController.view.frame = contentView.bounds
//    contentView.addSubview(selectedController.view)
//    selectedController.didMove(toParent: self)
  }
  
  @objc
  func rightAction() {
    self.rightCustomBarItem?.openItem()
    self.leftCustomBarItem?.closeItem()
    
    guard let selectedController = viewControllers.last else { return }
    
//    addChild(selectedController)
//    selectedController.view.frame = contentView.bounds
//    contentView.addSubview(selectedController.view)
//    selectedController.didMove(toParent: self)
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


