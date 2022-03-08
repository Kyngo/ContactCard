//
//  DataLoader.swift
//  ContactCard
//
//  Created by Arnau Martín on 2/3/22.
//

import Foundation

class DataLoader: ObservableObject {
    @Published var Content = [KyngoCoreData]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let fileUrl = Bundle.main.url(forResource: "data.json", withExtension: nil)
        else {
            print("File not found :/")
            return
        }
        
        let data = try? Data(contentsOf: fileUrl)
        do {
            let sections = try JSONDecoder().decode([KyngoCoreData].self, from: data!)
            self.Content = sections
        } catch {
            print("ERROR! \(error)")
        }
    }
}
