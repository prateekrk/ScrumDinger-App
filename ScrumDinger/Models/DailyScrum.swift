//
//  DailyScrum.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import Foundation
struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [Attendee]
    var lengthInMinutes: Int
    var theme: Theme
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }

        set {
            lengthInMinutes = Int(newValue)
        }
    }

    var history: [History] = []
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}
extension DailyScrum {
    static var sampleData: [DailyScrum] = [
        DailyScrum(title: "Design",
                   attendees: ["Cathy", "Daisy", "Simon", "Jonathan"],
                   lengthInMinutes: 10,
                   theme: .yellow),
        DailyScrum(title: "App Dev",
                   attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"],
                   lengthInMinutes: 5,
                   theme: .orange),
        DailyScrum(title: "Web Dev",
                   attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"],
                   lengthInMinutes: 5,
                   theme: .poppy)
    ]

    static let emptyScrum: DailyScrum = {
        DailyScrum(title: "", attendees: [String](), lengthInMinutes: 0, theme: .purple)
    }()
}
