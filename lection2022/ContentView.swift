//
//  ContentView.swift
//  lection2022
//
//  Created by Yeva on 19.10.2022.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["👿","😍","🎉","🎃","🥶","🤢","🫥","☠️","🤡","🤖","💩","😺","🫴","🧑‍🌾","👨‍🚒","🙉","🐔","🪳","🦕","🐬","🏓","🎣","⛹️‍♀️"]
    @State var emojiCount = 6
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        cardView(content: emoji, isFaceUp: true).aspectRatio(2/3, contentMode: .fit)
                    }
                }.foregroundColor(.red)
            }
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }.font(.largeTitle).padding(.horizontal)
        }.padding(.horizontal)
    }
    var remove: some View{
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View{
        Button {
            if emojiCount<emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}

struct cardView: View{
    var content: String
    @State var isFaceUp: Bool
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if !isFaceUp{
                shape.fill()
            } else{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}












































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.light)
    }
}
