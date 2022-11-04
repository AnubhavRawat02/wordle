//
//  WordFeverRulesView.swift
//  wordle
//
//  Created by Anubhav Rawat on 04/09/22.
//

import SwiftUI

struct WordFeverRulesView: View {
    @Binding var currentScreen: String
    var body: some View {
        VStack{
//            Spacer()
            GroupBox{
                VStack(alignment: .leading, spacing: 10){
                    Text("How to play word fever")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("use all the given letters to guess the correct word")
                        .font(.headline)
                        .fontWeight(.light)
                    Text("there is only one correct answer.")
                        .font(.headline)
                        .fontWeight(.light)
                    Text("use shuffle to re-shuffle the word.")
                        .font(.headline)
                        .fontWeight(.light)
                }
            }
            
            Text("Example")
            HStack{
                RowElement(letter: "D")
                RowElement(letter: "")
                RowElement(letter: "")
                RowElement(letter: "")
            }
            VStack(spacing: -10){
                RowElement(letter: "D")
                HStack(spacing: 70){
                    RowElement(letter: "O")
                    RowElement(letter: "W")
                }
                RowElement(letter: "N")
            }
            
            Button {
                currentScreen = Constants.pickModes
            } label: {
                CustomButton(buttontext: "Home")
            }

            Spacer(minLength: 130)
            
        }
    }
}

//struct WordFeverRulesView_Previews: PreviewProvider {
//    static var previews: some View {
//        WordFeverRulesView()
//    }
//}
