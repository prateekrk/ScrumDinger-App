//
//  ErrorWrapper.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 26/10/24.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let errorGuidance: String
}
