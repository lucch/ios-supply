//
//  ItemListControllerRx.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 19/04/21.
//

import UIKit
import RxSwift


final class ItemListControllerRx: Controller<ItemListView, ItemListViewModelRx> {

  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    navigationItem.title = "Items Rx"
    navigationItem.leftBarButtonItem = customView.clearItemsButton
    navigationItem.rightBarButtonItems =
      [customView.addItemButton, customView.refreshItemsButton]
    setUpBindings()
  }

  func setUpBindings() {
    bindItemListTableView()
    bindNavigationButtons()
  }

  private func bindItemListTableView() {
    let itemsTableView = customView.itemsTableView.rx

    // Simpler binding.
//    viewModel.items
//      .bind(to: tableViewRx.items(
//              cellIdentifier: ItemListView.cellReuseIdentifier,
//              cellType: ItemCell.self)) { _, item, cell in
//        cell.itemQuantityLabel.text = "\(item.itemQuantity)"
//        cell.itemNameLabel.text = item.itemName
//      }
//      .disposed(by: disposeBag)

    let itemsObservable: Observable<[(ItemViewModel, isEmpty: Bool)]> =
      viewModel.items.map { items in
        if items.isEmpty {
          return [(ItemViewModel(itemQuantity: 0, itemName: ""), isEmpty: true)]
        }
        return items.map { ($0, isEmpty: false) }
      }

    itemsTableView.items(itemsObservable)({ tableView, row, itemTuple in
      guard !itemTuple.isEmpty else {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "Please, tap refresh to update the list of items."
        cell.textLabel?.textColor = .systemGray
        cell.textLabel?.textAlignment = .center
        return cell
      }

      let (item, _) = itemTuple
      let cell = tableView.dequeueReusableCell(withIdentifier: ItemListView.cellReuseIdentifier, for: .init(index: row)) as! ItemCell
      cell.itemQuantityLabel.text = "\(item.itemQuantity)"
      cell.itemNameLabel.text = item.itemName
      return cell
    })
    .disposed(by: disposeBag)

    itemsTableView
      .modelSelected((ItemViewModel, Bool).self)
      .subscribe { [unowned self] (item, isEmpty) in
        isEmpty ? viewModel.fetchItems() : viewModel.selectedItem(item)
      }
      .disposed(by: disposeBag)
  }

  private func bindNavigationButtons() {
    let addButton = customView.addItemButton.rx
    addButton.tap.subscribe(onNext: viewModel.tappedAddItemButton)
      .disposed(by: disposeBag)

    let refreshButton = customView.refreshItemsButton.rx
    refreshButton.tap.subscribe(onNext: viewModel.fetchItems)
      .disposed(by: disposeBag)

    let clearButton = customView.clearItemsButton.rx
    clearButton.tap.subscribe(onNext: viewModel.clearItems)
      .disposed(by: disposeBag)
  }

}
