//
//  WordleFever.swift
//  wordle
//
//  Created by Anubhav Rawat on 01/09/22.
//

import SwiftUI

struct WordleFever: View {
    
    @AppStorage(Constants.wordFeverScores) private var maxScore = 0
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
//    @StateObject private var wordFeverObject: WordFeverClass = WordFeverClass()
    
    var wordFeverObject: WordFeverClass
    
    @Binding var currentScreen: String
    
    @State private var typedWord: String = ""
    
    @State private var wordSelection: [Bool] = [false, false, false, false]
    
    @State var progress = 0.0
    
    var totalTime = 5
    var timeJump = 0.1
    var timeIncrement: Int = 3
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    func checkWord(){
        if wordFeverObject.checkWord(typedWord: typedWord){
            typedWord = ""
            wordSelection = [false, false, false, false]
            hapticFeedback.notificationOccurred(.success)
            if progress <= 3*timeJump{
                progress = 0.0
            }else{
                progress -= 3*timeJump
            }
        }else{
            typedWord = ""
            wordSelection = [false, false, false, false]
            wordFeverObject.shuffleWord()
            hapticFeedback.notificationOccurred(.error)
        }
    }
    
    var body: some View {
        ZStack {
            MotionAnimation()
            VStack(alignment: .center, spacing: 40){
    //            score
                VStack(alignment: .center ,spacing: 10){
                    Text("Score")
                        .font(.title)
                        .fontWeight(.light)
                    Text("\(wordFeverObject.score)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
    //            word
                HStack(spacing: 15){
                    ForEach(0..<4, id: \.self){index in
                        if let letter = typedWord[index]{
                            RowElement(letter: "\(letter)")
                        }else{
                            RowElement(letter: "")
                        }
                       
                    }
                }
    //            shuffle word
                
                ZStack {
                    Circle()
                        .stroke(lineWidth: 20)
                        .foregroundColor(.gray)
                        .opacity(0.2)
                    Circle()
                        .trim(from: 0.0, to: progress)
                        .stroke(AngularGradient(colors: [Color.red, Color.blue, Color.green, Color.pink, Color.purple], center: .center), style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .rotationEffect(Angle(degrees: 270))
                        .animation(.linear, value: progress)
                    VStack(spacing: 10){
                        ShuffledLetter(letter: "\(wordFeverObject.shuffledWord[0])", isSelected: $wordSelection[0])
                            .onTapGesture {
                                if !wordSelection[0]{
                                    wordSelection[0] = true
                                    typedWord = "\(typedWord)\(wordFeverObject.shuffledWord[0])"
                                }
                            }
                        HStack(spacing: 90){
                            ShuffledLetter(letter: "\(wordFeverObject.shuffledWord[1])", isSelected: $wordSelection[1])
                                .onTapGesture {
                                    if !wordSelection[1]{
                                        wordSelection[1] = true
                                        typedWord = "\(typedWord)\(wordFeverObject.shuffledWord[1])"
                                    }
                                }
                            ShuffledLetter(letter: "\(wordFeverObject.shuffledWord[2])", isSelected: $wordSelection[2])
                                .onTapGesture {
                                    if !wordSelection[2]{
                                        wordSelection[2] = true
                                        typedWord = "\(typedWord)\(wordFeverObject.shuffledWord[2])"
                                    }
                                }
                        }
                        ShuffledLetter(letter: "\(wordFeverObject.shuffledWord[3])", isSelected: $wordSelection[3])
                            .onTapGesture {
                                if !wordSelection[3]{
                                    wordSelection[3] = true
                                    typedWord = "\(typedWord)\(wordFeverObject.shuffledWord[3])"
                                }
                            }
                    }
                }
    //            button
                Button {
                    wordSelection = [false, false, false, false]
                    typedWord = ""
                    wordFeverObject.shuffleWord()
                } label: {
                    WordFeverButton(buttonText: "Shuffle")
                }

            }
            .onChange(of: typedWord) { newValue in
                if typedWord.length == 4{
                    checkWord()
                }
            }
        }.onAppear {
            print(wordFeverObject.word)
        }
        .onReceive(timer) { _ in
            progress += timeJump
            if progress >= 1{
                if wordFeverObject.score > maxScore{
                    maxScore = wordFeverObject.score
                }
                currentScreen = Constants.wordFeverResult
            }
        }
    }
}


//MARK: - letter in typed word row
struct RowElement: View{
    var letter: String
    var body: some View{
        ZStack{
            Circle()
                .fill(.blue)
                .frame(width: 80, height: 80)
            Circle().stroke(.white, lineWidth: 4)
                .frame(width: 80, height: 80)
            Text(letter)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

//MARK: - shuffled word letter
struct ShuffledLetter: View{
    var letter: String
    @Binding var isSelected: Bool
    
    var body: some View{
        ZStack{
            Circle()
                .fill(isSelected ? .gray : .blue)
                .frame(width: 80, height: 80)
            Circle()
                .stroke(.white, lineWidth: 4)
                .frame(width: 80, height: 80)
            Text(letter)
                .font(.largeTitle)
                .fontWeight(.bold)
        }
    }
}

struct CircularProgressView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.pink.opacity(0.5),
                    lineWidth: 30
                )
            Circle()
                .trim(from: 0, to: 0.25) // 1
                .stroke(
                    Color.pink,
                    lineWidth: 30
                )
        }
    }
}

//struct WordleFever_Previews: PreviewProvider {
//    static var previews: some View {
//        WordleFever()
//    }
//}
