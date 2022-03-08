//
//  NFC.swift
//  ContactCard
//
//  Created by Arnau Martín on 2/3/22.
//

import Foundation
import UIKit
import CoreNFC
import os

class NFCvCard: UITableViewController, UINavigationControllerDelegate {
    func checkReadability()->Bool {
        if NFCReaderSession.readingAvailable == false {
            let alertController = UIAlertController(
                title: "Scanning Not Supported",
                message: "This device doesn't support tag scanning.",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return false
        } else {
            let alertController = UIAlertController(
                title: "Scanning IS Supported",
                message: "This device supports tag scanning!",
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            return true
        }
    }
}
