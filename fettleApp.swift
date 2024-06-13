//
//  fettleApp.swift
//  market
//
//  Created by Nicholas Nelson on 11/23/23.
//

import SwiftUI

@main
struct fettleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(MainViewModel())
        }
    }
}
