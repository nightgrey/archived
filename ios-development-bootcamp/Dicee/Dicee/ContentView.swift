//
//  ContentView.swift
//  Dicee
//
//  Created by Nico Niebergall on 09.08.20.
//  Copyright © 2020 Nico Niebergall. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var leftDice : Int = 1
    @State var rightDice : Int  = 3
    
    var body: some View {
        ZStack {
            Color(.systemGreen)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8)
            VStack(alignment: .center, spacing: 10) {
                Text("Dicee")
                    .font(.custom("Monoton-Regular", size: 80))
                    .foregroundColor(.white)
                Spacer()
                HStack(alignment: .center) {
                    DiceView(number: leftDice, size: 120)
                    Spacer()
                    DiceView(number: rightDice, size: 120)
                }.padding(.horizontal, 50)
                Spacer()
                Button(action: {
                    self.leftDice = Int.random(in: 1...6)
                    self.rightDice = Int.random(in: 1...6)
                }) {
                    Text("Roll this shit")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    .padding()
                }.background(Color.red).padding(.bottom)
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice("iPhone 11 Pro")
    }
}
