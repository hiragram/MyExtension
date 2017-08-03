//
//  UIViewController.swift
//  MyExtension
//
//  Created by Yuya Hirayama on 2017/07/16.
//  Copyright © 2017年 Yuya Hirayama. All rights reserved.
//

import UIKit

extension UIViewController: MyExtensionCompatible {}

public protocol StoryboardInstantiatable {
  static var storyboardName: String { get }
}

public extension StoryboardInstantiatable where Self: UIViewController {
  static var storyboardName: String {
    return String.init(describing: Self.self)
  }
}

public extension MyExtension where Base: UIViewController, Base: StoryboardInstantiatable {
  static func instantiate(configuration: ((Base) -> Void)? = nil) -> Base {
    let storyboard = UIStoryboard.init(name: Base.storyboardName, bundle: nil)
    let vc = storyboard.instantiateInitialViewController() as! Base
    configuration?(vc)
    return vc
  }
}
