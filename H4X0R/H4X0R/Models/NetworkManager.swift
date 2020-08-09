//
//  NetworkManager.swift
//  H4X0R
//
//  Created by Nico Niebergall on 09.08.20.
//  Copyright © 2020 Nico Niebergall. All rights reserved.
//

import Foundation

struct NetworkError {
    var description: String?
}

class NetworkManager: ObservableObject {

    @Published var posts = [Post]()
    @Published var error: NetworkError?

    let decoder = JSONDecoder()

    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)

            let task = session.dataTask(with: url) { (data, response, error) in

                if error != nil {
                    DispatchQueue.main.async {
                        self.error = NetworkError(description: "Retrieving data failed.")
                    }
                }

                if let data = data {
                    do {
                        let results = try self.decoder.decode(ApiResults.self, from: data)

                        DispatchQueue.main.async {
                            self.posts = results.hits
                            self.error = nil
                        }

                    } catch {
                        DispatchQueue.main.async {
                            self.error = NetworkError(description: "Decoding data failed.")
                        }
                    }
                }
            }

            task.resume()
        }


    }
}
