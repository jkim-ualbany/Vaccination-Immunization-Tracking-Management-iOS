//
//  VaccineRecordViewController.swift
//  Capstone Project iOS
//
//  Created by Harp on 3/28/21.
//

import UIKit

class VaccineRecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let database: Database = Database()
    var records: [Record] = []
    
    var recordss: [String:String] = [:]

    var recordType: [String] = []
    var recordTime: [String] = []
//    let records = [
//        ["Add New Record"],
//        ["1", "2"]
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Test
        records = createArray()
        // From DB
        if let records = database.fetchVaccinationRecords() {
            self.records = records
        }

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createArray() -> [Record] {
        var tempRecords: [Record] = []
        
//        let record1 = Record(virusName: "Covid-19", vaccinatedDate: "2021-04-20", manufacturer: "Pfizer", provider: "Dr. Atrey", office: "UAlbany", expireDate: "2022-04-20")
//        let record2 = Record(virusName: "Flu", vaccinatedDate: "2020-08-21", manufacturer: "Unknown", provider: "Dr. Atrey", office: "UAlbany", expireDate: "N/A")
//        let record3 = Record(virusName: "Chickenpox", vaccinatedDate: "2015-02-15", manufacturer: "Unknown", provider: "Dr. Atrey", office: "UAlbany", expireDate: "N/A")
        
        let record1 = Record(recordID: "0001", virusNmae: "Covid-19", vaccinatedDate: "2021-04-20")
        let record2 = Record(recordID: "0002", virusNmae: "Flu", vaccinatedDate: "2020-08-21")
        let record3 = Record(recordID: "0003", virusNmae: "Chickenpox", vaccinatedDate: "2015-02-15")
        
        tempRecords.append(record1)
        tempRecords.append(record2)
        tempRecords.append(record3)
        
        return tempRecords
    }

    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You tapped me!")
    }
    
    // MARK: - Table View Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return records.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Section for Add New Button
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addNewCell") as! addNewCell
            
            return cell
        } else { // Section for existing Records
            let record = records[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell") as! recordCell
            cell.setRecord(record: record)
            
//          cell.virusNameLabel.text = recordType[indexPath.row]
//          cell.vaccinatedDateLabel.text = recordTime[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }

    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Preparing transition to Vaccine Detail Pge
        if segue.identifier == "VaccineRecordDetail" {
            if let vc = segue.destination as? VaccineRecordDetailViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    vc.record = records[indexPath.row]
                }
            }
        }
    }

}
