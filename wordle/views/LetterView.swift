
// Flipping card
//used in wordle game view

import SwiftUI


//MARK: - back card
struct CardBack: View{
    let width:CGFloat
    let height:CGFloat
    @Binding var degree:Double
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 2)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)
            RoundedRectangle(cornerRadius: 2)
                .fill(.blue.opacity(0.2))
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
                
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}


//MARK: - front card
struct CardFront: View{
    let width:CGFloat
    let height:CGFloat
    var backgroundColor: Color
    @Binding var degree:Double

    var letter:String
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 2)
                .fill(backgroundColor.opacity(0.6))
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            Text(letter).font(.largeTitle)
//            Image(systemName: "suit.club.fill")
//                .resizable()
//                .frame(width: 80, height: 80)
//                .foregroundColor(.red)
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

//MARK: - letterview
struct LetterView: View {
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    
    @Binding var letter:String
    var flipTime:Double
    @Binding var color:Color
    @Binding var isFlipped: Int
    
    let width: CGFloat = 40
    let height: CGFloat = 40
    
    //MARK: - flip function
    
    func flip(){
        withAnimation(.linear(duration: 0.15)) {
            backDegree = 90
            
        }
        withAnimation(.linear(duration: 0.15).delay(0.15)) {
            frontDegree = 0
        }
    }
    
    func reset(){
        withAnimation(.linear(duration: 0.15)){
            frontDegree = -90.0
        }
        withAnimation(.linear(duration: 0.15).delay(0.15)){
            backDegree = 0.0
        }
    }
    
    //MARK: - body
    var body: some View {
        ZStack{
            CardBack(width: width, height: height, degree: $backDegree)
            CardFront(width: width, height: height, backgroundColor: color, degree: $frontDegree, letter: letter)
        }
        .onChange(of: letter) { newValue in
            if(letter == "9"){
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + flipTime) {
                flip()
            }
        }.onChange(of: isFlipped) { newValue in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if isFlipped > 0{
                    reset()
                } 
            }
        }
    }
}

//struct LetterView_Previews: PreviewProvider {
//    static var previews: some View {
//        LetterView(letter: "A", flipTime: 1, flipornot: false).previewLayout(.sizeThatFits).padding()
//    }
//}


//t
