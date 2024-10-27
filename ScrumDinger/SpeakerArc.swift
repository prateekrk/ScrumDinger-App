//
//  SepakerArc.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 27/10/24.
//

import SwiftUI

struct SpeakerArc: Shape {
    
    let currentSpeakerIndex: Int
    let numberOfSpeakers: Int

    private var degreesPerSpeaker: Double {
        360/Double(numberOfSpeakers)
    }

    private var startAngle: Angle {
        return Angle(degrees: (degreesPerSpeaker*Double(currentSpeakerIndex))+1)
    }

    private var endAngle: Angle {
        return Angle(degrees: (startAngle.degrees + degreesPerSpeaker )-1)
    }

    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24
        let radius = diameter/2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path({ path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        })
    }
}
