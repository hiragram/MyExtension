//
//  UIViewController.swift
//  MyExtension
//
//  Created by Yuya Hirayama on 2017/07/16.
//  Copyright © 2017年 Yuya Hirayama. All rights reserved.
//

import UIKit

extension UIViewController: MyExtensionCompatible {}

public protocol StoryboardInstantiatable {}

public extension MyExtension where Base: UIViewController, Base: StoryboardInstantiatable {
  static func instantiate(configuration: ((Base) -> Void)? = nil) -> Base {
    let storyboardName = String.init(describing: Base.self)
    let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
    let vc = storyboard.instantiateInitialViewController() as! Base
    configuration?(vc)
    return vc
  }
}
