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
    
    private var firstName: String?
    public func setFirstName(x: String) {
        self.firstName = x
    }
    
    private var lastName: String?
    public func setLastName(x: String) {
        self.lastName = x
    }
    
    private var gender: String?
    public func setGender(x: String) {
        self.gender = "BDAY:" + x + "\n"
    }
    
    private var birthdate: String?
    public func setBirthdate(x: String) {
        self.birthdate = "X-GENDER:" + x + "\n"
    }
    
    private var homeAddress: String?
    public func setHomeAddress(x: String) {
        self.homeAddress = "ADDR;TYPE=home:;;" + x + "\n"
    }
    
    private var workAddress: String?
    public func setWorkAddress(x: String) {
        self.workAddress = "ADDR;TYPE=work:;;" + x + "\n"
    }
    
    private var phone: String?
    public func setPhone(x: String) {
        self.phone = "TEL;TYPE=home:" + x + "\n"
    }
    
    private var workPhone: String?
    public func setWorkPhone(x: String) {
        self.workPhone = "TEL;TYPE=work:" + x + "\n"
    }
    
    private var email: String?
    public func setEmail(x: String) {
        self.email = "EMAIL;TYPE=internet,home:" + x + "\n"
    }
    
    private var workEmail: String?
    public func setWorkEmail(x: String) {
        self.workEmail = "EMAIL;TYPE=internet,work:" + x + "\n"
    }
    
    private var website: String?
    public func setWebsite(x: String) {
        self.website = "URL;TYPE=home:" + x + "\n"
    }
    
    private var workWebsite: String?
    public func setWorkWebsite(x: String) {
        self.workWebsite = "URL;TYPE=work:" + x + "\n"
    }
    
    private var businessName: String?
    public func setBusinessName(x: String) {
        self.businessName = "ORG:" + x + "\n"
    }
    
    private var businessTitle: String?
    public func setBusinessTitle(x: String) {
        self.businessTitle = "TITLE:" + x + "\n"
    }
    
    private var facebook: String?
    public func setFacebook(x: String) {
        self.facebook = "socialProfile;type=facebook:" + x + "\n"
    }
    
    private var twitter: String?
    public func setTwitter(x: String) {
        self.twitter = "socialProfile;type=twitter:" + x + "\n"
    }
    
    private var instagram: String?
    public func setInstagram(x: String) {
        self.instagram = "socialProfile;type=instagram:" + x + "\n"
    }
    
    private var skype: String?
    public func setSkype(x: String) {
        self.skype = "X-SKYPE:" + x + "\n"
    }
    
    private var youtube: String?
    public func setYoutube(x: String) {
        self.youtube = "socialProfile;type=youtube:" + x + "\n"
    }
    
    private var github: String?
    public func setGithub(x: String) {
        self.github = "socialProfile;type=github:" + x + "\n"
    }

    public func GenerateQR() -> UIImage {
        var string: String = "BEGIN:VCARD\nVERSION:3.0\n"
        // string.append("N:" + (lastName ?? "") + ";" + (firstName ?? "") + "\n")
        // string.append("FN:" + (firstName ?? "") + " " + (lastName ?? "") + "\n")
        string.append((gender ?? ""))
        string.append((birthdate ?? ""))
        string.append((homeAddress ?? ""))
        string.append((workAddress ?? ""))
        string.append((phone ?? ""))
        string.append((workPhone ?? ""))
        string.append((email ?? ""))
        string.append((workEmail ?? ""))
        string.append((website ?? ""))
        string.append((workWebsite ?? ""))
        string.append((businessName ?? ""))
        string.append((businessTitle ?? ""))
        string.append((facebook ?? ""))
        string.append((twitter ?? ""))
        string.append((instagram ?? ""))
        string.append((skype ?? ""))
        string.append((youtube ?? ""))
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
