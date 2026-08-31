//
//  Spatial_WorkstationApp.swift
//
//  Created by Chinmaya Martha on 27/08/26.
//

import SwiftUI

@main
struct Spatial_WorkstationApp: App {
    var body: some Scene {
        // Main Launchpad Hub Window
        WindowGroup(id: "hub") {
            ContentView(space: "hub")
        }
        .windowStyle(.automatic)
        .defaultSize(width: 1280, height: 820)
        .windowResizability(.contentMinSize)

        // Floating Window #1: Spatial Workstation Desk
        WindowGroup(id: "workstation") {
            ContentView(space: "workstation")
        }
        .windowStyle(.automatic)
        .defaultSize(width: 1380, height: 880)
        .windowResizability(.contentMinSize)

        // Floating Window #2: 3D Open Outcry Trading Pit
        WindowGroup(id: "pit") {
            ContentView(space: "pit")
        }
        .windowStyle(.automatic)
        .defaultSize(width: 1240, height: 840)
        .windowResizability(.contentMinSize)

        // Floating Window #3: Macro Shockwave Matrix
        WindowGroup(id: "shockwave") {
            ContentView(space: "shockwave")
        }
        .windowStyle(.automatic)
        .defaultSize(width: 1280, height: 860)
        .windowResizability(.contentMinSize)
    }
}
