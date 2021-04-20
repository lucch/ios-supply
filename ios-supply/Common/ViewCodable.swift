//
//  ViewCodable.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 15/04/21.
//

import UIKit


protocol ViewCodable {

  func setUpViewHierarchy()

  func setUpConstraints()

  func performAdditionalConfiguration()

}


extension ViewCodable where Self: UIView {

  func render() {
    // Reset view's background color.
    if #available(iOS 13.0, *) {
      backgroundColor = .systemBackground
    } else {
      backgroundColor = .white
    }

    setUpViewHierarchy()
    setUpConstraints()
    performAdditionalConfiguration()
  }

  func performAdditionalConfiguration() {}

}
