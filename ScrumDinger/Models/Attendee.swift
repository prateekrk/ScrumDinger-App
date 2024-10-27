//
//  Attendees.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import Foundation
struct Attendee: Identifiable, Codable {
    let id: UUID
    let name: String

    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}
