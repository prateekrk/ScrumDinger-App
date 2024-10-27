//
//  ScrumDingerApp.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import SwiftUI

@main
struct ScrumDingerApp: App {
    @StateObject private var scrumStore = ScrumDatastore()
    @State private var errorWrapper: ErrorWrapper?
    var body: some Scene {
        WindowGroup {
            ScrumView(scrums: $scrumStore.scrums, saveAction: {
                Task {
                    do {
                        try await scrumStore.saveData()
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    errorGuidance: "Try again later.")
                    }
                }
            })
            .task {
                do {
                   try await scrumStore.loadData()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                errorGuidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                scrumStore.scrums = DailyScrum.sampleData
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
