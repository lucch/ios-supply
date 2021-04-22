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


final class ItemCell: UITableViewCell, ViewCodable {

  private var disposeBag = DisposeBag()

  let itemQuantityLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 22)
    return label
  }()

  let itemQuantityStepper: UIStepper = {
    let stepper = UIStepper()
    stepper.minimumValue = 1
    stepper.maximumValue = 10
    stepper.value = 9
    return stepper
  }()

  let itemQuantityContainerView = UIView()

  let itemNameLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    return label
  }()

  let itemPriceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Menlo", size: 20)
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
    render()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    render()
  }

  override func prepareForReuse() {
    disposeBag = DisposeBag()
  }

  func setUpViewHierarchy() {
    itemQuantityContainerView.addSubview(itemQuantityStepper)
    itemQuantityContainerView.addSubview(itemQuantityLabel)

    [itemQuantityContainerView, itemNameLabel, itemPriceLabel].forEach {
      stackView.addArrangedSubview($0)
    }

//    [itemQuantityLabel, itemNameLabel, itemPriceLabel].forEach {
//      stackView.addArrangedSubview($0)
//    }
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

    itemQuantityStepper.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    itemQuantityLabel.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }

    stackView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

  func performAdditionalConfiguration() {
    itemQuantityLabel.setContentHuggingPriority(.required, for: .horizontal)
    itemQuantityStepper.setContentCompressionResistancePriority(.required, for: .horizontal)
    itemPriceLabel.setContentHuggingPriority(.required, for: .horizontal)
  }

  func configure(with item: ItemViewModel, isEditMode: Observable<Bool>?) {
//    itemQuantityStepper.value = Double(item._itemQuantity)
    itemQuantityStepper.isHidden = true
    itemQuantityLabel.text = item.itemQuantity
    itemNameLabel.text = item.itemName
    itemPriceLabel.text = item.itemPrice

//    if let isEditMode = isEditMode {
//      isEditMode
//        .bind(to: itemQuantityLabel.rx.isHidden)
//        .disposed(by: disposeBag)
//
//      isEditMode
//        .map { !$0 }
//        .bind(to: itemQuantityStepper.rx.isHidden)
//        .disposed(by: disposeBag)
//    }
  }

}
