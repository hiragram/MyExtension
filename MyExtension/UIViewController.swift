//
//  UIViewController.swift
//  MyExtension
//
//  Created by Yuya Hirayama on 2017/07/16.
//  Copyright © 2017年 Yuya Hirayama. All rights reserved.
//

import UIKit

public extension UIViewController: MyExtensionCompatible {}

public protocol StoryboardInstantiatable {}

public extension MyExtension where Base: UIViewController, Base: StoryboardInstantiatable {
  static func instantiate() -> Base {
    let storyboardName = String.init(describing: Base.self)
    let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
    return storyboard.instantiateInitialViewController() as! Base
  }
}
