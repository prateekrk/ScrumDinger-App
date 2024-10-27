//
//  ScrumView.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import SwiftUI

struct ScrumView: View {
    @Binding var scrums: [DailyScrum]
    @State var isPresenting = false
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: () -> Void
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(dailyScrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresenting = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresenting) {
            NewScrumSheet(isPresented: $isPresenting, scrumList: $scrums)
        }.onChange(of: scenePhase) { oldValue, newValue in
            if newValue == .inactive {
                saveAction()
            }
        }
    }
}

#Preview {
    ScrumView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
