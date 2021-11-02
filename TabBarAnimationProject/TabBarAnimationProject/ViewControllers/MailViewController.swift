//
//  MailViewController.swift
//  TabBarAnimationProject
//
//  Created by Admin on 31.10.2021.
//

import UIKit
import Comets
import RAMAnimatedTabBarController


class MailViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Customize your comet
    let width = view.bounds.width
    let height = view.bounds.height
    let comets = [Comet(startPoint: CGPoint(x: 100, y: 0),
                        endPoint: CGPoint(x: 0, y: 100),
                        lineColor: UIColor.white.withAlphaComponent(0.2),
                        cometColor: UIColor.white),
                  Comet(startPoint: CGPoint(x: 0.4 * width, y: 0),
                        endPoint: CGPoint(x: width, y: 0.8 * width),
                        lineColor: UIColor.white.withAlphaComponent(0.2),
                        cometColor: UIColor.white),
                  Comet(startPoint: CGPoint(x: 0.8 * width, y: 0),
                        endPoint: CGPoint(x: width, y: 0.5 * width),
                        lineColor: UIColor.white.withAlphaComponent(0.2),
                        cometColor: UIColor.white),
                  Comet(startPoint: CGPoint(x: width, y: 0.2 * height),
                        endPoint: CGPoint(x: 0, y: 0.25 * height),
                        lineColor: UIColor.white.withAlphaComponent(0.2),
                        cometColor: UIColor.white),
                  Comet(startPoint: CGPoint(x: 0, y: height - 0.8 * width),
                        endPoint: CGPoint(x: 0.6 * width, y: height),
                        lineColor: UIColor.white.withAlphaComponent(0.2),
                        cometColor: UIColor.white),
                  Comet(startPoint: CGPoint(x: width - 100, y: height),
                        endPoint: CGPoint(x: width, y: height - 100),
                        lineColor: UIColor.white.withAlphaComponent(0.2),
                        cometColor: UIColor.white),
                  Comet(startPoint: CGPoint(x: width, y: 0),
                        endPoint: CGPoint(x: 0, y: height/2),
                        lineColor: UIColor.white.withAlphaComponent(0.2),
                        cometColor: UIColor.white),
                  Comet(startPoint: CGPoint(x: 0, y: 0.8 * height),
                        endPoint: CGPoint(x: width, y: 0.75 * height),
                        lineColor: UIColor.white.withAlphaComponent(0.2),
                        cometColor: UIColor.white),
                  Comet(startPoint: CGPoint(x: width, y: height),
                        endPoint: CGPoint(x: 0, y: 0),
                        lineColor: UIColor.white.withAlphaComponent(0.2),
                        cometColor: UIColor.white)]
    
    // draw line track and animate
    for comet in comets {
      //      view.layer.addSublayer(comet.drawLine())
      view.layer.addSublayer(comet.animate())
    }
  }
}
