//
//  WordMatrix.swift
//  wordle
//
//  Created by Anubhav Rawat on 18/10/22.
//

import Foundation

struct L: Hashable{
    var ltr: String
    var id: UUID
    
    init(ltr: String, id: UUID) {
        self.ltr = ltr
        self.id = id
    }
}

class WordMatrix: ObservableObject{
    var matrixSize: Int = 10
    var numberOfWords: Int = 10
    var words: [String] = []
    var remainingWords: [String] = []
    var matrix: [[L]] = Array(repeating: Array(repeating: L(ltr: "", id: UUID()), count: 10), count: 10)
    
    init(){
//        get random words selected
        var sixletterset: Set<String> = []
        while (sixletterset.count < 4){
            sixletterset.insert(sixletter.randomElement()!)
        }
        
        var sevenletterset: Set<String> = []
        while(sevenletterset.count < 3){
            sevenletterset.insert(sevenletter.randomElement()!)
        }
        
        let sixletterlist: [String] = Array(sixletterset)
        let sevenletterlist: [String] = Array(sevenletterset)
        
//        choose a design
//        let design: [[Int]] = [design1, design2].randomElement()!
        
        let design: [[Int]] = design1
        
//        fill the matrix with seven letter words
        for i in 0...2{
            let position: [Int] = design[i]
            let word: String = sevenletterlist[i]
            
            if position[0] == position[2]{
                
//                same row
                let r = position[0]
                var c = position[1]
                
                for leter in word{
                    matrix[r][c] = L(ltr: "\(leter)", id: UUID())
                    c = c + 1
                }
            }
            else if position[1] == position[3]{
//                same column
                var r = position[0]
                let c = position[1]
                
                for leter in word{
                    matrix[r][c] = L(ltr: "\(leter)", id: UUID())
                    r = r + 1
                }
            }
            else{
//                diagonal word
                var r = position[0]
                var c = position[1]
                
                for leter in word{
                    matrix[r][c] = L(ltr: "\(leter)", id: UUID())
                    r = r + 1
                    c = c + 1
                }
            }
        }
//        fill the matrix with six letter words
        for i in 3...6{
            let position: [Int] = design[i]
            let word: String = sixletterlist[i-3]
            if position[0] == position[2]{
//                same row
                let r = position[0]
                var c = position[1]
                
                for leter in word{
                    matrix[r][c] = L(ltr: "\(leter)", id: UUID())
                    c = c + 1
                }
            }
            else if position[1] == position[3]{
//                same column
                var r = position[0]
                let c = position[1]
                
                for leter in word{
                    matrix[r][c] = L(ltr: "\(leter)", id: UUID())
                    r = r + 1
                }
            }
            else{
//                diagonal word
                var r = position[0]
                var c = position[1]
                
                for leter in word{
                    matrix[r][c] = L(ltr: "\(leter)", id: UUID())
                    r = r + 1
                    c = c + 1
                }
            }
        }
//        filling the rest of the matrix
        for i in 0...9{
            for j in 0...9{
                if matrix[i][j].ltr == ""{
                    matrix[i][j] = L(ltr: ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "y", "z", "x"].randomElement()!, id: UUID())
                }
            }
        }
        words.append(contentsOf: sixletterlist)
        words.append(contentsOf: sevenletterlist)
        remainingWords.append(contentsOf: words)
        print(matrix)
    }
    
    func checkWord(word: String)-> Bool{
        if remainingWords.contains(word){
            remainingWords = remainingWords.filter(){$0 != word}
            return true
        }else{
            return false
        }
    }
    
}
