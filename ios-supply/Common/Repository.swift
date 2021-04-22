//
//  Repository.swift
//  ios-supply
//
//  Created by Alexandre Lucchesi on 21/04/21.
//

import Foundation


protocol Repository {

  associatedtype T

  func list() -> [T]
  
  // Traditionally
  // func list(completion: (Result<[T], Error>) -> Void)

  // RxSwift
  // func list() -> Observable<[T]>

}
