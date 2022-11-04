//
//  PickModesView.swift
//  wordle
//
//  Created by Anubhav Rawat on 03/09/22.
//

import SwiftUI

struct PickModesView: View {
    
    @Binding var currentScreen: String
//    @State var currentScreen:String = Constants.pickModes
    @State var isAnimating:Bool = false;
    var letters: [String] = ["A", "B", "C", "D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    func randomOffsety() -> CGFloat{
        return CGFloat.random(in: 250...350)
    }
    
    func randomOffsetx() -> CGFloat{
        return CGFloat.random(in: -120...120)
    }
    
    func randomOffsetxb() -> CGFloat{
        return CGFloat.random(in: -170...170)
    }
    
    func randomOffsetyb() -> CGFloat{
        return CGFloat.random(in: -380...380)
    }
    
    func randomSize() -> CGFloat{
        return CGFloat.random(in: 20...90)
    }
    
    func randomAngle() -> CGFloat{
        return CGFloat.random(in: 10...340)
    }
    
    var body: some View {
        ZStack {
            
            Color("skyBlue")
            ForEach(0...30, id: \.self){item in
                Text(letters.randomElement()!)
                    .offset(x: randomOffsetxb(), y: randomOffsetyb())
                    .font(.custom("Combo-Regular", size: randomSize()))
                    .foregroundColor(Color.white)
                    .opacity(0.4)
//                    .rotationEffect(.degrees(randomAngle()), anchor: q)
            }
            
            
            Text("W").font(.largeTitle).fontWeight(.heavy).offset(x: isAnimating ? -100 : randomOffsetx(), y: isAnimating ? -270 : -randomOffsety())
            Text("O").font(.largeTitle).fontWeight(.heavy).offset(x: isAnimating ? -60 : randomOffsetx(), y: isAnimating ? -270 : -randomOffsety())
            Text("R").font(.largeTitle).fontWeight(.heavy).offset(x: isAnimating ? -20 : randomOffsetx(), y: isAnimating ? -270 : -randomOffsety())
            Text("D").font(.largeTitle).fontWeight(.heavy).offset(x: isAnimating ? 20 : randomOffsetx(), y: isAnimating ? -270 : -randomOffsety())
            Text("L").font(.largeTitle).fontWeight(.heavy).offset(x: isAnimating ? 60 : randomOffsetx(), y: isAnimating ? -270 : -randomOffsety())
            Text("E").font(.largeTitle).fontWeight(.heavy).offset(x: isAnimating ? 100 : randomOffsetx(), y: isAnimating ? -270 : -randomOffsety())
            
            
            VStack(spacing: 40){
                Spacer(minLength: 30)
    //            Text("Wordle")
                
                VStack(alignment: .center, spacing: 5){
                    Button {
//                        go to wordle
                        currentScreen = Constants.wordle
                    } label: {
                        CustomButton(buttontext: "Wordle")
                    }
                    Button {
//                        word fever
                        currentScreen = Constants.wordFever
                    } label: {
                        CustomButton(buttontext: "word Fever")
                    }
                    Button {
                        currentScreen = Constants.wordMatrix
                    } label: {
                        CustomButton(buttontext: "word matrix")
                    }

                }
                
                VStack(spacing: 10) {
                    Button {
                        currentScreen = Constants.stats
                    } label: {
                        CustomButton(buttontext: "Stats")
                    }
                    Button {
                        currentScreen = Constants.allrules
                    } label: {
                        CustomButton(buttontext: "Show Rules")
                    }
                }
                
                
                Spacer(minLength: 220)
            }
        }
        .ignoresSafeArea(.all)
        .background(
            Color.orange
        )
        .onAppear {
            withAnimation(.easeIn(duration: 2)) {
                isAnimating = true
            }
        }
    }
}

//struct PickModesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PickModesView()
//    }
//}
