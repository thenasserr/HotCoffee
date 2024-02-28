//
//  WebService.swift
//  HotCoffee
//
//  Created by Ibrahim Nasser Ibrahim on 05/01/2024.
//

import Foundation

enum NetworkError: Error {
  case decodingError
  case domainError
  case urlError
}


struct Resource<T: Codable> {
  let url: URL
}

class WebService {

  func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
    URLSession.shared.dataTask(with: resource.url) { data, response, error in
      guard let data = data, error == nil else {
        completion(.failure(.decodingError))
        return
      }
      let result = try? JSONDecoder().decode(T.self, from: data)
      guard let result = result else {
        completion(.failure(.decodingError))
        return
      }
      DispatchQueue.main.async {
        completion(.success(result))
      }
    }.resume()
  }

}
