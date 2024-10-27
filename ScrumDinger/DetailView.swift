//
//  DetailView.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var isPresentingEditView = false
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink {
                    MeetingView(scrum: $scrum)
                } label: {
                    Label("Start meeting", systemImage: "timer").font(.headline).foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.rawValue.capitalized)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section (header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
            Section( header: Text("History")) {
                if scrum.history.isEmpty {
                    Label("No Meetings Yet", systemImage: "calendar")
                } else {
                    ForEach(scrum.history) { history in
                        HStack {
                            NavigationLink {
                               HistoryView(history: history)
                            } label: {
                                Image("calendar")
                                Text(history.date, style: .date)
                            }
                        }
                    }
                }
            }
        }
        .toolbar(content: {
            Button(action: {
                isPresentingEditView = true
            }) {
                Text("Edit")
            }
        })
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack {
                DetailEditView(scrum: $scrum)
                    .navigationTitle(scrum.title)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                            }
                        }
                    })
            }
        })
        .navigationTitle(scrum.title)
    }
}

#Preview {
    DetailView(scrum: .constant(DailyScrum.sampleData[0]))
}
