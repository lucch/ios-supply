//
//  CartViewModel.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 19/04/21.
//

import Foundation
import RxSwift
import RxCocoa


final class CartViewModel {

  private let coordinator: CartCoordinator?

  private let repository: ItemsRepository?

  let screenTitle = "Odeko Café"

  let items = BehaviorSubject<[ItemViewModel]>(value: [])

  let totalPrice = BehaviorSubject<String>(value: "$0.00")

  let selectedItemIndex = BehaviorRelay<Int?>(value: .none)

  let isEditEnabled = BehaviorSubject<Bool>(value: false)

  private let model = BehaviorRelay<[Item]>(value: [])

  private let disposeBag = DisposeBag()

  init(coordinator: CartCoordinator? = nil, repository: ItemsRepository? = nil) {
    self.coordinator = coordinator
    self.repository = repository
    setUpBindings()
  }

  private func setUpBindings() {
    model
      .map { $0.map { ItemViewModel($0) } }
      .subscribe(onNext: items.onNext)
      .disposed(by: disposeBag)

    model
      .map { $0.reduce(0.0) { $0 + Double($1.quantity) * $1.price } }
      .map { String(format: "$%.2f", $0) }
      .subscribe(onNext: totalPrice.onNext)
      .disposed(by: disposeBag)

    selectedItemIndex
      .map { $0 != nil }
      .subscribe(onNext: isEditEnabled.onNext)
      .disposed(by: disposeBag)
  }

  func fetchItems() {
    model.accept(repository?.list() ?? [])
    selectedItemIndex.accept(.none)
  }

  func clearItems() {
    model.accept([])
    selectedItemIndex.accept(.none)
  }

  func editItem() {
    guard let index = selectedItemIndex.value,
          let item = try? items.value()[index] else {
      return
    }

    coordinator?.edit(item: item) { quantity in
      if let quantity = quantity {
        self.updateQuantity(to: quantity, forItemAt: index)
      }
    }
  }

  func updateQuantity(to quantity: Int, forItemAt index: Int) {
    guard 0..<model.value.count ~= index else { return }
    model.value[index].quantity = quantity
    model.accept(model.value)
  }

  deinit {
    print("👻 deinit \(Self.self)")
  }

}
