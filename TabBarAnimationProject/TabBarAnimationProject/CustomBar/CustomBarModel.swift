//
//  CustomBarModel.swift
//  TabBarAnimationProject
//
//  Created by Admin on 04.11.2021.
//

import UIKit


// MARK: - CustomBarModelDelegate
protocol CustomBarModelDelegate: AnyObject {
  func modelDidChanged(model: CustomBarModelProtocol)
}

// MARK: - CustomBarModelProtocol
protocol CustomBarModelProtocol: AnyObject {
  var delegate: CustomBarModelDelegate? { get set }
  var viewControllers: [UIViewController] { get }
  
  func createViewControllers()
  func choseMenuButtonAction(view: CustomBarViewProtocol) -> UIViewController
}

// MARK: - CustomBarModel
class CustomBarModel: CustomBarModelProtocol {
  var viewControllers: [UIViewController] = []
  
  // MARK: - CustomBarModel methods
  weak var delegate: CustomBarModelDelegate?
  
  func createViewControllers() {
    let vc1 = UIViewController()
    vc1.view.backgroundColor = .lightGray
    let vc2 = UIViewController()
    vc2.view.backgroundColor = .gray
    let vc3 = UIViewController()
    vc3.view.backgroundColor = .darkGray
    viewControllers = [vc1, vc2, vc3]
  }
  
  func choseMenuButtonAction(view: CustomBarViewProtocol) -> UIViewController {
    view.leftCustomBarItem?.closeItem()
    view.rightCustomBarItem?.closeItem()
    let selectedController = viewControllers[1]
    return selectedController
  }
}
