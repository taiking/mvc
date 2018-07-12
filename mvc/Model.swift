//
//  Model.swift
//  mvc
//
//  Created by 辻林大揮 on 2018/07/12.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import Foundation

struct Model: Codable {
    
    struct Owner: Codable {
        var name: String
        enum CodingKeys: String, CodingKey {
            case name = "login"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case owner
        case repositoryName = "name"
        case url = "html_url"
    }
    
    var owner: Owner
    var repositoryName: String
    var url: String
}
