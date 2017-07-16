//
//  UITableView.swift
//  MyExtension
//
//  Created by Yuya Hirayama on 2017/07/16.
//  Copyright © 2017年 Yuya Hirayama. All rights reserved.
//

import UIKit

private func cellReuseIdentifier(for type: UITableViewCell.Type) -> String {
  return String.init(describing: type)
}

public extension MyExtension where Base: UITableView {
  func registerCell<Cell: UITableViewCell>(type : Cell.Type, xibName: String = cellReuseIdentifier(for: Cell.self)) {
    base.register(Cell.self, forCellReuseIdentifier: xibName)
  }

  func dequeueCell<Cell: UITableViewCell>(at indexPath: IndexPath) -> Cell {
    return base.dequeueReusableCell(withIdentifier: cellReuseIdentifier(for: Cell.self), for: indexPath) as! Cell
  }
}
