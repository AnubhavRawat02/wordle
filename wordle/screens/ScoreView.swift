//
//  ScoreView.swift
//  wordle
//
//  Created by Anubhav Rawat on 26/08/22.
//

import SwiftUI

struct ScoreView: View {
//    @AppStorage("screen") var currentScreen = "rules"
    @Binding var currentScreen: String
    let wordleObj:WordleClass
    var body: some View {
        ZStack{
            Color("navyBlue").ignoresSafeArea()
            VStack{
                Text("your score : \(wordleObj.score)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Button {
                    currentScreen = Constants.wordle
                } label: {
                    CustomButton(buttontext: "Again?")
                }
                Button {
                    currentScreen = Constants.pickModes
                } label: {
                    Text("go to main menu")
                }
            }
            Color("ResultColor").ignoresSafeArea()
        }
    }
}

//struct ScoreView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        let wordleObj =  WordleClass()
//        ScoreView(wordleObj: wordleObj)
//    }
//}
