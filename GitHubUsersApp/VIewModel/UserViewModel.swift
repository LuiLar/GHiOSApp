//
//  UserViewModel.swift
//  GitHubUsersApp
//
//  Created by Luis Larghi on 2020-07-22.
//  Copyright © 2020 Luis Larghi. All rights reserved.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var searchQuery: String = "" {
        didSet {
            
            self.getByUsername(query: searchQuery)
            
        }
    }
    
    private func getByUsername(query: String) {
        let url = URL(string: "\(Constants.GITHUB_API_URL)/users?q=\(query)")!
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            
            do {
                if let data = data {

                    let decodedList = try JSONDecoder().decode(Response.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.users = decodedList.users
                    }
                }
                else {
                    print("No Data from API")
                }
            }
            catch {
                print("ERROR: \(err?.localizedDescription ?? "Unknown")")
            }
            
        }.resume()
    }
}
