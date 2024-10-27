//
//  HistoryView.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 27/10/24.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    private var attendeeHistory: String {
        history.attendees.map {$0.name}.joined(separator: ",")
    }
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(attendeeHistory)
                if let transcript = history.transcripts {
                    Text("Transcript")
                        .padding(.top)
                        .font(.headline)
                    Text(transcript)
                }
                Spacer()
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

#Preview {
    var history: History {
            History(attendees: [
                Attendee(name: "Jon"),
                Attendee(name: "Darla"),
                Attendee(name: "Luis")
            ],
                transcripts: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
        }
    return HistoryView(history: history)
}
