//
//  GeneralSettingsView.swift
//  PreferenceExample
//
//  Created by MacBook Pro M1 on 2021/10/07.
//

import SwiftUI
import Preferences

struct GeneralSettingsView: View {
    
    @AppStorage("appIconSelection") var appIconSelection = 0
    @AppStorage("appearanceSelection") var appearanceSelection = 0
    @AppStorage("noteSize") var noteSize = 0.0
    @AppStorage("showFirstNameSelection") var showFirstNameSelection = 0
    private let contentWidth: Double = 450
    
    var body: some View {
        Preferences.Container(contentWidth: contentWidth) {
            Preferences.Section(title: "App icon:") {
                Preferences.Section(title: "") {
                    Picker("", selection: $appIconSelection) {
                        Text("Default").tag(0)
                    }
                    .labelsHidden()
                    .frame(width: 120)
                }
            }
            
            Preferences.Section(title: "Appearance:") {
                Preferences.Section(title: "") {
                    Picker("", selection: $appearanceSelection) {
                        Text("System").tag(0)
                        Divider()
                        Text("Light").tag(1)
                        Text("Dark").tag(2)
                    }
                    .labelsHidden()
                    .frame(width: 120)
                }
            }
            
            Preferences.Section(title: "Note size:") {
                Preferences.Section(title: "") {
                    Slider(value: $noteSize, in: 0...5, step: 1)
                        .frame(width: 320)
                }
            }
            
            Preferences.Section(title: "Show First Name:") {
                Preferences.Section(title: "") {
                    Picker("", selection: $showFirstNameSelection) {
                        Text("Before last name").tag(0)
                        Text("Following last name").tag(1)
                    }
                    .pickerStyle(RadioGroupPickerStyle())
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
