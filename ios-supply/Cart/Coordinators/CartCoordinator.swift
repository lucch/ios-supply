//
//  CartCoordinator.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import UIKit


final class CartCoordinator: Coordinator {

  var childCoordinators = [Coordinator]()

  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let vm = CartViewModel(coordinator: self, repository: ItemsRepository())
    let vc = CartViewController(viewModel: vm)
    navigationController.pushViewController(vc, animated: false)
  }

  func edit(item: ItemViewModel, completion: @escaping  (Int?) -> Void) {
    let alertController = EditItemAlertController.make(item: item, onDone: completion)
    navigationController.present(alertController, animated: true, completion: nil)
  }

  deinit {
    print("👻 deinit \(Self.self)")
  }
  
}
