//
//  ItemAddControllerRx.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 20/04/21.
//

import UIKit
import SnapKit
import RxSwift


final class ItemAddView: View {

  let doneBarButton =
    UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: nil)

  let cancelBarButton =
    UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)

  let itemQuantityLabel: UILabel = {
    let label = UILabel()
    return label
  }()

  let itemNameLabel: UILabel = {
    let label = UILabel()
    return label
  }()

  private let tableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.separatorStyle = .none
    return tableView
  }()

  func setUpViewHierarchy() {
    addSubview(tableView)
  }

  func setUpConstraints() {
    tableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }

}


final class ItemAddControllerRx: Controller<ItemAddView, ItemViewModel> {

  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    navigationItem.title = "Add Item"
    navigationItem.leftBarButtonItem = customView.cancelBarButton
    navigationItem.rightBarButtonItem = customView.doneBarButton

    setUpBindings()
  }

  private func setUpBindings() {
    let cancelButton = customView.cancelBarButton.rx
    cancelButton.tap.subscribe { [unowned self] _ in dismiss(animated: true) }
      .disposed(by: disposeBag)
  }

}
