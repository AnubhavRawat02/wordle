//
//  MediumView.swift
//  widExtension
//
//  Created by Anubhav Rawat on 12/09/22.
//

import SwiftUI
import WidgetKit

struct MediumView: View {
    var entry: SimpleEntry
    var body: some View {
        ZStack{
            Color("skyBlue")
            VStack(alignment: .center){
                Text("Wordle: 3").font(.system(size: 20))
                Text("word fever: 34").font(.system(size: 20))
            }
        }
        .widgetURL(URL(string: "myapp://stats/1"))
    }
}

