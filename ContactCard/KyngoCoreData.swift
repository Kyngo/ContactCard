//
//  KyngoButtonData.swift
//  ContactCard
//
//  Created by Arnau Martín on 2/3/22.
//

import Foundation

struct KyngoButtonData: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case url
        case comment
    }
    var id = UUID()
    let name: String
    let url: String
    let comment: String
}

struct KyngoCoreData: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case description
        case content
    }
    var id = UUID()
    let description: String
    let content: [KyngoButtonData]
}
