//
//  Order.swift
//  HotCoffee
//
//  Created by Ibrahim Nasser Ibrahim on 05/01/2024.
//

import Foundation

enum CoffeeType: String, Codable, CaseIterable {
  case cappaccino
  case latte
  case espresso
  case cortado
}

enum CoffeeSize: String, Codable, CaseIterable {
  case smaall
  case medium
  case large
}

struct Order: Codable {
  let name: String
  let email: String
  let type: CoffeeType
  let size: CoffeeSize
}

extension Order {
  init?(_ vm: AddCoffeeOrderViewModel) {
    guard let name = vm.name,
          let email = vm.email,
          let selectedType = CoffeeType(rawValue: vm.selectedType!.lowercased()),
          let selectedSize = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
      return nil
    }
    self.name = name
    self.email = email
    self.size = selectedSize
    self.type = selectedType
  }
}
