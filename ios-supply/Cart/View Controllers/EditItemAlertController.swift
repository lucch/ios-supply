//
//  EditItemAlertController.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 22/04/21.
//

import UIKit
import RxSwift
import RxCocoa


final class EditItemAlertController {

  private init() {}

  static func make(item: ItemViewModel, onDone completion: @escaping (Int?) -> Void) -> UIAlertController {
    let alertController = UIAlertController(title: "Edit \(item.name)",
                                            message: "How many items would you like?",
                                            preferredStyle: .alert)

    alertController.addTextField { textField in
      textField.text = "\(item.quantity)"
      textField.placeholder = "Enter new quantity for \(item.name)."
      textField.clearButtonMode = .whileEditing
      textField.keyboardType = .numberPad
    }

    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    let doneAction = UIAlertAction(title: "Done", style: .default) { _ in
      if let textField = alertController.textFields?[0],
         let intString = textField.text {
        completion(Int(intString))
      } else {
        completion(nil)
      }
    }

    alertController.addAction(doneAction)
    alertController.addAction(cancelAction)

    return alertController
  }

  deinit {
    print("👻 deinit \(Self.self)")
  }

}
