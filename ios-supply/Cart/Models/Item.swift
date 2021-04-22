//
//  Item.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 21/04/21.
//

import Foundation


final class Item {

  var quantity: Int

  let name: String

  let price: Double

  init(quantity: Int, name: String, price: Double) {
    self.quantity = quantity
    self.name = name
    self.price = price
  }

}
