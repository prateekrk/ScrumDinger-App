//
//  ContentView.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import SwiftUI
import CoreData

struct MeetingView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        VStack {
            Image(systemName: "globe").imageScale(.large).foregroundColor(.accentColor)
            ProgressView(value: 50, total: 100)
            HStack() {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Reamining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.bottomhalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time Reamining")
            .accessibilityValue("10 Minutes")
            Circle().strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next Speaker")
            }
        }
        .padding()
    }
}

#Preview {
    MeetingView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
