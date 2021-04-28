//
//  VaccineRecordViewController.swift
//  Capstone Project iOS
//
//  Created by Harp on 3/28/21.
//

import UIKit

class VaccineRecordViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var records: [Record] = []
    
//    let records = [
//        ["Add New Record"],
//        ["1", "2"]
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        records = createArray()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func createArray() -> [Record] {
        var tempRecords: [Record] = []
        
//        let record1 = Record(virusName: "Covid-19", vaccinatedDate: "2021-04-20", manufacturer: "Pfizer", provider: "Dr. Atrey", office: "UAlbany", expireDate: "2022-04-20")
//        let record2 = Record(virusName: "Flu", vaccinatedDate: "2020-08-21", manufacturer: "Unknown", provider: "Dr. Atrey", office: "UAlbany", expireDate: "N/A")
//        let record3 = Record(virusName: "Chickenpox", vaccinatedDate: "2015-02-15", manufacturer: "Unknown", provider: "Dr. Atrey", office: "UAlbany", expireDate: "N/A")
        
        let record1 = Record(virusNmae: "Covid-19", vaccinatedDate: "2021-04-20")
        let record2 = Record(virusNmae: "Flu", vaccinatedDate: "2020-08-21")
        let record3 = Record(virusNmae: "Chickenpox", vaccinatedDate: "2015-02-15")
        
        tempRecords.append(record1)
        tempRecords.append(record2)
        tempRecords.append(record3)
        
        return tempRecords
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VaccineRecordViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You tapped me!")
    }
}

extension VaccineRecordViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return records.count
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return records[section].count
        return records.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let record = records[indexPath.row]
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! recordCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell") as! recordCell
        cell.setRecord(record: record)
        
        return cell
    }
}
