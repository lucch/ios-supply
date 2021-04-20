//
//  AppCoordinator.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import UIKit


final class AppCoordinator: Coordinator {

  var rootViewController: UIViewController {
    tabBarController
  }

  private let tabBarController = UITabBarController()

  private let window: UIWindow

  init(window: UIWindow) {
    self.window = window
  }

  func start() {
    let isLoggedIn = true

    guard isLoggedIn else {
      let loginEmailCoordinator = LoginEmailCoordinator(window: window)
      loginEmailCoordinator.start()
      return
    }

    let coordinatorManual = ItemListCoordinator.manual
    coordinatorManual.start()
    let manualVC = coordinatorManual.rootViewController
    manualVC.tabBarItem = UITabBarItem(title: "Manual", image: UIImage(named: "list-simple-7"), tag: 0)

    let coordinatorRx = ItemListCoordinator.rx
    coordinatorRx.start()
    let rxVC = coordinatorRx.rootViewController
    rxVC.tabBarItem = UITabBarItem(title: "Rx", image: UIImage(named: "list-simple-star-7"), tag: 0)

    tabBarController.viewControllers = [manualVC, rxVC]

    window.rootViewController = tabBarController
    window.makeKeyAndVisible()
  }

}
