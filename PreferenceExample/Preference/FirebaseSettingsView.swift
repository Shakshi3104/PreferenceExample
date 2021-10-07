//
//  FirebaseSettingsView.swift
//  PreferenceExample
//
//  Created by MacBook Pro M1 on 2021/10/07.
//

import SwiftUI
import Preferences

struct FirebaseSettingsView: View {
    @State private var collectionName = ""
    private let defaultCollectionName = "latency_v3"
    
    private let contentWidth = 350.0
    
    var body: some View {
        Preferences.Container(contentWidth: contentWidth) {
            Preferences.Section(title: "Collection name:") {
                Preferences.Section(title: "") {
                    TextField(defaultCollectionName, text: $collectionName)
                }
            }
        }
    }
}

struct FirebaseSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseSettingsView()
    }
}
