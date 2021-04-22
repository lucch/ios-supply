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
    let vm = CartViewModel()
    vm.coordinator = self
    vm.repository = ItemsRepository()
    let vc = CartController(viewModel: vm)
    navigationController.pushViewController(vc, animated: false)
  }

  func edit(item: ItemViewModel) {
//    let vc = ItemEditController(viewModel: item)
//    navigationController.present(vc, animated: true)
  }
  
}
