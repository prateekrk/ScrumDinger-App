//
//  ErrorView.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 26/10/24.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment (\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Text("An Error Has Occurred")
                    .font(.title)
                    .padding(.top)
                Text("\(errorWrapper.error.localizedDescription)")
                    .font(.headline)
                Text(errorWrapper.errorGuidance).font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(16.0)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    enum SampleError: Error {
        case errorRequired
    }
    var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired,
                     errorGuidance: "You can safely ignore this error.")
    }
    return ErrorView(errorWrapper: wrapper)
}
