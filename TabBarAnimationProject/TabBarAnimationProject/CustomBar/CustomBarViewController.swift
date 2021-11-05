//
//  CustomBarViewController.swift
//  TabBarAnimationProject
//
//  Created by Admin on 04.11.2021.
//

import UIKit


// MARK: - CustomBarViewController
final class CustomBarViewController: UIViewController {
  var model: CustomBarModelProtocol
  private var viewControllers: [UIViewController] = []
  fileprivate var tempView: CustomBarViewProtocol?
  var customView: CustomBarViewProtocol! {
    return self.view as? CustomBarViewProtocol
  }
  
  // MARK: - Initializers
  init(withView view: CustomBarViewProtocol, model: CustomBarModelProtocol) {
    self.model = model
    self.tempView = view
    super.init(nibName: nil, bundle: nil)
    self.model.delegate = self
  }
  
  required convenience init?(coder aDecoder: NSCoder) {
    fatalError("This class needs to be initialized with init(withView:model:) method")
  }
  
  // MARK: - View life cycle
  override func loadView() {
    super.loadView()
    self.view = self.tempView
    self.tempView = nil
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.customView.delegate = self
    model.createViewControllers()
    viewMenuButtonAction(view: view as! CustomBarViewProtocol)
  }
}

// MARK: - CustomBarViewDelegate
extension CustomBarViewController: CustomBarViewDelegate {
  func viewMenuButtonAction(view: CustomBarViewProtocol) {
    let selectedController = model.choseMenuButtonAction(view: view)
    addChildController(childController: selectedController)
  }
  
  func viewLeftAction(view: CustomBarViewProtocol) {
    let selectedController = model.choseViewLeftAction(view: view)
    addChildController(childController: selectedController)
  }
  
  func viewRightAction(view: CustomBarViewProtocol) {
    let selectedController = model.choseViewRightAction(view: view)
    addChildController(childController: selectedController)
  }
  
  func addChildController(childController: UIViewController) {
    addChild(childController)
    childController.view.frame = customView.contentView.bounds
    customView.contentView.addSubview(childController.view)
    childController.didMove(toParent: self)
  }
}

// MARK: - CustomBarModelDelegate
extension CustomBarViewController: CustomBarModelDelegate {
  func modelDidChanged(model: CustomBarModelProtocol) {

  }
}
