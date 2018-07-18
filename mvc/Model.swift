//
//  Model.swift
//  mvc
//
//  Created by 辻林大揮 on 2018/07/12.
//  Copyright © 2018年 chocovayashi. All rights reserved.
//

import Foundation
import RealmSwift

class Owner: Object, Codable {
    @objc dynamic var name = ""
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
    }
}

class Model: Object, Codable {
    
    @objc dynamic var owner: Owner!
    @objc dynamic var repositoryName = ""
    @objc dynamic var url = ""
    
    enum CodingKeys: String, CodingKey {
        case owner
        case repositoryName = "name"
        case url = "html_url"
    }
}
