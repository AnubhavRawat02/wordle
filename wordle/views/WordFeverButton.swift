//custom word fever button

import SwiftUI

struct WordFeverButton: View {
    var buttonText: String
    var body: some View {
        ZStack{
            Capsule().fill(.blue).frame(width: 200, height: 60)
            Capsule().stroke(.orange, lineWidth: 4).frame(width: 200, height: 60)
            HStack{
                Text(buttonText).font(.title)
                Image(systemName: "arrow.2.squarepath").imageScale(.large)
            }.foregroundColor(.black)
        }
    }
}

//struct WordFeverButton_Previews: PreviewProvider {
//    static var previews: some View {
//        WordFeverButton()
//    }
//}
//m
