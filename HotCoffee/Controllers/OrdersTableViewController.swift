//
//  OrdersTableViewController.swift
//  HotCoffee
//
//  Created by Ibrahim Nasser Ibrahim on 05/01/2024.
//

import UIKit

class OrdersTableViewController: UITableViewController {
    
    var orderListViewModel = OrderListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poulateOrders()
    }
    
    private func poulateOrders() {
        guard let coffeeOrderURL = URL(string: "https://warp-wiry-rugby.glitch.me/orders") else {
            return
        }
        
        let resources = Resource<[Order]>(url: coffeeOrderURL)
        WebService().load(resource: resources) { [weak self] result in
            switch result {
                    
                case .success(let orders):
                    self?.orderListViewModel.orderViewModel = orders.map(OrderViewModel.init)
                    self?.tableView.reloadData()
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    // MARK: - Table view data source
    //
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderListViewModel.orderViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vm = self.orderListViewModel.orderViewModel(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderCell", for: indexPath)
        cell.textLabel?.text = vm.tpye
        cell.detailTextLabel?.text = vm.size
        return cell
    }
}
