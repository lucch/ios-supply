//
//  ItemListView.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import UIKit


final class ItemListView: View {

  static let cellReuseIdentifier = "ItemCell"

  let itemsTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(ItemCell.self, forCellReuseIdentifier: ItemListView.cellReuseIdentifier)
    tableView.separatorStyle = .none
    return tableView
  }()

  let addItemButton =
    UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)

  let refreshItemsButton =
    UIBarButtonItem(title: "Refresh", style: .plain, target: nil, action: nil)

  let clearItemsButton: UIBarButtonItem = {
    let button = UIBarButtonItem(title: "Clear", style: .plain, target: nil, action: nil)
    button.tintColor = .systemRed
    return button
  }()

  func setUpViewHierarchy() {
    addSubview(itemsTableView)
  }

  func setUpConstraints() {
    itemsTableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

}
