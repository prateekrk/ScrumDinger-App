//
//  ScrumDatastore.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 25/10/24.
//

import SwiftUI

@MainActor
class ScrumDatastore: ObservableObject {
    @Published var scrums: [DailyScrum] = []

    private func getFile() throws -> URL {
        return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathExtension("scrums.data")
    }

    public func loadData() async throws {
        let task = Task<[DailyScrum],Error> {
            let fileUrl = try getFile()
            guard let data = try? Data(contentsOf: fileUrl) else {
                return []
            }
            return try JSONDecoder().decode([DailyScrum].self, from: data)
        }
        let scrums = try await task.value
        self.scrums = scrums
    }

    public func saveData() async throws {
        let task = Task<Bool, Error> {
            let data = try JSONEncoder().encode(scrums)
            let fileUrl = try getFile()
            try data.write(to: fileUrl)
            return true
        }
        _ = try await task.value
    }
}
