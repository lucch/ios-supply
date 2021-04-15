//
//  AppDelegate.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 15/04/21.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    window?.rootViewController = LoginController(viewModel: LoginEmailViewModel())
    window?.makeKeyAndVisible()

    return true
  }

}
