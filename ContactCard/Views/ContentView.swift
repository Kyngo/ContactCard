//
//  ContentView.swift
//  ContactCard
//
//  Created by Arnau Martín on 2/3/22.
//

import SwiftUI
import Network

struct ContentView: View {
    @ObservedObject var links = AppDataLoader()
    
    @State private var renderQR = false
    
    func openURL(url: String) {
        let navUrl = URL(string: url)!
        if (UIApplication.shared.canOpenURL(navUrl)) {
            UIApplication.shared.open(navUrl)
        }
    }
    
    func renderButton(link: String, name: String)-> Button<Text> {
        return Button(name) {
            openURL(url: link)
        }
    }
    
    func renderList()->some View {
        return ForEach(links.Content) { section in
            Section(header: Text(section.description)) {
                ForEach(section.content) { item in
                    renderButton(link: item.url, name: item.name)
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                renderList()
            }
            .navigationTitle("Arnau Martín")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("QR vCard") {
                        renderQR.toggle()
                    }
                    .sheet(isPresented: $renderQR) {
                        QRView(isPresented: $renderQR)
                    }
                    Button("Exit") {
                        exit(0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
