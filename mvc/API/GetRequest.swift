//
//  GetRequest.swift
//  mvc
//
//  Created by 辻林大揮 on 2018/07/12.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import APIKit

struct GetRequest: Request {
    typealias Response = [Model]
    
    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/users/taiking/repos"
    }
}

extension GetRequest {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: object as! Data)
    }
}

class DecodableDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }
    
    func parse(data: Data) throws -> Any {
        return data
    }
}
