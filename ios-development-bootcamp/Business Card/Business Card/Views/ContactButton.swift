//
//  ContactButton.swift
//  Business Card
//
//  Created by Nico Niebergall on 09.08.20.
//  Copyright © 2020 Nico Niebergall. All rights reserved.
//

import SwiftUI

enum ButtonType {
    case primary
    case secondary
}

struct MyButtonStyle: ButtonStyle {
    var type : ButtonType

    func makeBody(configuration: Self.Configuration) -> some View {
        let backgroundColor = type == .primary ? Color("Purple") : Color("LightGrey")
        let backgroundHoverColor = type == .primary ? Color("Yellow") : Color("Grey")
        
        let textColor = type == .primary ? Color(.white) : Color("Grey")
        let textHoverColor = Color(.white)
        
        return configuration.label
            .foregroundColor(configuration.isPressed ? textHoverColor : textColor)
            .frame(maxWidth: .infinity)
            .padding(15)
            .background(configuration.isPressed ? backgroundHoverColor : backgroundColor)
            .cornerRadius(10)
            .shadow(radius: configuration.isPressed && type == .secondary ? 15 : 0)
    }
}

struct ContactButton: View {
    var text : String
    var icon : String
    var link : String
    var type : ButtonType = ButtonType.primary

    var body: some View {
        Button(action: { UIApplication.shared.open(URL(string: self.link)!) }) {
            HStack {
                Image(systemName: icon)
                Text(text)
            }
        }.buttonStyle(MyButtonStyle(type: type))
    }
}

struct ContactButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContactButton(text: "Some text", icon: "envelope.badge", link: "https://google.com")
                .previewDisplayName("Default colors")
            ContactButton(text: "Some text", icon: "envelope.badge", link: "https://google.com", type: .secondary)
                .previewDisplayName("Alternative colors")
        }.previewLayout(.sizeThatFits)
    }
}
