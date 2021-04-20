//
//  LoginPasswordViewModel.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 15/04/21.
//

import Foundation


final class LoginPasswordViewModel: LoginViewModel {

  var coordinator: LoginPasswordCoordinator?

  var titleText: String = "Enter your password"

  var placeholderText = "Enter your password"

  var buttonText = "Sign in"

  var isMainButtonEnabled = true

  init(coordinator: LoginPasswordCoordinator?) {
    self.coordinator = coordinator
  }

  func tappedMainButton() {
    // TODO!
  }

  deinit {
    print("deinit LoginPasswordViewModel")
  }

}
