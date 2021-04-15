//
//  LoginView.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 15/04/21.
//

import UIKit


final class LoginView: View {

  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Login"
    label.font = .systemFont(ofSize: 32.0, weight: .bold)
    return label
  }()

  let loginTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Enter your email"
    textField.borderStyle = .roundedRect
    textField.clearButtonMode = .whileEditing
    textField.returnKeyType = .next
    return textField
  }()

  let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("Next", for: .normal)
    button.backgroundColor = .systemBlue
    button.setTitleColor(.white, for: .normal)
    button.contentEdgeInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
    return button
  }()

  lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [titleLabel, loginTextField, loginButton])
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.spacing = 16.0
    return stackView
  }()

  func setUpViewHierarchy() {
    addSubview(stackView)
  }

  func setUpConstraints() {
    stackView.snp.makeConstraints { make in
      make.leading.equalTo(snp.leadingMargin)
      make.trailing.equalTo(snp.trailingMargin)
      make.centerY.equalToSuperview()
    }
  }

}
