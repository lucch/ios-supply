//
//  NetworkManager.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 15/04/21.
//

import Foundation
import Moya


enum SupplyService {
  case session(email: String, password: String)
  case orders(locationId: Int)
}


extension SupplyService: TargetType {

  var baseURL: URL {
    URL(string: "http://localhost:8085")!
  }

  var path: String {
    switch self {
    case .session:
      return "/session"
    case .orders(let locationId):
      return "/internal/locations/\(locationId)/orders"
    }
  }

  var method: Moya.Method {
    switch self {
    case .session:
      return .get
    case .orders:
      return .post
    }
  }

  var task: Task {
    switch self {
    case .session(let email, let password):
      let parameters = ["email": email, "password": password]
      return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
    case .orders:
      return .requestPlain
    }
  }

  var headers: [String : String]? {
    [ "Content-Type": "application/json" ]
  }

  // Useful for testing.
  var sampleData: Data {
    Data()
  }

}


/// This should be cached somewhere else.
let provider = MoyaProvider<SupplyService>()



