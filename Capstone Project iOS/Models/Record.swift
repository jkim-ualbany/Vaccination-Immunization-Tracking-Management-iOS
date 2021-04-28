//
//  Record.swift
//  Capstone Project iOS
//
//  Created by Joeun Kim on 4/27/21.
//

import UIKit

class Record {
    var recordID: String
    var virusName: String
    var vaccineName: String?
    var vaccinatedDate: String
    var manufacturer: String?
    var provider: String?
    var office: String?
    var expireDate: String?
    var document: UIImage?
    
    init(recordID: String, virusName: String, vaccineName: String, vaccinatedDate: String, manufacturer: String, provider: String, office: String, expireDate: String, document: UIImage) {
        self.recordID = recordID
        self.virusName = virusName
        self.vaccineName = vaccineName
        self.vaccinatedDate = vaccinatedDate
        self.manufacturer = manufacturer
        self.provider = provider
        self.office = office
        self.expireDate = expireDate
        self.document = document
    }
    init(recordID: String, virusNmae: String, vaccinatedDate: String) {
        self.recordID = recordID
        self.virusName = virusNmae
        self.vaccinatedDate = vaccinatedDate
    }
}
