//
//  Database.swift
//  Capstone Project iOS
//
//  Created by Joeun Kim on 4/28/21.
//

import Foundation

class Database {
    static let instance: Database = Database()
    init() {
    }
    static func getInstance() -> Database {
        return instance
    }

    // Fetch open time slots on the given date from Database
    func fetchLogin(_ login: String, _ password: String) -> LoginModel? {
        let param: NSDictionary = ["login": login, "password": password]
        return DatabaseConnection.fetchData("login", param) as? LoginModel
    }
    
    // Fetch open time slots on the given date from Database
    func fetchOpenTimeSlotsFor(date: Date) -> [Date]? {
        return nil
    }
    
    // Fetch Vaccination Records for the current user
    func fetchVaccinationRecords() -> [Record]? {
        return nil
    }
    
    // Fetch Vaccination Record with Details
    func fetchVaccinationRecordDetails(for recordID: Int) -> Record? {
        return nil
    }
}
