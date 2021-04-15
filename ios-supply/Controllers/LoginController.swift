//
//  LoginViewController.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 15/04/21.
//

import UIKit
import SnapKit


final class LoginController: Controller<LoginView, LoginViewModel> {

  override func viewDidLoad() {
    super.viewDidLoad()

    // Text field + Keyboard
    customView.loginTextField.becomeFirstResponder()
    customView.loginTextField.delegate = self

    // Login Button
    customView.loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true) // Dismiss the keyboard
  }

  @objc func didTapLoginButton() {
    print("Login tapped!")
  }

}

extension LoginController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.endEditing(true)
    return true
  }

}
