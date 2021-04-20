//
//  LoginEmailCoordinator.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 16/04/21.
//

import UIKit


final class LoginEmailCoordinator: Coordinator {

  var rootViewController: UIViewController {
    navigationController
  }

  private let navigationController: UINavigationController = {
    let navigationController = UINavigationController()
    // Makes the navigation bar invisible.
    navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController.navigationBar.shadowImage = UIImage()
    // Changes the back button image
    let backImage = UIImage(named: "back-arrow")
    navigationController.navigationBar.backIndicatorImage = backImage
    navigationController.navigationBar.backIndicatorTransitionMaskImage = backImage
    return navigationController
  }()

  private let window: UIWindow

  init(window: UIWindow) {
    self.window = window
  }

  func start() {
    let loginViewModel = LoginEmailViewModel(coordinator: self)
    let loginEmailController = LoginController(viewModel: loginViewModel)

    navigationController.pushViewController(loginEmailController, animated: false)

    window.rootViewController = navigationController
    window.makeKeyAndVisible()
  }

  func tappedContinueButton() {
    let passwordCoordinator = LoginPasswordCoordinator(navigationController: navigationController)
    passwordCoordinator.start()
  }

}
