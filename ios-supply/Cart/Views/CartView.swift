//
//  CartView.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import UIKit


final class CartView: UIView {

  static let itemCellReuseIdentifier = String(describing: ItemCell.self)

  let editButton =
    UIBarButtonItem(barButtonSystemItem: .edit, target: nil, action: nil)

  let refreshButton =
    UIBarButtonItem(barButtonSystemItem: .refresh, target: nil, action: nil)

  let clearButton: UIBarButtonItem = {
    let barButton = UIBarButtonItem(title: "Clear", style: .plain, target: nil, action: nil)
    barButton.tintColor = .systemRed
    return barButton
  }()

  let itemsTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(ItemCell.self, forCellReuseIdentifier: itemCellReuseIdentifier)
    tableView.separatorStyle = .none
    return tableView
  }()

  let priceLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont(name: "Menlo Bold", size: 16)
    label.numberOfLines = 0
    return label
  }()

  let checkoutButton: UIButton = {
    let button = UIButton()
    button.setTitle("Checkout", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.titleLabel?.font = .boldSystemFont(ofSize: 18)
    button.backgroundColor = .black
    button.layer.cornerRadius = 16.0
    button.contentEdgeInsets = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 12.0, right: 16.0)
    return button
  }()

}

extension CartView: ViewCode {

  func setUpViewHierarchy() {
    addSubview(itemsTableView)
    checkoutButton.addSubview(priceLabel)
    addSubview(checkoutButton)
  }

  func setUpConstraints() {
    itemsTableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    checkoutButton.snp.makeConstraints { make in
      make.bottom.equalTo(safeAreaLayoutGuide.snp.bottomMargin).offset(-28)
      make.left.equalTo(snp.leftMargin)
      make.right.equalTo(snp.rightMargin)
    }

    priceLabel.snp.makeConstraints { make in
      make.right.equalTo(checkoutButton.snp.rightMargin).offset(-8)
      make.centerYWithinMargins.equalToSuperview()
    }
  }

}
