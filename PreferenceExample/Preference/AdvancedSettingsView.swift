//
//  AdvancedSettingsView.swift
//  PreferenceExample
//
//  Created by MacBook Pro M1 on 2021/10/08.
//

import SwiftUI
import Preferences

struct AdvancedSettingsView: View {
    @AppStorage("isShowDevelop") var isShowDevelop = false
    @AppStorage("isSmallestFontSize") var isSmallestFontSize = false
    @AppStorage("smallestFontSizeSelection") var smallestFontSizeSelection = 0
    @AppStorage("isHighlightTab") var isHighlightTab = false
    
    private let contentWidth: Double = 450
    
    var body: some View {
        Preferences.Container(contentWidth: contentWidth) {
            
            Preferences.Section(title: "Accessibility:") {
                Preferences.Section {
                    Toggle(isOn: $isSmallestFontSize) {
                        Text("Never use font sizes smaller than")
                    }
                } content: {
                    VStack {
                    Picker("", selection: $smallestFontSizeSelection) {
                        Text("9").tag(0)
                        Text("10").tag(1)
                        Text("11").tag(2)
                        Text("12").tag(3)
                        Text("14").tag(4)
                        Text("18").tag(5)
                        Text("24").tag(6)
                    }
                    .labelsHidden()
                    .frame(width: 40)
                        
                        
                    }
                }.padding(.vertical, 5)
                
                Preferences.Section {
                    Toggle(isOn: $isHighlightTab) {
                        Text("Press Tab to highlight each item on a webpage")
                    }
                } content: {
                    EmptyView()
                }
            }
            
            Preferences.Section(title: "") {
                Preferences.Section {
                    Toggle(isOn: $isShowDevelop) {
                        Text("Show Develop menu in menu bar")
                    }
                } content: {
                    EmptyView()
                }
            }
        }
    }
}

struct AdvancedSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedSettingsView()
    }
}
