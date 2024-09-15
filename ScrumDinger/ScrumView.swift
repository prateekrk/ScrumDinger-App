//
//  ScrumView.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import SwiftUI

struct ScrumView: View {
    let scrums: [DailyScrum]
    var body: some View {
        NavigationStack {
            List(scrums) { scrum in
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(dailyScrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

#Preview {
    ScrumView(scrums: DailyScrum.sampleData)
}
