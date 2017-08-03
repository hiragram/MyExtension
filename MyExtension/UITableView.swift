//
//  UITableView.swift
//  MyExtension
//
//  Created by Yuya Hirayama on 2017/07/16.
//  Copyright © 2017年 Yuya Hirayama. All rights reserved.
//

import UIKit

public extension MyExtension where Base: UITableView {
  func registerCell<Cell: UITableViewCell>(type : Cell.Type) where Cell: XibInstantiatable {
    base.register(UINib.init(nibName: Cell.xibName, bundle: nil), forCellReuseIdentifier: Cell.xibName)
  }

  func dequeueCell<Cell: UITableViewCell>(at indexPath: IndexPath) -> Cell where Cell: XibInstantiatable {
    return base.dequeueReusableCell(withIdentifier: Cell.xibName, for: indexPath) as! Cell
  }
}
