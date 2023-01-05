//
//  CodingChallengeApp.swift
//  CodingChallenge
//
//  Created by Brady Miller on 4/7/21.
//

import SwiftUI

@main
struct CodingChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ShiftsView(viewModel: ShiftsViewModel(dataProvider: ShiftsDataProvider()))
        }
    }
}
