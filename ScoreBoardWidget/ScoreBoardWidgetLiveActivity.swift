//
//  ScoreBoardWidgetLiveActivity.swift
//  ScoreBoardWidget
//
//  Created by Tu Nguyen on 22/6/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ScoreBoardWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ScoreBoardWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ScoreBoardWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension ScoreBoardWidgetAttributes {
    fileprivate static var preview: ScoreBoardWidgetAttributes {
        ScoreBoardWidgetAttributes(name: "World")
    }
}

extension ScoreBoardWidgetAttributes.ContentState {
    fileprivate static var smiley: ScoreBoardWidgetAttributes.ContentState {
        ScoreBoardWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: ScoreBoardWidgetAttributes.ContentState {
         ScoreBoardWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: ScoreBoardWidgetAttributes.preview) {
   ScoreBoardWidgetLiveActivity()
} contentStates: {
    ScoreBoardWidgetAttributes.ContentState.smiley
    ScoreBoardWidgetAttributes.ContentState.starEyes
}
