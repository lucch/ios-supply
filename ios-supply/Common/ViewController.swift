//
//  ViewController.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 15/04/21.
//

import UIKit


class ViewController<ViewType: View, ViewModelType>: UIViewController {

  let viewModel: ViewModelType!

  var customView: ViewType {
      guard let customView = view as? ViewType else {
          fatalError("Expected view to be of type \(ViewType.self) but got \(type(of: view)) instead.")
      }

      return customView
  }

  private init() {
    fatalError("init() has not been implemented")
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(viewModel: ViewModelType) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  override func loadView() {
    view = ViewType()
    customView.render()
  }

}
