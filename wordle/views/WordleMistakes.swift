//
//  WordleMistakes.swift
//  wordle
//
//  Created by Anubhav Rawat on 04/09/22.
//

import SwiftUI

struct WordleMistakes: View {
//    @State private var mistakes: Int = 2
    @Binding var mistakes: Int
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "cross.fill")
                .font(.system(size: 30))
                .rotationEffect(Angle(degrees: 45))
                .foregroundColor(mistakes >= 1 ? .black : .gray)
            Image(systemName: "cross.fill")
                .font(.system(size: 30))
                .rotationEffect(Angle(degrees: 45))
                .foregroundColor(mistakes >= 2 ? .black : .gray)
            Image(systemName: "cross.fill")
                .font(.system(size: 30))
                .rotationEffect(Angle(degrees: 45))
                .foregroundColor(mistakes >= 3 ? .black : .gray)
        }    }
}

//struct WordleMistakes_Previews: PreviewProvider {
//    static var previews: some View {
//        WordleMistakes().previewLayout(.sizeThatFits).padding()
//    }
//}

//t
