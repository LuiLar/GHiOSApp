//
//  ImageViewModel.swift
//  GitHubUsersApp
//
//  Created by Luis Larghi on 2020-07-22.
//  Copyright © 2020 Luis Larghi. All rights reserved.
//

import Foundation

//
//  UserViewModel.swift
//  GitHubUsersApp
//
//  Created by Luis Larghi on 2020-07-22.
//  Copyright © 2020 Luis Larghi. All rights reserved.
//

import Foundation

class ImageViewModel: ObservableObject {
    @Published var searchQuery: String = "" {
        didSet {
            
        }
    }
    
    private func getByImageByUrl(url: String) {
        let url = URL(string: url)!
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            
            do {
                if let data = data {

                    _ = try JSONDecoder().decode(Response.self, from: data)
                    
                    DispatchQueue.main.async {
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
