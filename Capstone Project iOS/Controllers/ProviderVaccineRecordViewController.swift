//
//  ProviderVaccineRecordViewController.swift
//  Capstone Project iOS
//
//  Created by Joeun Kim on 4/28/21.
//

import UIKit

class ProviderVaccineRecordViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    //    var records: [patientName: String, vacciatedDate: String, dob: String] = []
//
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You tapped me!")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "providerRecordCell") as! providerRecordCell
        cell.patientName.text = "Smith, James"
        cell.vaccinatedDateLabel.text = "2021-04-20"
        cell.dobLabel.text = "1994-05-19"
        
        return cell
    }
    
    

}
