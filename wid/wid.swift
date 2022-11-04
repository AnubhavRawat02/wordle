//
//  wid.swift
//  wid
//
//  Created by Anubhav Rawat on 12/09/22.
//

import WidgetKit
import SwiftUI


//MARK: - Provider
struct Provider: TimelineProvider {
//    placeholder
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

//    single snapshot
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    
//    time line of snapshots
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}


//MARK: - widget view
struct widEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry

    var body: some View {
        VStack {
            switch widgetFamily{
            case .systemSmall:
                MediumView(entry: entry)
            case .systemMedium:
                LargeView(entry: entry)
            default:
                Text("never happening")
            }
        }
    }
}


//MARK: - main struct
@main
struct wid: Widget {
    let kind: String = "wid"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            widEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

//MARK: - preview struct

struct wid_Previews: PreviewProvider {
    static var previews: some View {
        widEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
