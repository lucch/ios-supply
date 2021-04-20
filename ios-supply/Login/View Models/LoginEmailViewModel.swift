//
//  LoginEmailViewModel.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 15/04/21.
//

import Foundation


final class LoginEmailViewModel: LoginViewModel {

  var coordinator: LoginEmailCoordinator?

  var titleText: String = "Enter your email"

  var placeholderText = "Enter your email"

  var buttonText = "Continue"

  var isMainButtonEnabled = true

  init(coordinator: LoginEmailCoordinator?) {
    self.coordinator = coordinator
  }

  func tappedMainButton() {
    coordinator?.tappedContinueButton()
  }

}
