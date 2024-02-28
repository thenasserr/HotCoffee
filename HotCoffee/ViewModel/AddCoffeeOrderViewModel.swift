//
//  AddCoffeeOrderViewModel.swift
//  HotCoffee
//
//  Created by Ibrahim Nasser Ibrahim on 05/01/2024.
//

import Foundation

struct AddCoffeeOrderViewModel {
  var name: String?
  var email: String?

  var selectedType: String?
  var selectedSize: String?

  var types: [String] {
    return CoffeeType.allCases.map({$0.rawValue.capitalized})
  }

  var size: [String] {
    return CoffeeSize.allCases.map({$0.rawValue.capitalized})
  }

}
