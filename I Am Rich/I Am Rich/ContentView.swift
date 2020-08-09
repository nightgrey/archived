//
//  ContentView.swift
//  I Am Rich
//
//  Created by Nico Niebergall on 08.08.20.
//  Copyright © 2020 Nico Niebergall. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemBlue)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.4)
            VStack {
                Image(systemName: "suit.diamond")
                    .fixedSize()
                    .font(.system(size: 150, weight: .light, design: .default))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                Text("I am Rich")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
