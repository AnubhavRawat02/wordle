//
//  StatsView.swift
//  wordle
//
//  Created by Anubhav Rawat on 03/09/22.
//

import SwiftUI

struct StatsView: View {
    @AppStorage(Constants.wordFeverScores) private var wordFeverScore = 0
    @AppStorage(Constants.wordleStats) private var wordleStats = 0
    @Binding var currentScreen :String
    var body: some View {
        ZStack {
            Color("RulesColor").ignoresSafeArea()
            VStack(spacing: 50){
    //                best word fever score
                VStack(spacing: 20){
                    Text("best word fever score : \(wordFeverScore)")
                        .font(.custom("RobotoSlab-ExtraBold", size: 27))
                    Text("best wordle score: \(wordleStats)")
                        .font(.custom("RobotoSlab-ExtraBold", size: 27))
                }
                
                Button {
                    wordFeverScore = 0
                    wordleStats = 0
                } label: {
                    WordFeverButton(buttonText: "Reset")
                }
                Button {
                    currentScreen = Constants.pickModes
                } label: {
                    CustomButton(buttontext: "Home")
                }
            }
        }
    }
}

//struct StatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatsView()
//    }
//}
