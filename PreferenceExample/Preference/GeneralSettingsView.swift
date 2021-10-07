//
//  GeneralSettingsView.swift
//  PreferenceExample
//
//  Created by MacBook Pro M1 on 2021/10/07.
//

import SwiftUI
import Preferences

struct GeneralSettingsView: View {
    
    @State private var appIconSelection = 0
    private let contentWidth = 350.0
    
    var body: some View {
        Preferences.Container(contentWidth: contentWidth) {
            Preferences.Section(title: "App icon:") {
                Preferences.Section(title: "") {
                    Picker("", selection: $appIconSelection) {
                        Text("Default").tag(0)
                    }
                }
            }
        }
    }
}

struct GeneralSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralSettingsView()
    }
}
