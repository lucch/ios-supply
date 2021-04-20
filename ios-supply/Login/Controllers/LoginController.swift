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

    // Padding top
    navigationController?.additionalSafeAreaInsets.top = 80

    // Erases title
    navigationItem.title = ""

    // Text field + Keyboard
    customView.loginTextField.becomeFirstResponder()
    customView.loginTextField.delegate = self

    // Login Button
    customView.loginButton.addTarget(self, action: #selector(tappedMainButton), for: .touchUpInside)

    // Wire the view model
    setUpUIBindings()
  }

  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true) // Dismiss the keyboard
  }

  @objc func tappedMainButton() {
    viewModel.tappedMainButton()
  }

  func setUpUIBindings() {
    customView.titleLabel.text = viewModel.titleText
    customView.loginTextField.placeholder = viewModel.placeholderText
    customView.loginButton.setTitle(viewModel.buttonText, for: .normal)
    customView.loginButton.isEnabled = viewModel.isMainButtonEnabled
  }

  deinit {
    print("deinit LoginViewController")
  }

}

extension LoginController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.endEditing(true)
    return true
  }

}

