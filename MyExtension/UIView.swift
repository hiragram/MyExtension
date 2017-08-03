//
//  UIView.swift
//  MyExtension
//
//  Created by Yuya Hirayama on 2017/08/03.
//  Copyright © 2017年 Yuya Hirayama. All rights reserved.
//

import UIKit

extension UIView: MyExtensionCompatible {}

public protocol XibInstantiatable {
  static var xibName: String { get }
}

public extension XibInstantiatable where Self: UIView {
  static var xibName: String {
    return String.init(describing: Self.self)
  }
}

public extension MyExtension where Base: UIView, Base: XibInstantiatable {
  static func instantiate(configuration: ((Base) -> Void)? = nil) -> Base {
    let nib = UINib.init(nibName: Base.xibName, bundle: nil)
    let view = nib.instantiate(withOwner: nil, options: nil).first as! Base
    configuration?(view)
    return view
  }
}
