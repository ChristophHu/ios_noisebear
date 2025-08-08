//
//  SettingsView.swift
//  noisebear
//
//  Created by Christoph Huschenhöfer on 07.08.25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var darkModeAktiv: Bool

    var body: some View {
        NavigationView {
            NavigationStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Diese App wurde mit SwiftUI entwickelt und dient als Eingangsprojekt in die Entwicklung mit SwiftUi.")
                    // Form {
                        Toggle("Dark Mode aktivieren", isOn: $darkModeAktiv)
                    //}
                    Text("Version 1.0.0")
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding()
                .navigationTitle("Settings")
                .preferredColorScheme(darkModeAktiv ? .dark : .light)
            }
        }
    }
}
