//
//  QRView.swift
//  ContactCard
//
//  Created by Arnau Martín on 8/3/22.
//

import SwiftUI

let qrg = QRGenerator()

struct QRView: View {
    @ObservedObject var vCard = vCardDataLoader()
    @Binding var isPresented: Bool
    
    let img = qrg.GenerateQR()
    var body: some View {
        NavigationView {
            VStack {
                Image(uiImage: img)
                    .resizable()
                    .interpolation(.none)
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 300)
                Text("Scan this QR code with your camera and my contact will be added to your phonebook.")
                    .multilineTextAlignment(.center)
                    .padding(20)
            }
            .navigationTitle("Contact Card QR")
            .toolbar {
                ToolbarItemGroup(placement: .automatic) {
                    Button("Close") {
                        isPresented.toggle()
                    }
                }
            }
        }
    }
}
