//
//  HTTPNetworkResponse.swift
//  openarms
//
//  Created by Alexander Stevens on 6/11/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import Foundation

enum Result<T> {
  case success(T)
  case failure(HTTPNetworkError)
}

struct HTTPNetworkResponse {

  static func handleNetworkResponse(for response: HTTPURLResponse?) -> Result<Any>{

    guard let res = response else { return Result.failure(HTTPNetworkError.UnwrappingError) }
    switch res.statusCode {

    case 200...299: return Result.success("Success!")
    case 401: return Result.failure(HTTPNetworkError.authenticationError)
    case 400...499: return Result.failure(HTTPNetworkError.badRequest)
    case 500...599: return Result.failure(HTTPNetworkError.serverSideError)
    default: return Result.failure(HTTPNetworkError.failed)
    }
  }
}
