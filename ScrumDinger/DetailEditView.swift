//
//  DetailEditView.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 17/09/24.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var scrum: DailyScrum;
    @State var attendeeName = ""
    var body: some View {
        Form {
            List {
                Section(header: Text("Meeting Info")) {
                    TextField("Title", text: $scrum.title)
                    HStack {
                        Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                            Text("Length")
                        }
                        .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                        Spacer()
                        Text("\(scrum.lengthInMinutes) minutes")
                    }
                    ThemePicker(selection: $scrum.theme)
                }
                Section(header: Text("Attendees")) {
                    ForEach (scrum.attendees) { each in
                        Text(each.name)
                    } . onDelete(perform: { indexSet in
                        scrum.attendees.remove(atOffsets: indexSet)
                    })
                    HStack {
                        TextField("New Attendee", text: $attendeeName )
                        Button(action:{
                            withAnimation {
                                let attendee = Attendee(name: attendeeName)
                                scrum.attendees.append(attendee)
                                attendeeName = ""
                            }
                        })
                        {
                            Image(systemName: "plus.circle.fill")
                                .accessibilityLabel("Add attendee")
                        }.disabled(attendeeName.isEmpty)
                    }
                }
            }
        }
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
