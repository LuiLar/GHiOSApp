//
//  Home.swift
//  GitHubUsersApp
//
//  Created by Luis Larghi on 2020-07-20.
//  Copyright © 2020 Luis Larghi. All rights reserved.
//

import SwiftUI

struct Home: View {
    @ObservedObject var userVM = UserViewModel()
    
    var body: some View {

        NavigationView {
            VStack {

                TextField("Find user by username", text: $userVM.searchQuery)
                    .frame(width: 300.0)
                    .padding(.all)
                    .border(Color.black, width: 1)

                List {
                    ForEach(userVM.users) { user in
                        NavigationLink(destination: UserDetail(currentUser: user)) {
                            Text(user.username)
                        }
                    }
                }

            }
            .navigationBarTitle(Text("Search by user"))
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
