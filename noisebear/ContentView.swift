//
//  ContentView.swift
//  noisebear
//
//  Created by Christoph Huschenhöfer on 07.08.25.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var showingSettings = false
    @State private var darkModeAktiv = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("Willkommen zur App")
                        .padding()
                }
                // Toolbar gehört an den Hauptinhalt, nicht außen
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }) {
                            Image(systemName: "line.horizontal.3")
                                .imageScale(.large)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingSettings = true
                        }) {
                            Image(systemName: "gearshape")
                                .imageScale(.large)
                        }
                    }
                }
                //.navigationTitle("Startseite")
                
                if showMenu {
                    HStack(spacing: 0) {
                        // Platzhalter: gleiche Breite wie Menü, aber transparent
                        Color.clear
                            .frame(width: 250)
                        
                        // Abdunkelung NUR rechts vom Menü
                        Color.black.opacity(0.3)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    showMenu = false
                                }
                            }
                    }
                    .ignoresSafeArea()
                    .zIndex(2)
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

struct SideMenuView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Menü")
                .font(.largeTitle)
                .bold()
            Divider()
            NavigationLink(destination: Text("Startseite")) {
                Label("Startseite", systemImage: "house")
            }
            NavigationLink(destination: Text("Einstellungen")) {
                Label("Einstellungen", systemImage: "gear")
            }
            NavigationLink(destination: Text("Hilfe")) {
                Label("Hilfe", systemImage: "questionmark.circle")
            }
            Spacer()
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color.white)
        .ignoresSafeArea(edges: .vertical)
    }
}


#Preview {
    ContentView()
}
