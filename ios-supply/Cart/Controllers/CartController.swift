//
//  CartController.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 19/04/21.
//

import UIKit
import RxSwift


final class CartController: Controller<CartView, CartViewModel> {

  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    navigationItem.title = viewModel.screenTitle
    navigationItem.leftBarButtonItem = customView.clearButton
    navigationItem.rightBarButtonItems =
      [customView.editButton, customView.refreshButton]
    setUpBindings()
    viewModel.fetchItems()
  }

  func setUpBindings() {
    bindNavigationButtons()
    bindItems()
    bindCheckoutButton()
  }

  private func bindItems() {
    let tableViewRx = customView.itemsTableView.rx
    viewModel.items
      .bind(to: tableViewRx.items(
              cellIdentifier: CartView.itemCellReuseIdentifier,
              cellType: ItemCell.self)) { [weak self] _, item, cell in
        cell.configure(with: item, isEditMode: self?.viewModel.isEditEnabled)
      }
      .disposed(by: disposeBag)

    tableViewRx.itemSelected
      .map { [weak self] indexPath -> Int? in
        if indexPath.row == self?.viewModel.selectedItemIndex.value {
          self?.customView.itemsTableView.deselectRow(at: indexPath, animated: true)
          return nil
        }

        return indexPath.row
      }
      .bind(to: viewModel.selectedItemIndex)
      .disposed(by: disposeBag)
  }

  private func bindNavigationButtons() {
    let refreshButton = customView.refreshButton.rx
    refreshButton.tap.subscribe(onNext: viewModel.fetchItems)
      .disposed(by: disposeBag)

    let editButton = customView.editButton.rx
    viewModel.isEditEnabled
      .bind(to: editButton.isEnabled)
      .disposed(by: disposeBag)

    editButton.tap.subscribe(onNext: viewModel.editItem)
      .disposed(by: disposeBag)

    let clearButton = customView.clearButton.rx
    clearButton.tap.subscribe(onNext: viewModel.clearItems)
      .disposed(by: disposeBag)
  }

  private func bindCheckoutButton() {
    let priceLabel = customView.priceLabel.rx
    viewModel.totalPrice
      .bind(to: priceLabel.text)
      .disposed(by: disposeBag)

    // TODO: Move logic below to view model and present the alert from the coordinator. :)
    let checkoutButton = customView.checkoutButton.rx
    checkoutButton.tap
      .subscribe { [weak self] _ in
        guard let index = self?.viewModel.selectedItemIndex.value,
              let item = try? self?.viewModel.items.value()[index] else {
          return
        }

        let alertController =
          EditItemAlertController.make(itemName: item.itemName) { quantity in
            guard let quantity = quantity else { return }
            self?.viewModel.updateQuantity(to: quantity, forItemAt: index)
          }

        self?.present(alertController, animated: true, completion: nil)
      }
      .disposed(by: disposeBag)

  }

}
