//
//  ItemsRepository.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 21/04/21.
//

import Foundation


final class ItemsRepository: Repository {

  typealias T = Item

  func list() -> [Item] {
    return [
      Item(quantity: Int.random(in: 1..<10), name: "Espresso", price: 3.0),
      Item(quantity: Int.random(in: 1..<10), name: "Latte", price: 4.30),
      Item(quantity: Int.random(in: 1..<10), name: "Hot Chocolate", price: 3.50),
      Item(quantity: Int.random(in: 1..<10), name: "Mocha", price: 4.45),
    ].shuffled()
  }

  deinit {
    print("👻 deinit \(Self.self)")
  }

}
