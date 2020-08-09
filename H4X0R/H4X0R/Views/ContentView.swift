//
//  ContentView.swift
//  H4X0R
//
//  Created by Nico Niebergall on 09.08.20.
//  Copyright © 2020 Nico Niebergall. All rights reserved.
//

import SwiftUI

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct PostListView: View {
    var post: Post

    var body: some View {
        NavigationLink(destination: DetailView(url: post.url ?? nil)) {
            HStack(alignment: .center, spacing: 15) {
                VStack {
                    Text(String(post.points))
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.all, 5)
                        .background(Rectangle().fill(Color(.orange)))
                }
                VStack(alignment: .leading, spacing: 0) {
                    Text(post.title)
                        .font(.headline)
                        .foregroundColor(Color(.label))
                    HStack(alignment: .center, spacing: 10) {

                        HStack(alignment: .center, spacing: 4) {
                        Image(systemName: "person.crop.circle.fill").foregroundColor(.secondary).font(.system(size: 14))
                        Text(post.author)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        }
                        HStack(alignment: .center, spacing: 4) {
                            Image(systemName: "bubble.right.fill").foregroundColor(.secondary).font(.system(size: 11))
                            Text(String(post.numComments))
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        NavigationView {
            List(networkManager.posts) { (post: Post) in
                PostListView(post: post)
            }
            .navigationBarTitle("H4XOR News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            List {
                PostListView(post: Post(createdAt: 160418111, title: "This is a test post", url: "https://google.com", author: "Nico Niebergall", points: 482, numComments: 135, objectID: "24096082")).previewLayout(.sizeThatFits)
                PostListView(post: Post(createdAt: 160418111, title: "Lorem ipsum si dolor amet", url: "https://google.com", author: "Nico Niebergall", points: 421, numComments: 135, objectID: "24096084")).previewLayout(.sizeThatFits)
                PostListView(post: Post(createdAt: 160418111, title: "How I learned to be a dev gurl", url: "https://google.com", author: "Nico Niebergall", points: 255, numComments: 135, objectID: "24096087")).previewLayout(.sizeThatFits)
                PostListView(post: Post(createdAt: 160418111, title: "How to make an awesome todo app and why it's called \"Minitodos\"?!", url: "https://google.com", author: "Nico Niebergall", points: 103, numComments: 135, objectID: "24096088")).previewLayout(.sizeThatFits)
            }
            List {
                PostListView(post: Post(createdAt: 160418111, title: "This is a test post", url: "https://google.com", author: "Nico Niebergall", points: 482, numComments: 135, objectID: "24096082")).previewLayout(.sizeThatFits)
                PostListView(post: Post(createdAt: 160418111, title: "Lorem ipsum si dolor amet", url: "https://google.com", author: "Nico Niebergall", points: 421, numComments: 135, objectID: "24096084")).previewLayout(.sizeThatFits)
                PostListView(post: Post(createdAt: 160418111, title: "How I learned to be a dev gurl", url: "https://google.com", author: "Nico Niebergall", points: 255, numComments: 135, objectID: "24096087")).previewLayout(.sizeThatFits)
                PostListView(post: Post(createdAt: 160418111, title: "How to make an awesome todo app and why it's called \"Minitodos\"?!", url: "https://google.com", author: "Nico Niebergall", points: 103, numComments: 135, objectID: "24096088")).previewLayout(.sizeThatFits)
            }.environment(\.colorScheme, .dark)
        }
    }
}

