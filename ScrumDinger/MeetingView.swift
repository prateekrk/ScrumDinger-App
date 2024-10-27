//
//  ContentView.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import SwiftUI
import CoreData
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer: ScrumTimer = ScrumTimer()
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State var isRecording = false
    var history: History?
    private var avPlayer: AVPlayer {
        AVPlayer.sharedDingPlayer
    }
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0).fill(scrum.theme.mainColor)
            VStack {
                MeetingViewHeader(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                MeetingTimerView(speakers: scrumTimer.speakers, theme: scrum.theme, isRecording: isRecording)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }.padding()
        }
        .onAppear(perform: {
            
        })
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            startScrum()
        })
        .onDisappear(perform: {
            endScrum()
        })
    }

    private func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction = {
            avPlayer.seek(to: .zero)
            avPlayer.play()
        }
        isRecording = true
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        scrumTimer.startScrum()
    }

    private func endScrum() {
        speechRecognizer.stopTranscribing()
        scrumTimer.stopScrum()
        isRecording = false
        let newHistory = History(date: .now, attendees: scrum.attendees, transcripts: speechRecognizer.transcript)
        scrum.history.insert(newHistory, at: 0)
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
