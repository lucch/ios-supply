//
//  ItemListViewModel.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import Foundation


final class ItemViewModel {

  let itemQuantity: Int

  let itemName: String

  init(itemQuantity: Int, itemName: String) {
    self.itemQuantity = itemQuantity
    self.itemName = itemName
  }

}


final class ItemListViewModel {

  private let coordinator: ItemListCoordinator?

  var items = [ItemViewModel]()

  var didUpdateItems: (() -> Void)?

  init(coordinator: ItemListCoordinator? = nil) {
    self.coordinator = coordinator
  }

  func fetchItems() {
    // Simulates retrieving data using an injected data provider (network/DB).
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      // 1. Updates state.
      self.items = [
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
      ].shuffled()

      // 2. Notifies controller using callbacks/delegate.
      self.didUpdateItems?()
    }
  }

  func selectedItem(_ item: ItemViewModel) {
    coordinator?.presentItemDetail(for: item)
  }

}
