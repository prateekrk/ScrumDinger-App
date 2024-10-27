//
//  History.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 25/10/24.
//

import Foundation
struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    var attendees: [Attendee]
    var transcripts: String?

    init(id: UUID = UUID(), date: Date = .now, attendees: [Attendee], transcripts: String?) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.transcripts = transcripts
    }
}
