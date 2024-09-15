//
//  TrailingIconLabelStyle.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 15/09/24.
//

import Foundation
import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingLabelStyle: Self{Self()}
}
