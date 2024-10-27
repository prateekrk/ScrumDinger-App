//
//  ScrumProgressViewStyle.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 20/10/24.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    let theme: Theme
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height: 20.0)
            ProgressView(configuration)
                .tint(theme.mainColor)
                .frame(height: 12.0)
                .padding(.horizontal)
        }
    }
}
