//
//  OrderViewModel.swift
//  HotCoffee
//
//  Created by Ibrahim Nasser Ibrahim on 05/01/2024.
//

import Foundation

class OrderListViewModel {
  var orderViewModel: [OrderViewModel]

  init() {
    self.orderViewModel = [OrderViewModel]()
  }
}

extension OrderListViewModel {
  func orderViewModel(at index: Int) -> OrderViewModel {
    return self.orderViewModel[index]
  }
}

struct OrderViewModel {
  let order: Order
}


extension OrderViewModel {
  var name: String {
    return self.order.name
  }

  var email: String {
    return self.order.email
  }

  var tpye: String {
    return self.order.type.rawValue.capitalized
  }

  var size: String {
    return self.order.size.rawValue.capitalized
  }
}
