//
//  ScrumDingerApp.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import SwiftUI

@main
struct ScrumDingerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ScrumView(scrums: DailyScrum.sampleData)
        }
    }
}
