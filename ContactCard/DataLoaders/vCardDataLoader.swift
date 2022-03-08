//
//  vCardDataLoader.swift
//  ContactCard
//
//  Created by Arnau Martín on 8/3/22.
//

import Foundation

class vCardDataLoader: ObservableObject {
    @Published var Content: ContactData? = nil
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let fileUrl = Bundle.main.url(forResource: "contact.json", withExtension: nil)
        else {
            print("File not found :/")
            return
        }
        
        let data = try? Data(contentsOf: fileUrl)
        
        if let contactDetails = try? JSONDecoder().decode(ContactData.self, from: data!) {
            self.Content = contactDetails
        }
    }
}
