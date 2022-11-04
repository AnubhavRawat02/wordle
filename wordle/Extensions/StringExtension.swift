//
//  StringExtension.swift
//  wordle
//
//  Created by Anubhav Rawat on 01/09/22.
//

import Foundation

extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func shuffle() -> String{
        var shuffled: [String] = ["", "", "", ""]
        var shuffledString: String = ""
        for i in 0..<self.length{
            shuffled[i] = "\(self[i])"
        }
        
        shuffled.shuffle()
        
        for i in 0..<self.length{
            shuffledString = "\(shuffledString)\(shuffled[i])"
        }
        return shuffledString
    }
}
