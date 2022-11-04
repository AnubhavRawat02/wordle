//
//  WordleGameView.swift
//  wordle
//
//  Created by Anubhav Rawat on 26/08/22.
//

import SwiftUI
struct WordleGameView: View, CheckWordCompleted {
    
    @Binding var currentScreen: String
    
    @State var isFlipped: Int = 0
    @AppStorage(Constants.wordleStats) var wordleStats: Int = 0
    
    @State var word1: [String] = ["9", "9", "9", "9", "9"]
    @State var word2: [String] = ["9", "9", "9", "9", "9"]
    @State var word3: [String] = ["9", "9", "9", "9", "9"]
    @State var word4: [String] = ["9", "9", "9", "9", "9"]
    @State var word5: [String] = ["9", "9", "9", "9", "9"]
    @State var word6: [String] = ["9", "9", "9", "9", "9"]
    
    @State var colors1 : [Color] = [Color("RightLetterColor"), Color("PlaceLetterColor"), Color("PlaceLetterColor"), Color("WrongLetterColor"), Color("WrongLetterColor")]
    @State var colors2 : [Color] = [Color("RightLetterColor"), Color("PlaceLetterColor"), Color("PlaceLetterColor"), Color("WrongLetterColor"), Color("WrongLetterColor")]
    @State var colors3 : [Color] = [Color("RightLetterColor"), Color("PlaceLetterColor"), Color("PlaceLetterColor"), Color("WrongLetterColor"), Color("WrongLetterColor")]
    @State var colors4 : [Color] = [Color("RightLetterColor"), Color("PlaceLetterColor"), Color("PlaceLetterColor"), Color("WrongLetterColor"), Color("WrongLetterColor")]
    @State var colors5 : [Color] = [Color("RightLetterColor"), Color("PlaceLetterColor"), Color("PlaceLetterColor"), Color("WrongLetterColor"), Color("WrongLetterColor")]
    @State var colors6 : [Color] = [Color("RightLetterColor"), Color("PlaceLetterColor"), Color("PlaceLetterColor"), Color("WrongLetterColor"), Color("WrongLetterColor")]
    
    @State var typedWord = ""
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    @State var mistakes: Int = 0
    
    func reset(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            word1 = ["9", "9", "9", "9", "9"]
            word2 = ["9", "9", "9", "9", "9"]
            word3 = ["9", "9", "9", "9", "9"]
            word4 = ["9", "9", "9", "9", "9"]
            word5 = ["9", "9", "9", "9", "9"]
            word6 = ["9", "9", "9", "9", "9"]
        }
    }
    
    //MARK: - CHECK COMPLETED FUNCTION
    func checkCompleted(exists: Bool, typeword: String) {
        if exists{
//            match the word. create new word array.
            let colorArray:[Color] = wordleObj.matchWord(typedword: typeword)
            let wordArray:[String] = wordleObj.wordarray(typedWord: typeword)
            if(wordleObj.currenttry == 1){
                word1 = wordArray
                colors1 = colorArray
            }else if(wordleObj.currenttry == 2){
                word2 = wordArray
                colors2 = colorArray
            }else if(wordleObj.currenttry == 3){
                word3 = wordArray
                colors3 = colorArray
            }else if(wordleObj.currenttry == 4){
                word4 = wordArray
                colors4 = colorArray
            }else if(wordleObj.currenttry == 5){
                word5 = wordArray
                colors5 = colorArray
            }else{
                word6 = wordArray
                colors6 = colorArray
            }
            
//            if word is found
            if (wordleObj.word == typeword.lowercased()){
                print("found")
                wordleObj.score = wordleObj.score + 1
                wordleStats = wordleStats + 1
                isFlipped = isFlipped + 1
                reset()
                wordleObj.selectWord()
            }
//            wordle mistakes limit reached
            if wordleObj.currenttry >= 6{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    mistakes = mistakes + 1
                    if mistakes == 3{
                        if wordleObj.score > wordleStats{
                            wordleStats = wordleObj.score
                        }
                        currentScreen = Constants.wordleScore
                    }
                }
                isFlipped = isFlipped + 1
                reset()
                wordleObj.selectWord()
            }
        }else{
//            haptic for wrong
            hapticFeedback.notificationOccurred(.error)
        }
    }
    var wordleObj:WordleClass
    
    var body: some View {
        ZStack {
            MotionAnimation()
            VStack(alignment: .center, spacing: 20) {
                
                WordleMistakes(mistakes: $mistakes)
                
//                heading
//                Text("score: \(wordleObj.score)")
                Text("Wordle")
                    .font(.largeTitle)
                    .fontWeight(.bold)
//                grid
                VStack(spacing: 8){
                    GridRow(word: $word1, colors: $colors1, isFlipped: $isFlipped)
                    GridRow(word: $word2, colors: $colors2, isFlipped: $isFlipped)
                    GridRow(word: $word3, colors: $colors3, isFlipped: $isFlipped)
                    GridRow(word: $word4, colors: $colors4, isFlipped: $isFlipped)
                    GridRow(word: $word5, colors: $colors5, isFlipped: $isFlipped)
                    GridRow(word: $word6, colors: $colors6, isFlipped: $isFlipped)
                }
//                textfield
                ZStack{
                    Capsule()
                        .stroke(.blue, lineWidth: 4)
                        .frame(width: 300, height: 50)
                    Capsule().fill(.blue.opacity(0.2))
                        .frame(width: 300, height: 50)
                    TextField("type word here", text: $typedWord)
                        .frame(width: 250, height: 50)
                        .onSubmit {
                            if typedWord.count != 5{
//                                wrong haptic
                                hapticFeedback.notificationOccurred(.error)
                                typedWord = ""
                                return
                            }
                            wordleObj.checkWord(typedWord: typedWord)
                            typedWord = ""
                        }
                }
                Spacer()
                Button {
                    currentScreen = Constants.pickModes
                } label: {
                    CustomButton(buttontext: "Home")
                }

            }
        }//zstack
        .onAppear {
            wordleObj.selectWord()
            wordleObj.delegate = self
        }
        
    }
}

//struct WordleGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        WordleGameView()
//    }
//}

