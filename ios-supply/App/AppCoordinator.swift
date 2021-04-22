//
//  AppCoordinator.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import UIKit


final class AppCoordinator: Coordinator {

  var childCoordinators = [Coordinator]()

  var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let coordinator = CartCoordinator(navigationController: navigationController)
    childCoordinators.append(coordinator)
    coordinator.start()
  }

}
