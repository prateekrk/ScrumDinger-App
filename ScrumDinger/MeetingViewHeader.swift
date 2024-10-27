//
//  MeetingViewHeader.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 20/10/24.
//

import SwiftUI

struct MeetingViewHeader: View {
    var secondsElapsed: Int
    var secondsRemaining: Int
    var totalTime: Int {
        secondsElapsed + secondsRemaining
    }
    var minutesRemaining: Int {
        secondsRemaining / 60
    }
    var progress: Double {
        guard secondsRemaining > 0 else {
            return 1
        }
        return Double(secondsElapsed) / Double(totalTime)
    }
    
    var theme: Theme
    
    var body: some View {
        VStack {
            ProgressView(value: progress).progressViewStyle(ScrumProgressViewStyle(theme: theme))
            HStack() {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Reamining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill").labelStyle(.trailingLabelStyle)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time Reamining")
        .accessibilityValue("\(minutesRemaining) Minutes")
        .padding([.top, .horizontal])
    }
}

#Preview {
    MeetingViewHeader(secondsElapsed: 10, secondsRemaining: 100, theme: .bubblegum)
}
