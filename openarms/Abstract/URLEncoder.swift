//
//  URLEncoder.swift
//  openarms
//
//  Created by Alexander Stevens on 6/11/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import Foundation

public struct URLEncoder {

  static func encodeParameters(for urlRequest: inout URLRequest, with parameters: HTTPParameters) throws {
    guard let url = urlRequest.url, let parameters = parameters else { throw HTTPNetworkError.missingURL }

    if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
      urlComponents.queryItems = [URLQueryItem]()

      for (key,value) in parameters {
        let queryItem = URLQueryItem(name: key, value: "\(value)")
        urlComponents.queryItems?.append(queryItem)
      }
      urlRequest.url = urlComponents.url
    }
  }

  static func setHeaders(for urlRequest: inout URLRequest, with headers: HTTPHeaders) throws {

    for (key, value) in headers {
      urlRequest.setValue(value, forHTTPHeaderField: key)
    }
  }
}
