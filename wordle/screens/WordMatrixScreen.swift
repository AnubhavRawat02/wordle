//
//  WordMatrixScreen.swift
//  wordle
//
//  Created by Anubhav Rawat on 18/10/22.
//

import SwiftUI

struct WordMatrixScreen: View {
    
    @State var selectedWord: String = ""
    @State var reset:Bool = false
    @Binding var currentScreen: String
    @State var found:Bool = false
    
    @StateObject var wordmatrixobj: WordMatrix = WordMatrix()
    
    var body: some View {
        ZStack{
            MotionAnimation()
            VStack{
                VStack(spacing: 1){
                    
                    ForEach(wordmatrixobj.matrix, id: \.self){row in
                        Rows(rowword: row, selectedWord: $selectedWord, reset: $reset, found: $found)
                    }
                }
                .onChange(of: selectedWord) { newValue in
                    if selectedWord.count == 6{
                        if wordmatrixobj.checkWord(word: selectedWord){
        //                    word was found
                            selectedWord = ""
                            reset = !reset
                            found = !found
                            print("word found")
                        }
                    }
                    if selectedWord.count == 7{
                        if wordmatrixobj.checkWord(word: selectedWord){
        //                    word found
                            selectedWord = ""
                            reset = !reset
                            found = !found
                            print("word found")
                        }
                        else{
        //                    word not found. give haptic feedback
                            selectedWord = ""
                            reset = !reset
                            print("word not found")
                        }
                    }
                    
                    if wordmatrixobj.remainingWords.count == 0{
                        currentScreen = Constants.pickModes
                    }
                }
                
                VStack{
                    if wordmatrixobj.words.count == 0{
                        Text("done")
                    }else{
                        ForEach(wordmatrixobj.remainingWords, id: \.self){word in
                            Text(word)
                        }
                    }
                    Spacer()
                }.frame(width: 350, height: 200)
                HStack(spacing:30){
                    Button {
                        reset = !reset
                        selectedWord = ""
                    } label: {
                        Text("Erase")
                    }
                    
                    Button {
                        currentScreen = Constants.pickModes
                    } label: {
                        Text("main menu")
                    }


                }
            }
        }
        
    }
}

struct Rows: View{
    
    var rowword: [L]
    @Binding var selectedWord: String
    @Binding var reset: Bool
    @Binding var found: Bool
    
    var body: some View{
        HStack(spacing:1){
            ForEach(rowword, id: \.self){leter in
                Leter(selectedWord: $selectedWord, reset: $reset, leter: leter, found: $found)
            }
        }
    }
}

struct Leter: View{
    @Binding var selectedWord: String
    @Binding var reset: Bool
    var leter: L
    @State private var selected:Bool = false
    @State private var correct: Bool = false
    @Binding var found:Bool
    
    var body: some View{
        ZStack(alignment: .center){
            if correct{
                Color.green.frame(width: 35, height: 35)
            }else if selected{
                Color.black.frame(width: 35, height: 35)
            }else{
                Color.blue.frame(width: 35, height: 35)
            }
                
            Text("\(leter.ltr.uppercased())").foregroundColor(.white)
                .fontWeight(.bold)
                .font(.system(size: 20))
        }
        .cornerRadius(8)
        .onChange(of: found, perform: { newValue in
            if selected{
                correct = true
            }
        })
        .onChange(of: reset, perform: { newValue in
            selected = false
        })
        
        .onTapGesture {
            if !selected{
                selectedWord = "\(selectedWord)\(leter.ltr)"
                DispatchQueue.main.async {
                    selected = true
                }
            }
        }
    }
}

//struct WordMatrixScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        WordMatrixScreen()
//    }
//}
