//
//  RulesView.swift
//  wordle
//
//  Created by Anubhav Rawat on 26/08/22.
//

import SwiftUI

struct WordLetter: View{
    var letter: String
    var color: CGColor
    var body: some View{
        ZStack{
            Color(color)
            Text(letter)
        }.frame(width: 60, height: 60)
    }
}

struct RulesView: View {
    
    @Binding var currentScreen: String
    
    let exampleword: [String] = ["C", "U", "R", "V", "E"]
    let letterColor: [CGColor] = [
        CGColor(red: 0.525, green: 0.545, blue: 0.557, alpha: 1),
        CGColor(red: 0.506, green: 0.714, blue: 0.133, alpha: 1),
        CGColor(red: 0.506, green: 0.714, blue: 0.133, alpha: 1),
        CGColor(red: 0.973, green: 0.824, blue: 0.063, alpha: 1),
        CGColor(red: 0.973, green: 0.824, blue: 0.063, alpha: 1),
    ]
    var body: some View {
        ZStack{
            Color("RulesColor").ignoresSafeArea()
            VStack(spacing:15){
//                how to play
//                Spacer(minLength: 30)
                GroupBox{
                    VStack(spacing: 10){
                        Text("How To play Wordle")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Guess the wordle in 6 tries. Each guess must be a 5 letter word. After each guess, the color of the tiles will change to show how close your guess was to the word.")
                            .font(.headline)
                            .fontWeight(.light)
                            .padding()
                    }

                }.padding(.horizontal, 20)
                                Spacer()
//                Examples
                Text("Example").font(.title2)
                HStack{
                    ForEach(0..<5){index in
                        WordLetter(letter: exampleword[index], color: letterColor[index])
                    }
                }
                VStack(alignment: .leading, spacing: 6){
                    Text("Letter C is not present in the word in any position")
                        .font(.headline)
                        .fontWeight(.light)
                    Text("Letters U and R are present in correct positions")
                        .font(.headline)
                        .fontWeight(.light)
                    Text("Letters V and E are present in the word but not in correct positions")
                        .font(.headline)
                        .fontWeight(.light)
                }
                
                
                Button {
                    currentScreen = Constants.pickModes
                } label: {
                    CustomButton(buttontext: "Home")
                }

                Spacer(minLength: 110)
            }
        }.onAppear {
            print("in the rules view")
//            wordleObj = WordleClass()
        }
    }
}

//struct RulesView_Previews: PreviewProvider {
//    static var previews: some View {
//        RulesView()
//    }
//}
