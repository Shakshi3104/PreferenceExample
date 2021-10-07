//
//  PreferenceExampleApp.swift
//  PreferenceExample
//
//  Created by MacBook Pro M1 on 2021/10/07.
//

import SwiftUI
import Preferences

@main
struct PreferenceExampleApp: App {
    
    let GeneralPreferenceViewController: () -> PreferencePane = {
        let paneView = Preferences.Pane(
            identifier: .general,
            title: "General",
            toolbarIcon: NSImage(systemSymbolName: "gearshape",
                                 accessibilityDescription: "General preferences")!
        ) {
            GeneralSettingsView()
        }
        
        return Preferences.PaneHostingController(pane: paneView)
    }
    
    let FirebasePreferenceViewController: () -> PreferencePane = {
        let paneView = Preferences.Pane(
            identifier: .advanced,
            title: "Firebase",
            toolbarIcon: NSImage(systemSymbolName: "externaldrive.connected.to.line.below",
                                 accessibilityDescription: "Firebase management")!
        ) {
            FirebaseSettingsView()
        }
        
        return Preferences.PaneHostingController(pane: paneView)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands {
            CommandGroup(replacing: .appSettings) {
                Button("Preferences...") {
                    PreferencesWindowController(
                        preferencePanes: [
                            GeneralPreferenceViewController(),
                            FirebasePreferenceViewController()
                        ],
                        style: .toolbarItems
                    ).show()
                }.keyboardShortcut(KeyEquivalent(","), modifiers: .command)
            }
        }
    }
}

// References: https://dariogzlez.medium.com/creating-a-preferences-window-for-a-swiftui-macos-app-52b684a2bdf
