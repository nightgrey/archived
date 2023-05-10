//
//  WebView.swift
//  H4X0R
//
//  Created by Nico Niebergall on 09.08.20.
//  Copyright © 2020 Nico Niebergall. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    let url: String?
    typealias UIViewType = WKWebView

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = url, let safeUrl = URL(string: url) {
            uiView.load(URLRequest(url: safeUrl))
        }
    }
}
