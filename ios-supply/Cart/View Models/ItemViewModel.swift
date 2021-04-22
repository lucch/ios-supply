//
//  ItemViewModel.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import Foundation


final class ItemViewModel {

  var quantity: Int

  var name: String

  var price: String

  var quantityX: String {
    "\(quantity)x"
  }

  init(_ item: Item) {
    self.quantity = item.quantity
    self.name = item.name
    self.price = String(format: "$%.2f", item.price)
  }

  deinit {
    print("👻 deinit \(Self.self)")
  }

}
