//
//  ItemCell.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 19/04/21.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit


final class ItemCell: UITableViewCell {

  private var disposeBag = DisposeBag()

  let itemQuantityLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .right
    label.font = UIFont.boldSystemFont(ofSize: 20)
    return label
  }()

  let itemNameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    return label
  }()

  let itemPriceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Menlo", size: 18)
    label.numberOfLines = 0
    return label
  }()


  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .firstBaseline
    stackView.distribution = .fill
    stackView.spacing = 16.0
    return stackView
  }()

  private let containerView = UIView()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    render()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    render()
  }

  override func prepareForReuse() {
    disposeBag = DisposeBag()
  }

  func configure(with item: ItemViewModel) {
    itemQuantityLabel.text = item.quantityX
    itemNameLabel.text = item.name
    itemPriceLabel.text = item.price
  }

}

extension ItemCell: ViewCode {

  func setUpViewHierarchy() {
    [itemQuantityLabel, itemNameLabel, itemPriceLabel].forEach {
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

    itemQuantityLabel.snp.makeConstraints { make in
      make.width.greaterThanOrEqualTo(36)
    }

    stackView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

  func performAdditionalConfiguration() {
    itemQuantityLabel.setContentHuggingPriority(.required, for: .horizontal)
    itemPriceLabel.setContentHuggingPriority(.required, for: .horizontal)
  }

}
