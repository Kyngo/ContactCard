//
//  QRGenerator.swift
//  ContactCard
//
//  Created by Arnau Martín on 8/3/22.
//

import Foundation
import CoreImage.CIFilterBuiltins
import UIKit

class QRGenerator {
    private let context = CIContext()
    private let filter = CIFilter.qrCodeGenerator()
    private var vCard: ContactData
    
    private var firstName: String?
    public func setFirstName(_ x: String?) {
        if !x!.isEmpty {
            self.firstName = x!
        }
    }
    
    private var lastName: String?
    public func setLastName(_ x: String?) {
        if !x!.isEmpty {
            self.lastName = x!
        }
    }
    
    private var gender: String?
    public func setGender(_ x: String?) {
        if !x!.isEmpty {
            self.gender = "BDAY:" + x! + "\n"
        }
    }
    
    private var birthdate: String?
    public func setBirthdate(_ x: String?) {
        if !x!.isEmpty {
            self.birthdate = "X-GENDER:" + x! + "\n"
        }
    }
    
    private var homeAddress: String?
    public func setHomeAddress(_ x: String?) {
        if !x!.isEmpty {
            self.homeAddress = "ADDR;TYPE=home:;;" + x! + "\n"
        }
    }
    
    private var workAddress: String?
    public func setWorkAddress(_ x: String?) {
        if !x!.isEmpty {
            self.workAddress = "ADDR;TYPE=work:;;" + x! + "\n"
        }
    }
    
    private var phone: String?
    public func setPhone(_ x: String?) {
        if !x!.isEmpty {
            self.phone = "TEL;TYPE=home:" + x! + "\n"
        }
    }
    
    private var workPhone: String?
    public func setWorkPhone(_ x: String?) {
        if !x!.isEmpty {
            self.workPhone = "TEL;TYPE=work:" + x! + "\n"
        }
    }
    
    private var email: String?
    public func setEmail(_ x: String?) {
        if !x!.isEmpty {
            self.email = "EMAIL;TYPE=internet,home:" + x! + "\n"
        }
    }
    
    private var workEmail: String?
    public func setWorkEmail(_ x: String?) {
        if !x!.isEmpty {
            self.workEmail = "EMAIL;TYPE=internet,work:" + x! + "\n"
        }
    }
    
    private var website: String?
    public func setWebsite(_ x: String?) {
        if !x!.isEmpty {
            self.website = "URL;TYPE=home:" + x! + "\n"
        }
    }
    
    private var workWebsite: String?
    public func setWorkWebsite(_ x: String?) {
        if !x!.isEmpty {
            self.workWebsite = "URL;TYPE=work:" + x! + "\n"
        }
    }
    
    private var businessName: String?
    public func setBusinessName(_ x: String?) {
        if !x!.isEmpty {
            self.businessName = "ORG:" + x! + "\n"
        }
    }
    
    private var businessTitle: String?
    public func setBusinessTitle(_ x: String?) {
        if !x!.isEmpty {
            self.businessTitle = "TITLE:" + x! + "\n"
        }
    }
    
    private var facebook: String?
    public func setFacebook(_ x: String?) {
        if !x!.isEmpty {
            self.facebook = "socialProfile;type=facebook:" + x! + "\n"
        }
    }
    
    private var twitter: String?
    public func setTwitter(_ x: String?) {
        if !x!.isEmpty {
            self.twitter = "socialProfile;type=twitter:" + x! + "\n"
        }
    }
    
    private var instagram: String?
    public func setInstagram(_ x: String?) {
        if !x!.isEmpty {
            self.instagram = "socialProfile;type=instagram:" + x! + "\n"
        }
    }
    
    private var skype: String?
    public func setSkype(_ x: String?) {
        if !x!.isEmpty {
            self.skype = "X-SKYPE:" + x! + "\n"
        }
    }
    
    private var youtube: String?
    public func setYoutube(_ x: String?) {
        if !x!.isEmpty {
            self.youtube = "socialProfile;type=youtube:" + x! + "\n"
        }
    }
    
    private var github: String?
    public func setGithub(_ x: String?) {
        if !x!.isEmpty {
            self.github = "socialProfile;type=github:" + x! + "\n"
        }
    }
    
    init() {
        let vcl = vCardDataLoader()
        self.vCard = vcl.Content!
        self.setFirstName(self.vCard.firstName)
        self.setLastName(self.vCard.lastName)
        self.setGender(self.vCard.gender)
        self.setBirthdate(self.vCard.birthdate)
        self.setHomeAddress(self.vCard.homeAddress)
        self.setWorkAddress(self.vCard.workAddress)
        self.setPhone(self.vCard.phone)
        self.setWorkPhone(self.vCard.workPhone)
        self.setEmail(self.vCard.email)
        self.setWorkEmail(self.vCard.workEmail)
        self.setWebsite(self.vCard.website)
        self.setWorkWebsite(self.vCard.workWebsite)
        self.setBusinessName(self.vCard.businessName)
        self.setBusinessTitle(self.vCard.businessTitle)
        self.setFacebook(self.vCard.facebook)
        self.setTwitter(self.vCard.twitter)
        self.setInstagram(self.vCard.instagram)
        self.setSkype(self.vCard.skype)
        self.setYoutube(self.vCard.youtube)
        self.setGithub(self.vCard.github)
    }

    public func GenerateQR() -> UIImage {
        var string: String = "BEGIN:VCARD\nVERSION:3.0\n"
        
        // N and FN fields to be done as such because one-liners make the compiler freeze (?)
        string.append("N:" + (self.lastName ?? "") + ";")
        string.append((self.firstName ?? "") + "\n")
        string.append("FN:" + (self.firstName ?? ""))
        string.append(" " + (self.lastName ?? "") + "\n")
        // the rest of fields work properly
        
        string.append((self.gender ?? ""))
        string.append((self.birthdate ?? ""))
        string.append((self.homeAddress ?? ""))
        string.append((self.workAddress ?? ""))
        string.append((self.phone ?? ""))
        string.append((self.workPhone ?? ""))
        string.append((self.email ?? ""))
        string.append((self.workEmail ?? ""))
        string.append((self.website ?? ""))
        string.append((self.workWebsite ?? ""))
        string.append((self.businessName ?? ""))
        string.append((self.businessTitle ?? ""))
        string.append((self.facebook ?? ""))
        string.append((self.twitter ?? ""))
        string.append((self.instagram ?? ""))
        string.append((self.skype ?? ""))
        string.append((self.youtube ?? ""))
        string.append((self.github ?? ""))
        string.append("END:VCARD")
        
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()

    }
}
