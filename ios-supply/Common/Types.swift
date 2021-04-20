//
//  Types.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 19/04/21.
//

import Foundation


enum Either<A, B> {
  case left(A)
  case right(B)
}


extension Either: CustomStringConvertible {

  var description: String {
    switch self {
    case .left(let value):
      return "left(\(value))"
    case .right(let value):
      return "right(\(value))"
    }
  }

}
