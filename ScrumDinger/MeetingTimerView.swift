//
//  MeetingTimerView.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 27/10/24.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    let isRecording: Bool
    private var currentSpeaker: String {
        return speakers.first { speaker in
            speaker.isCompleted == false
        }?.name ?? "Unknown"
    }
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is Speaking")
                        .padding(.bottom)
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                }
            }
            .accessibilityElement(children: .combine)
            .foregroundColor(theme.accentColor)
            .overlay {
                ForEach(speakers) { each in
                    if each.isCompleted, let index = getFirstIndex(speaker: each) {
                        SpeakerArc(currentSpeakerIndex: index, numberOfSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
            }
            .padding(.horizontal)
    }
    private func getFirstIndex(speaker: ScrumTimer.Speaker) -> Int? {
        return speakers.firstIndex { each in
            return speaker.id == each.id
        }
    }
}

#Preview {
    MeetingTimerView(speakers: [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: true), ScrumTimer.Speaker(name: "Prateek", isCompleted: true)], theme: .yellow, isRecording: true)
}
