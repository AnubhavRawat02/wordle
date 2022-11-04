//
//  WordleClass.swift
//  wordle
//
//  Created by Anubhav Rawat on 26/08/22.
//

import Foundation
import SwiftUI

protocol CheckWordCompleted{
    func checkCompleted(exists:Bool, typeword:String)
}

class WordleClass{
    var word:String = "random"
    var typedWords:[String] = []
    
//    try of current word
    var currenttry = 0
    var score: Int = 0
    var mistakes: Int = 0
    
    var xyz: String?
    var delegate:CheckWordCompleted?
    var match:Bool = false
    
    func selectWord(){
        word = wordleData.randomElement()!
        print(word)
        currenttry = 0
        typedWords = []
    }
    
    func checkWord(typedWord: String){
        let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(typedWord)")
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            if error != nil{
                print(error ?? "wtf")
                return
            }
            if let safedata = data{
                self.parseJson(wordData: safedata, typedWord: typedWord)
            }
        }
        
        task.resume()
    }
    
    func matchWord(typedword: String) -> [Color]{
        var colorarray: [Color] = []
        let typedWord = typedword.lowercased()
        for i in 0...4{
            if(typedWord[typedWord.index(typedWord.startIndex, offsetBy: i)] == word[word.index(word.startIndex, offsetBy: i)]){
                colorarray.append(Color("RightLetterColor"))
            }else if(word.contains(typedWord[typedWord.index(typedWord.startIndex, offsetBy: i)])){
                colorarray.append(Color("PlaceLetterColor"))
            }else{
                colorarray.append(Color("WrongLetterColor"))
            }
        }
        if word == typedWord{
            match = true
        }
        currenttry = currenttry + 1
        return colorarray
    }
    
    func wordarray(typedWord: String)-> [String] {
        var wordArray:[String] = []
        for i in 0...4{
            wordArray.append("\(typedWord[typedWord.index(typedWord.startIndex, offsetBy: i)])".uppercased())
        }
        return wordArray
    }
    
    func parseJson(wordData: Data, typedWord: String){
        let decoder = JSONDecoder()
        do{
            _ = try decoder.decode([WordData].self, from: wordData)
            delegate?.checkCompleted(exists: true, typeword: typedWord)
        }catch{
            delegate?.checkCompleted(exists: false, typeword: typedWord)
        }
    }
    
}
