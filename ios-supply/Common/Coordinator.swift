//
//  Coordinator.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import UIKit


protocol Coordinator: AnyObject {

  var childCoordinators: [Coordinator] { get set }

  var navigationController: UINavigationController { get set }

  func start()

}
