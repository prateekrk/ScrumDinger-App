//
//  CardView.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import SwiftUI

struct CardView: View {
    let dailyScrum: DailyScrum
    var body: some View {
        VStack(alignment: .leading) {
            Text(dailyScrum.title)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Label("\(dailyScrum.attendees.count)", systemImage: "person.3")
                    .labelStyle(.trailingLabelStyle)
                    .accessibilityLabel("\(dailyScrum.attendees.count) attendees")
                Spacer()
                Label("\(dailyScrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingLabelStyle)
                    .accessibilityLabel("\(dailyScrum.lengthInMinutes) remaining")
            }
            .font(.caption)
        }
        .foregroundColor(dailyScrum.theme.accentColor)
        .font(.headline)
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static let data = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(dailyScrum: data)
            .background(data.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
