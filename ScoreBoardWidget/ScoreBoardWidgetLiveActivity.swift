//
//  ScoreBoardWidgetLiveActivity.swift
//  ScoreBoardWidget
//
//  Created by Tu Nguyen on 22/6/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ScoreBoardWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: MatchAttributes.self) { context in
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("A")
            }
        }
    }
}

extension MatchAttributes {
    fileprivate static var preview: MatchAttributes {
        MatchAttributes(title: "LaLiga", leagueImage: "la-liga")
    }
}

#Preview("Content", as: .content, using: MatchAttributes.preview) {
   ScoreBoardWidgetLiveActivity()
} contentStates: {
    let homeTeam: Team = .init(name: "Barcelona", image: "barcelona", score: 0)
    let awayTeam: Team = .init(name: "Real Marid", image: "real-marid", score: 0)
    MatchAttributes.ContentState(match: .init(homeTeam: homeTeam, awayTeam: awayTeam, leagueName: "LaLiga"))
}

#Preview("Expended", as: .dynamicIsland(.expanded), using: MatchAttributes.preview) {
   ScoreBoardWidgetLiveActivity()
} contentStates: {
    let homeTeam: Team = .init(name: "Barcelona", image: "barcelona", score: 0)
    let awayTeam: Team = .init(name: "Real Marid", image: "real-marid", score: 0)
    MatchAttributes.ContentState(match: .init(homeTeam: homeTeam, awayTeam: awayTeam, leagueName: "LaLiga"))
}

#Preview("Compact", as: .dynamicIsland(.compact), using: MatchAttributes.preview) {
   ScoreBoardWidgetLiveActivity()
} contentStates: {
    let homeTeam: Team = .init(name: "Barcelona", image: "barcelona", score: 0)
    let awayTeam: Team = .init(name: "Real Marid", image: "real-marid", score: 0)
    MatchAttributes.ContentState(match: .init(homeTeam: homeTeam, awayTeam: awayTeam, leagueName: "LaLiga"))
}

#Preview("Minimal", as: .dynamicIsland(.minimal), using: MatchAttributes.preview) {
   ScoreBoardWidgetLiveActivity()
} contentStates: {
    let homeTeam: Team = .init(name: "Barcelona", image: "barcelona", score: 0)
    let awayTeam: Team = .init(name: "Real Marid", image: "real-marid", score: 0)
    MatchAttributes.ContentState(match: .init(homeTeam: homeTeam, awayTeam: awayTeam, leagueName: "LaLiga"))
}



