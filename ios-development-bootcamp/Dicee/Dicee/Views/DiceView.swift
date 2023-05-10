//
//  DiceView.swift
//  Dicee
//
//  Created by Nico Niebergall on 09.08.20.
//  Copyright © 2020 Nico Niebergall. All rights reserved.
//

import SwiftUI

struct DiceView: View {
    var number : Int = 1
    var size : CGFloat = 80
    
    var body: some View {
        ZStack {
            Color(.systemRed)
            Text(String(number)).font(.system(size: size - 30 <= 10 ? 10 : size - 30, weight: .black, design: .default)).foregroundColor(.white)
        }.frame(width: size, height: size, alignment: .center)
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DiceView()
            DiceView(number: 2)
        }
    }
}
