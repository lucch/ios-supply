//
//  AppDelegate.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 15/04/21.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var coordinator: Coordinator?

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let navigationController = UINavigationController()
    navigationController.navigationBar.prefersLargeTitles = true

    coordinator = AppCoordinator(navigationController: navigationController)
    coordinator?.start()

    window = UIWindow()
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()

    return true
  }

}

