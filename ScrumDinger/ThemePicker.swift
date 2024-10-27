//
//  ThemePicker.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 18/09/24.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { each in
                ThemeView(theme: each).tag(each)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePicker(selection: .constant(.buttercup))
}
