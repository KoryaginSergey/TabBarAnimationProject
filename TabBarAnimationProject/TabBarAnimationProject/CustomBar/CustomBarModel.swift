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
//  var modelUsers: [Result] { get }
//  var isFetching: Bool { get }
//  var location: CLLocation? { get }
//  func fetch()
//  func removeFirst()
//  func requestLocation()
}

// MARK: - CustomBarModel
class CustomBarModel: CustomBarModelProtocol {
//  var modelUsers: [Result] = []
//  let locationManager = LocationManager()
//  var location: CLLocation?
//  var page = Page(page: 0, results: 5)
//  var isFetching: Bool = true
  
  // MARK: - CustomBarModel methods
  weak var delegate: CustomBarModelDelegate?
  
  
  
  
  
//  func fetch() {
//    page.page += 1
//    isFetching = true
//    PostServices.shared.fetchRequest(page: page) { [weak self] model in
//      guard let self = self else { return }
//      self.isFetching = false
//      self.modelUsers.append(contentsOf: model.results ?? [])
//      self.delegate?.modelDidChanged(model: self)
//    }
//  }
  
//  func removeFirst() {
//    modelUsers.removeFirst()
//  }
  
//  func requestLocation() {
//    self.locationManager.currentLocationRequest { [weak self] location in
//      guard let self = self else { return }
//      self.location = location
//      self.delegate?.modelDidChanged(model: self)
//    }
//  }
}

