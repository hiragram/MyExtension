//
//  MyExtensionCompatible.swift
//  MyExtension
//
//  Created by Yuya Hirayama on 2017/07/16.
//  Copyright © 2017年 Yuya Hirayama. All rights reserved.
//

import Foundation

public protocol MyExtensionCompatible {
  associatedtype CompatibleType

  var my: CompatibleType { get }

  static var my: CompatibleType.Type { get }
}

public final class MyExtension<Base> {
  let base: Base
  public init(base: Base) {
    self.base = base
  }
}

extension MyExtensionCompatible {
  public var my: MyExtension<Self> {
    return .init(base: self)
  }

  public static var my: MyExtension<Self>.Type {
    return MyExtension<Self>.self
  }
}
