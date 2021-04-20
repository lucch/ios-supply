//
//  AppDelegate.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 15/04/21.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var appCoordinator: Coordinator?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    appCoordinator = AppCoordinator(window: UIWindow())
    appCoordinator?.start()

    return true
  }

}

