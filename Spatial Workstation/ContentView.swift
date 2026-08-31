//
//  ContentView.swift
//  Spatial Workstation
//
//  Created by Chinmaya Martha on 27/08/26.
//

import SwiftUI

struct ContentView: View {
    var space: String = "hub"
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow
    @State private var isMaximized: Bool = false

    var body: some View {
        ZStack {
            Color.clear
            
            // Web view container loading index.html
            WebViewContainer(
                filename: "index",
                space: space,
                onOpenWindow: { targetSpace in
                    openWindow(id: targetSpace)
                },
                onCloseWindow: {
                    if space != "hub" {
                        dismissWindow()
                    }
                }
            )
            // Rounded clipping and bottom safe margin so visionOS window drag bar is unobstructed
            .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
            .padding(.horizontal, 12)
            .padding(.top, 8)
            .padding(.bottom, 22)
        }
        // Responsive frame that supports visionOS window resizing and maximization
        .frame(
            minWidth: 1080,
            idealWidth: isMaximized ? 1720 : 1380,
            maxWidth: .infinity,
            minHeight: 720,
            idealHeight: isMaximized ? 1000 : 860,
            maxHeight: .infinity
        )
        .glassBackgroundEffect()
        // Native visionOS Floating Top Control Ornament
        .ornament(attachmentAnchor: .scene(.top), contentAlignment: .center) {
            HStack(spacing: 12) {
                // Global Spatial Brand Logo Badge
                HStack(spacing: 8) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(LinearGradient(
                                colors: [Color.cyan, Color.blue, Color.indigo],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ))
                            .frame(width: 28, height: 28)
                            .shadow(color: .cyan.opacity(0.4), radius: 4)

                        Image(systemName: "cube.transparent.fill")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        Text("Global SPATIAL")
                            .font(.system(size: 11, weight: .heavy, design: .monospaced))
                            .foregroundColor(.white)
                        Text(spaceTitle)
                            .font(.system(size: 9, weight: .semibold, design: .default))
                            .foregroundColor(.cyan)
                    }
                }
                .padding(.trailing, 4)

                Divider()
                    .frame(height: 18)

                // Return to Main Hub Button
                if space != "hub" {
                    Button {
                        openWindow(id: "hub")
                    } label: {
                        Label("Spatial Hub", systemImage: "square.grid.2x2.fill")
                            .font(.system(size: 11, weight: .medium))
                    }
                    .buttonStyle(.bordered)
                    .tint(.cyan)
                    .help("Focus Spatial Launchpad Hub")
                }

                // Maximize / Compact Dimension Toggle
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        isMaximized.toggle()
                    }
                } label: {
                    Image(systemName: isMaximized ? "arrow.down.right.and.arrow.up.left" : "arrow.up.left.and.arrow.down.right")
                        .font(.system(size: 12, weight: .bold))
                }
                .buttonStyle(.bordered)
                .help(isMaximized ? "Compact View" : "Maximize Workspace")

                // Close / Dismiss Floating Window Button
                if space != "hub" {
                    Button(role: .destructive) {
                        dismissWindow()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.pink)
                    }
                    .buttonStyle(.bordered)
                    .help("Close this floating window")
                }
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 8)
            .glassBackgroundEffect()
        }
    }

    private var spaceTitle: String {
        switch space {
        case "workstation": return "WORKSTATION DESK"
        case "pit": return "3D OPEN OUTCRY PIT"
        case "shockwave": return "MACRO SHOCKWAVE"
        default: return "LAUNCHPAD HUB"
        }
    }
}
