//
//  Coordinator.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import UIKit


protocol Coordinator {

  var rootViewController: UIViewController { get }

  func start()

}
