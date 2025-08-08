//
//  ContentView.swift
//  noisebear
//
//  Created by Christoph Huschenhöfer on 07.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSettings = false
    @State private var darkModeAktiv = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Willkommen zur App")
                    .navigationTitle("Startseite")
                NavigationLink("Gehe zu Detailansicht", destination: DetailView())
            }
            .navigationTitle("Startseite")
            .navigationBarTitleDisplayMode(.inline) // oder .large
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingSettings = true
                    }) {
                        Image(systemName: "gearshape")
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $showingSettings) {
                SettingsView(darkModeAktiv: $darkModeAktiv)
            }
            .preferredColorScheme(darkModeAktiv ? .dark : .light)
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Das ist die Detailansicht")
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    ContentView()
}
