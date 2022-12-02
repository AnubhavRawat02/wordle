//wordle game view grid row


import SwiftUI

struct GridRow: View {
    @Binding var word:[String]
    
    @Binding var colors : [Color]
    
    @Binding var isFlipped: Int
    
    var body: some View {
        HStack(spacing: 20){
            ForEach(0..<5){index in
                LetterView(letter: $word[index], flipTime: 0.3*Double(index), color: $colors[index], isFlipped: $isFlipped)
            }
        }
    }
}

//struct GridRow_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        @State var somestate = ["a", "a", "a", "a", "a"]
//        GridRow(word: $somestate).previewLayout(.sizeThatFits)
//    }
//}

//t
//m
