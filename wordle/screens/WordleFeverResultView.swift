//
//  WordleFeverResultView.swift
//  wordle
//
//  Created by Anubhav Rawat on 03/09/22.
//

import SwiftUI

struct WordleFeverResultView: View {
    var wordfeverobj: WordFeverClass
    
    @Binding var currentScreen: String
    
    var body: some View {
        ZStack {
            Color("navyBlue").ignoresSafeArea()
            VStack(alignment: .center, spacing: 20){
                Text("Your score").font(.custom("RobotoSlab-ExtraBold", size: 27))
                    .foregroundColor(.white)
                Text("\(wordfeverobj.score)").font(.custom("RobotoSlab-ExtraBold", size: 27))
                    .foregroundColor(.white)
                Text("Last answer: \(wordfeverobj.word)").font(.custom("RobotoSlab-ExtraBold", size: 27))
                    .foregroundColor(.white)
                Button {
                    currentScreen = Constants.wordFever
                } label: {
                    CustomButton(buttontext: "Try again?")
                }
                
                Button {
                    currentScreen = Constants.pickModes
                } label: {
                    CustomButton(buttontext: "home")
                }
            }
        }
    }
}
//
//struct WordleFeverResultView_Previews: PreviewProvider {
//    static var obj: WordFeverClass = WordFeverClass()
//    static var previews: some View {
//        WordleFeverResultView(wordfeverobj: obj)
//    }
//}
