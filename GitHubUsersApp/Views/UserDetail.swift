//
//  UserDetail.swift
//  GitHubUsersApp
//
//  Created by Luis Larghi on 2020-07-22.
//  Copyright © 2020 Luis Larghi. All rights reserved.
//

import SwiftUI
import URLImage

let JSON = """
{
    "login": "Xertz",
    "id": 2753482,
    "html_url": "https://api.github.com/users/Xertz",
    "avatar_url": "https://avatars1.githubusercontent.com/u/2753482?v=4"
}
"""
let jsonData = JSON.data(using: .utf8)!
let mockUser: User = try! JSONDecoder().decode(User.self, from: jsonData)

struct UserDetail: View {
    var currentUser: User
    
    var body: some View {
        VStack {
            URLImage(URL(string: currentUser.avatarUrl)!)
            Text(currentUser.username)
        }
        .navigationBarTitle(Text(currentUser.username), displayMode: .inline)
    }
}

struct UserDetail_Previews: PreviewProvider {
    static var previews: some View {
        UserDetail(currentUser: mockUser)
    }
}
