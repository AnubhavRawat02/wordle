//
//  AllRulesView.swift
//  wordle
//
//  Created by Anubhav Rawat on 04/09/22.
//

import SwiftUI

struct AllRulesView: View {
    @Binding var currentScreen: String
    var body: some View {
        ZStack {
            Color("RulesColor").ignoresSafeArea()
            TabView{
                RulesView(currentScreen: $currentScreen)
                WordFeverRulesView(currentScreen: $currentScreen)
            }.tabViewStyle(PageTabViewStyle())
        }
    }
//    comment
}

//main branch comment

//struct AllRulesView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllRulesView()
//    }
//}
