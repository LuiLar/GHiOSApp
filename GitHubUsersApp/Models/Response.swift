//
//  Response.swift
//  GitHubUsersApp
//
//  Created by Luis Larghi on 2020-07-20.
//  Copyright © 2020 Luis Larghi. All rights reserved.
//

import Foundation

struct Response: Decodable {
    var users = [User]()
    
    enum CodingKeys: String, CodingKey {
        case users = "items"
    }
    
    init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: CodingKeys.self)
        
        self.users = try data.decode([User].self, forKey: .users)
    }
}
