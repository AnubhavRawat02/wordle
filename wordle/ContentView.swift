//
//  ContentView.swift
//  wordle
//
//  Created by Anubhav Rawat on 25/08/22.
//

import SwiftUI

struct ContentView: View{
    
    @State var wordleObj = WordleClass()
    
    @StateObject var wordFeverObj: WordFeverClass = WordFeverClass()
    
    @State var currentScreen: String = Constants.pickModes
//    @AppStorage("screen") var currentScreen = "rules"
    @Environment(\.scenePhase) private var scenePhase
    var body: some View{
//        WordMatrixScreen(currentScreen: $currentScreen)
        VStack{
            if currentScreen == Constants.pickModes{
                PickModesView(currentScreen: $currentScreen)
    //            PickModesView()
            }else if currentScreen == Constants.wordle{
                WordleGameView(currentScreen: $currentScreen, wordleObj: wordleObj)
            }else if currentScreen == Constants.wordleScore{
                ScoreView(currentScreen: $currentScreen, wordleObj: wordleObj)
            }else if currentScreen == Constants.wordFever{
                WordleFever(wordFeverObject: wordFeverObj, currentScreen: $currentScreen)
            }else if currentScreen == Constants.wordFeverResult{
                WordleFeverResultView(wordfeverobj: wordFeverObj, currentScreen: $currentScreen)
            }else if currentScreen == Constants.allrules{
                AllRulesView(currentScreen: $currentScreen)
            }else if currentScreen == Constants.wordMatrix{
                WordMatrixScreen(currentScreen: $currentScreen)
            }
            else {
                StatsView(currentScreen: $currentScreen)
            }
        }
        .onOpenURL { url in
            guard url.scheme == "myapp", url.host == "stats",
                  let id = Int(url.pathComponents[1])
            else{
                print("error")
                return
            }
            print(id)
            currentScreen = Constants.stats
        }
//        .widgetURL(URL(string: "myapp://stats/1"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        RulesView()
    }
}
//m
