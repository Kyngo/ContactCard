//
//  QRView.swift
//  ContactCard
//
//  Created by Arnau Martín on 8/3/22.
//

import SwiftUI

let qrg = QRGenerator()

struct QRView: View {
    let img = qrg.GenerateQR()
    var body: some View {
        VStack {
            Image(uiImage: img)
                .resizable()
                .interpolation(.none)
                .scaledToFit()
                .frame(width: 200, height: 200)
        }
    }
}
