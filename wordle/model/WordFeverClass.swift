//
//  wordFeverClass.swift
//  wordle
//
//  Created by Anubhav Rawat on 01/09/22.
//

import SwiftUI

class WordFeverClass: ObservableObject{
    @Published var word: String = "word"
    @Published var score: Int = 0
    @Published var shuffledWord: String = "word"
    
    init(){
        pickWord()
    }
    
    func pickWord(){
        word = wordFeverData.randomElement()!.uppercased()
        shuffledWord = word.shuffle().uppercased()
    }
    
    func shuffleWord(){
        shuffledWord = word.shuffle().uppercased()
    }
    
    func checkWord(typedWord: String) -> Bool{
        if typedWord.lowercased() == word.lowercased(){
            score = score + 1
            pickWord()
            return true
        }else{
            return false
        }
    }
    
    
    
}
