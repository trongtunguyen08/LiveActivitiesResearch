//
//  ContentView.swift
//  LiveActivitiesResearch
//
//  Created by Tu Nguyen on 22/6/24.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var homeTeam: Team = .init(name: "Barcelona", image: "barcelona", score: 0)
    @State private var awayTeam: Team = .init(name: "Real Marid", image: "real-madrid", score: 0)
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    teamView(for: $homeTeam)
                    
                    Spacer()
                    
                    Text("VS")
                    
                    Spacer()
                    
                    teamView(for: $awayTeam)
                }
                
                Button("Start Activity") {
                    startActivity()
                }
                
                Button("Stop Activity") {
                    stopActivity()
                }
            }
            .navigationTitle("Score Tracker")
        }
    }
    
    private func teamView(for team: Binding<Team>) -> some View {
        VStack {
            Image(team.wrappedValue.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            Text(team.wrappedValue.name)
            Text("\(team.wrappedValue.score)")
            
            Button(action: {}, label: {
                Label("Score", systemImage: "soccerball")
            })
        }
    }

    private func startActivity() {
        let matchAttributes = MatchAttributes(title: "LaLiga", leagueImage: "la-liga")
        let match: Match = .init(homeTeam: homeTeam, awayTeam: awayTeam, leagueName: "LaLigo")
        let initialState = MatchAttributes.ContentState(match: match)
        let content = ActivityContent(state: initialState, staleDate: nil)
        
        do {
            _ = try Activity<MatchAttributes>.request(attributes: matchAttributes, content: content, pushType: nil)
            print("Success!")
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    private func stopActivity() {
        guard let activty = Activity<MatchAttributes>.activities.last else { return }
        Task {
            await activty.end(activty.content, dismissalPolicy: .immediate)
        }
    }

}


#Preview {
    ContentView()
}
