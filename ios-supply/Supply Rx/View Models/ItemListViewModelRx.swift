//
//  ItemListViewModelRx.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 19/04/21.
//

import Foundation
import RxSwift
import RxCocoa


final class ItemListViewModelRx {

  private let coordinator: ItemListCoordinator?

  let items = BehaviorRelay<[ItemViewModel]>(value: [])

  init(coordinator: ItemListCoordinator? = nil) {
    self.coordinator = coordinator
  }

  func tappedAddItemButton() {
    coordinator?.presentItemAdd()
  }

  func fetchItems() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      self.items.accept([
        ItemViewModel(itemQuantity: 10, itemName: "Milk"),
        ItemViewModel(itemQuantity: 5, itemName: "Coffee"),
        ItemViewModel(itemQuantity: 30, itemName: "Cups"),
        ItemViewModel(itemQuantity: 17, itemName: "Cups"),
        ItemViewModel(itemQuantity: 8, itemName: "Almond Croissant"),
        ItemViewModel(itemQuantity: 12, itemName: "Baguette"),
        ItemViewModel(itemQuantity: 3, itemName: "Campagne"),
        ItemViewModel(itemQuantity: 9, itemName: "Ciabatta"),
        ItemViewModel(itemQuantity: 23, itemName: "Cinnamon Sugar Roule"),
        ItemViewModel(itemQuantity: 19, itemName: "Cherry Elderflower Danish"),
        ItemViewModel(itemQuantity: 28, itemName: "Miche"),
        ItemViewModel(itemQuantity: 10, itemName: "Ham & Brie Croissant"),
        ItemViewModel(itemQuantity: 9, itemName: "Cream Cheese Pocket"),
        ItemViewModel(itemQuantity: 47, itemName: "Pain au Chocolat"),
      ].shuffled())
    }
  }

  func clearItems() {
    DispatchQueue.main.async {
      self.items.accept([])
    }
  }

  func selectedItem(_ item: ItemViewModel) {
    coordinator?.presentItemDetail(for: item)
  }

}
