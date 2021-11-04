//
//  CustomBarBuilder.swift
//  TabBarAnimationProject
//
//  Created by Admin on 04.11.2021.
//

import UIKit


class CustomBarBuilder: NSObject {
  class func viewController() -> CustomBarViewController {
    let view = CustomBarView.create() as CustomBarViewProtocol
    let model: CustomBarModelProtocol = CustomBarModel()
    let viewController = CustomBarViewController(withView: view, model: model)
    return viewController
  }
}
