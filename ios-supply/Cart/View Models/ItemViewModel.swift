//
//  ItemViewModel.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import Foundation


final class ItemViewModel {

  var _itemQuantity: Int

  var itemQuantity: String {
    "\(_itemQuantity)x"
  }

  var itemName: String

  var itemPrice: String

  init(_ item: Item) {
    self._itemQuantity = item.quantity
    self.itemName = item.name
    self.itemPrice = String(format: "$%.2f", item.price)
  }

}
