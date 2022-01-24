//
//  Users.swift
//  GitHubUsersApp
//
//  Created by Luis Larghi on 2020-07-20.
//  Copyright © 2020 Luis Larghi. All rights reserved.
//

import Foundation

struct User: Decodable, Identifiable {
    var id: Int
    var username: String
    var avatarUrl: String
    var profileUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case username = "login"
        case avatarUrl = "avatar_url"
        case profileUrl = "html_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try values.decode(Int.self, forKey: .id)
        self.username = try values.decode(String.self, forKey: .username)
        self.avatarUrl = try values.decode(String.self, forKey: .avatarUrl)
        self.profileUrl = try values.decode(String.self, forKey: .profileUrl)
    }
}
