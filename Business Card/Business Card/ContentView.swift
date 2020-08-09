//
//  ContentView.swift
//  Business Card
//
//  Created by Nico Niebergall on 08.08.20.
//  Copyright © 2020 Nico Niebergall. All rights reserved.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    let height: CGFloat = 60
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: height, maxHeight: height)
            .background(configuration.isPressed ? Color.red : Color.yellow)
            .cornerRadius(.infinity)
    }
}

struct ContentView: View {
    var body: some View {
        ZStack {
            Color("Grey")
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                Image("ProfilePicture")
                    .resizable()
                    .clipShape(Circle())
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, alignment: .center)
                    .shadow(radius: 15)
                    .overlay(Circle().stroke(lineWidth: 1).fill(Color("LightGrey")))
                Text("Nico Niebergall")
                    .font(Font.custom("Ubuntu-Medium", size: 35))
                    .foregroundColor(Color(.white))
                    .padding(.bottom, 2)
                Text("Software Developer")
                    .font(Font.custom("RobotoMono-Medium", size: 18))
                    .foregroundColor(Color("Yellow"))
                Group {
                    ContactButton(text: "E-Mail", icon: "envelope.badge", link: "mailto:nico.niebergall@gmail.com")
                    ContactButton(text: "Phone", icon: "phone", link: "tel:015142322681", type: .secondary)
                }.padding(.horizontal, 15)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
