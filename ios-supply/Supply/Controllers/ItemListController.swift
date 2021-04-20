//
//  ItemListController.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 18/04/21.
//

import UIKit


final class ItemListController: Controller<ItemListView, ItemListViewModel> {

  override func viewDidLoad() {
    navigationItem.title = "Items"
    customView.itemsTableView.delegate = self
    customView.itemsTableView.dataSource = self
    setUpActions()
    setUpBindings()
  }

  func setUpActions() {
    let fetchButton = UIBarButtonItem(title: "Fetch", style: .done, target: self, action: #selector(tappedFetchButton))
    navigationItem.setRightBarButton(fetchButton, animated: true)
  }

  func setUpBindings() {
    viewModel.didUpdateItems = { [weak self] in
      self?.customView.itemsTableView.reloadData()
    }
  }

  @objc private func tappedFetchButton() {
    // Trigger data fetching.
    viewModel.fetchItems()
  }

}

extension ItemListController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let count = viewModel.items.count
    return count > 0 ? count : 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard viewModel.items.count > 0 else {
      let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
      cell.textLabel?.text = "Tap on “Fetch” to update the list of items."
      cell.textLabel?.textColor = .systemGray
      cell.textLabel?.textAlignment = .center
      return cell
    }

    guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListView.cellReuseIdentifier, for: indexPath) as? ItemCell else {
      return UITableViewCell()
    }

    cell.itemQuantityLabel.text = "\(viewModel.items[indexPath.row].itemQuantity)"
    cell.itemNameLabel.text = viewModel.items[indexPath.row].itemName

    return cell
  }

}

extension ItemListController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let index = indexPath.row
    guard index < viewModel.items.count else {
      return
    }

    let item = viewModel.items[index]
    viewModel.selectedItem(item)
  }

}
