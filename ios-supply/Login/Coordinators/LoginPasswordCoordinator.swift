//
//  LoginPasswordCoordinator.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import UIKit


final class LoginPasswordCoordinator: Coordinator {

  var rootViewController: UIViewController {
    navigationController
  }

  private var navigationController: UINavigationController

  init(navigationController: UINavigationController) {
    self.navigationController = navigationController
  }

  func start() {
    let loginPasswordViewModel = LoginPasswordViewModel(coordinator: self)
    let loginPasswordController = LoginController(viewModel: loginPasswordViewModel)

    navigationController.pushViewController(loginPasswordController, animated: true)
  }

  deinit {
    print("deinit LoginPasswordCoordinator")
  }

}
