//
//  Match.swift
//  LiveActivitiesResearch
//
//  Created by Tu Nguyen on 22/6/24.
//

import Foundation
import ActivityKit

struct Team: Codable, Hashable {
    var name: String
    var image: String
    var score: Int
}

struct Match: Codable, Hashable {
    var homeTeam: Team
    var awayTeam: Team
    var leagueName: String
}

struct MatchAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var match: Match
    }
    
    var title: String
    var leagueImage: String
}
