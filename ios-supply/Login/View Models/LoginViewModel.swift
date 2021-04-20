//
//  LoginViewModel.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import Foundation


protocol LoginViewModel {

  var titleText: String { get }

  var placeholderText: String { get }

  var buttonText: String { get }

  var isMainButtonEnabled: Bool { get }

  func tappedMainButton()

}
