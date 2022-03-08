//
//  ContactData.swift
//  ContactCard
//
//  Created by Arnau Martín on 8/3/22.
//

import Foundation

struct ContactData: Decodable {
    let firstName: String?
    let lastName: String?
    let gender: String?
    let birthdate: String?
    let homeAddress: String?
    let workAddress: String?
    let email: String?
    let workEmail: String?
    let phone: String?
    let workPhone: String?
    let website: String?
    let workWebsite: String?
    let businessName: String?
    let businessTitle: String?
    let facebook: String?
    let twitter: String?
    let instagram: String?
    let skype: String?
    let youtube: String?
    let github: String?
}
