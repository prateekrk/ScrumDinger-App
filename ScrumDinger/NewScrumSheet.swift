//
//  NewScrumSheet.swift
//  ScrumDinger
//
//  Created by Prateek Kovalli on 20/10/24.
//

import SwiftUI

struct NewScrumSheet: View {
    @State var newScrum = DailyScrum.emptyScrum
    @Binding var isPresented: Bool
    @Binding var scrumList: [DailyScrum]
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem (placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresented = false
                        }
                    }
                    ToolbarItem( placement: .confirmationAction) {
                        Button("Add") {
                            scrumList.append(newScrum)
                            isPresented = false
                        }
                    }
                }
        }
    }
    
}

#Preview {
    NewScrumSheet(isPresented: .constant(false), scrumList: .constant(DailyScrum.sampleData))
}
