//
//  Constants.swift
//  Mini Chat
//
//  Created by Nico Niebergall on 04.08.20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

struct Constants {
    static let appName = "MiniChat"
    
    // Segues
    struct Segues {
        static let register = "RegisterToChat"
        static let login = "LoginToChat"
    }

    // Cells
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"

    // Colors
    struct Colors {
        static let primary = "BrandPrimary"
        static let primaryLight = "BrandLightPurple"
        static let secondary = "BrandSecondary"
        static let secondaryLight = "BrandSecondaryLight"
    }
    
    // Firebase
    struct Firestore {
        static let messageCollection = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
