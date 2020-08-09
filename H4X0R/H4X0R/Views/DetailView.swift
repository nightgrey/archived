//
//  DetailView.swift
//  H4X0R
//
//  Created by Nico Niebergall on 09.08.20.
//  Copyright © 2020 Nico Niebergall. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let url: String?

    var body: some View {
        Group {
            WebView(url: url).edgesIgnoringSafeArea(.all)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}


