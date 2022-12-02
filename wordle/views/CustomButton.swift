//custom button for rules view

import SwiftUI

struct CustomButton: View {
    
    var buttontext:String
    var body: some View {
        HStack(spacing: 8) {
            Text(buttontext)
                .font(.largeTitle)
                .fontWeight(.bold)
            Image(systemName: "arrow.right.circle")
                .imageScale(.large)
        }.foregroundColor(.white)
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            ZStack{
                Capsule().fill(.black.opacity(0.4))
                Capsule().stroke(.black, lineWidth: 3)
            }
        )
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(buttontext: "start").previewLayout(.sizeThatFits)
    }
}
//m
