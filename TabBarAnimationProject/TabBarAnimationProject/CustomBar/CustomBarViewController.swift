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
  fileprivate var tempView: CustomBarViewProtocol?
  var customView: CustomBarViewProtocol! {
    return self.view as? CustomBarViewProtocol
  }
  
  // MARK: - Initializers
  init(withView view: CustomBarViewProtocol, model: CustomBarModelProtocol) {
    self.model = model
    self.tempView = view
    super.init(nibName: nil, bundle: nil)
//    self.model.delegate = self
//    customView.contentView.dataSource = self
//    customView.contentView.delegate = self
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
//    model.requestLocation()
//    model.fetch()
  }
}

// MARK: - CustomBarViewDelegate
extension CustomBarViewController: CustomBarViewDelegate {
//  func viewLikeAction(view: CustomBarViewProtocol) {
//    if !model.isFetching {
//      customView.contentView.swipeAction(direction: .right)
//    }
//  }
//
//  func viewDissLikeAction(view: CustomBarViewProtocol) {
//    if !model.isFetching {
//      customView.contentView.swipeAction(direction: .left)
//    }
//  }
}

// MARK: - CustomBarModelDelegate
extension CustomBarViewController: CustomBarModelDelegate {
  func modelDidChanged(model: CustomBarModelProtocol) {
//    customView.contentView.reloadData()
  }
}
