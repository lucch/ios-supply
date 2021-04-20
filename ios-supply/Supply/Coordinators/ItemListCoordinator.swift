//
//  ItemListCoordinator.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import UIKit


final class ItemListCoordinator: Coordinator {

  var rootViewController: UIViewController {
    navigationController
  }
  
  private let navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    navigationController.navigationBar.prefersLargeTitles = true
    return navigationController
  }()

  private let isRx: Bool

  static var manual: ItemListCoordinator = {
    .init(isRx: false)
  }()

  static var rx: ItemListCoordinator = {
    .init(isRx: true)
  }()

  private init(isRx: Bool = false) {
    self.isRx = isRx
  }

  func start() {
    if isRx {
      let viewModel = ItemListViewModelRx(coordinator: self)
      let controller = ItemListControllerRx(viewModel: viewModel)
      navigationController.pushViewController(controller, animated: true)
    } else {
      let viewModel = ItemListViewModel(coordinator: self)
      let controller = ItemListController(viewModel: viewModel)
      navigationController.pushViewController(controller, animated: true)
    }
  }

  func presentItemAdd() {
    if isRx {
      let viewModel = ItemViewModel(itemQuantity: 0, itemName: "")
      let controller = ItemAddControllerRx(viewModel: viewModel)
      let wrapperController = UINavigationController(rootViewController: controller)
      navigationController.present(wrapperController, animated: true)
    } else {
      // TODO!
    }
  }

  func presentItemDetail(for item: ItemViewModel) {
    // TODO:
    // 1. Assemble components (coordinator, view model, controllers, etc).
    // 2. Push detail controller to navigationController.
    print("[\(isRx ? "CoordinatorRx" : "Coordinator")] presentItemDetail for \(item.itemName)")
  }

}
