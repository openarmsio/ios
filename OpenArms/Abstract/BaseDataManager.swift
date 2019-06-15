//
//  BaseDataManager.swift
//  openarms
//
//  Created by Alexander Stevens on 6/11/19.
//  Copyright © 2019 Alexander Stevens. All rights reserved.
//

import Foundation
//import SwiftyJSON

public typealias HTTPParameters = [String: String]?
public typealias HTTPHeaders = [String: String]

public enum HTTPNetworkRoute: String {
  case host = ""
  case testRoute = "/"
}

public enum HTTPMethod: String {
  case get = "GET"
  case post = "POST"
}

public enum HTTPNetworkError: String, Error {
  case parametersNil = "Error Found : Parameters URL were nil."
  case encodingFailed = "Error Found : Parameter Encoding failed."
  case decodingFailed = "Error Found : Unable to Decode the data."
  case missingURL = "Error Found : The URL is nil."
  case couldNotParse = "Error Found : Unable to parse the JSON response."
  case noData = "Error Found : The data from API is Nil."
  case FragmentResponse = "Error Found : The API's response's body has fragments."
  case UnwrappingError = "Error Found : Unable to unwrap the data."
  case dataTaskFailed = "Error Found : The Data Task object failed."
  case success = "Successful Network Request"
  case authenticationError = "Error Found : You must be Authenticated"
  case badRequest = "Error Found : Bad Request"
  case pageNotFound = "Error Found : Page/Route rquested not found."
  case failed = "Error Found : Network Request failed"
  case serverSideError = "Error Found : Server error"
}

class BaseDataManager: NSObject {
  
  let headers = [
    "Accept": "application/json",
    "Content-Type": "application/json",
    "Authorization": "Bearer ",
    "Host": ""
  ]
  
  func configureHTTPRequest(to route: HTTPNetworkRoute, with parameters: HTTPParameters, and method: HTTPMethod, contains body: Data?) throws -> URLRequest {
    guard let url = URL(string: HTTPNetworkRoute.host.rawValue + route.rawValue) else { fatalError("Error while unwrapping url") }
    
    var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 2.0)
    
    request.httpMethod = method.rawValue
    request.httpBody = body
    try configureParametersAndHeaders(parameters: parameters, headers: headers, request: &request)
    
    return request
  }
  
  func configureParametersAndHeaders(parameters: HTTPParameters?,
                                     headers: HTTPHeaders?,
                                     request: inout URLRequest) throws {
    
    do {
      if let headers = headers, let parameters = parameters {
        
        try URLEncoder.encodeParameters(for: &request, with: parameters)
        try URLEncoder.setHeaders(for: &request, with: headers)
      }
    } catch {
      throw HTTPNetworkError.encodingFailed
    }
  }
  
}
