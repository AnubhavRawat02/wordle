//
//  LargeView.swift
//  widExtension
//
//  Created by Anubhav Rawat on 12/09/22.
//

import SwiftUI
import WidgetKit

struct LargeView: View {
    var entry: SimpleEntry
    var body: some View {
        ZStack{
            Color("skyBlue")
            VStack(alignment: .center){
                Text("Highest Wordle Score: 3").font(.system(size: 25))
                Text("Highest word fever score: 36").font(.system(size: 25))
            }
        }
        .widgetURL(URL(string: "myapp://stats/1"))
    }
}
