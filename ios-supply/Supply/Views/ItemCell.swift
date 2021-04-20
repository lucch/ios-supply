//
//  ItemCell.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 19/04/21.
//

import UIKit


final class ItemCell: UITableViewCell, ViewCodable {

  let itemQuantityLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 24)
    return label
  }()

  let itemNameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    return label
  }()

  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .fill
    stackView.spacing = 16.0
    return stackView
  }()

  private let containerView = UIView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    accessoryType = .disclosureIndicator
    render()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setUpViewHierarchy() {
    [itemQuantityLabel, itemNameLabel].forEach {
      stackView.addArrangedSubview($0)
    }
    containerView.addSubview(stackView)
    contentView.addSubview(containerView)
  }

  func setUpConstraints() {
    containerView.snp.makeConstraints { make in
      make.left.equalTo(contentView.snp.leftMargin)
      make.right.equalTo(contentView.snp.rightMargin)
      make.top.equalToSuperview().offset(16)
      make.bottom.equalToSuperview().offset(-16)
    }

    stackView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    itemQuantityLabel.snp.makeConstraints { make in
      make.width.greaterThanOrEqualTo(32)
      make.top.equalTo(stackView)
      make.bottom.equalTo(stackView)
    }

    itemNameLabel.snp.makeConstraints { make in
      make.centerY.equalTo(itemQuantityLabel)
    }
  }

  func performAdditionalConfiguration() {
    itemQuantityLabel.setContentHuggingPriority(.required, for: .horizontal)
  }

}
