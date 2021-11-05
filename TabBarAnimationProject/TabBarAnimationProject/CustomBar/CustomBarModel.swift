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
  func choseViewLeftAction(view: CustomBarViewProtocol) -> UIViewController
  func choseViewRightAction(view: CustomBarViewProtocol) -> UIViewController
}

// MARK: - CustomBarModel
class CustomBarModel: CustomBarModelProtocol {
  var viewControllers: [UIViewController] = []
  
  // MARK: - CustomBarModel methods
  weak var delegate: CustomBarModelDelegate?
  
  func createViewControllers() {
    let vc1 = UIViewController()
    vc1.view.backgroundColor = .systemGray2
    let vc2 = UIViewController()
    vc2.view.backgroundColor = .systemGray5
    let vc3 = UIViewController()
    vc3.view.backgroundColor = .systemGray4
    viewControllers = [vc1, vc2, vc3]
  }
  
  func choseMenuButtonAction(view: CustomBarViewProtocol) -> UIViewController {
    view.leftCustomBarItem?.closeItem()
    view.rightCustomBarItem?.closeItem()
    let selectedController = viewControllers[1]
    return selectedController
  }
  func choseViewLeftAction(view: CustomBarViewProtocol) -> UIViewController {
    view.leftCustomBarItem?.openItem()
    view.rightCustomBarItem?.closeItem()
    let selectedController = viewControllers[0]
    return selectedController
  }
  func choseViewRightAction(view: CustomBarViewProtocol) -> UIViewController {
    view.rightCustomBarItem?.openItem()
    view.leftCustomBarItem?.closeItem()
    let selectedController = viewControllers[2]
    return selectedController
  }
}
