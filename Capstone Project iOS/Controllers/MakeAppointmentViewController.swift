//
//  MakeAppointmentViewController.swift
//  Capstone Project iOS
//
//  Created by Joeun Kim on 4/28/21.
//

import UIKit

class MakeAppointmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var timeTableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var availableTimes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeTableView.delegate = self
        timeTableView.dataSource = self
        datePicker.datePickerMode = .date
        availableTimes = loadAvailableTimesByDefault()
    }
    
    func loadAvailableTimesByDefault() -> [String] {
        var times = [String]()
        times.append("10:00")
        times.append("11:00")
        times.append("13:00")
        times.append("16:00")
        return times
    }
    
    func loadAvailableTimes(times: [String]) -> [String] {
        var passedtimes = [String]()
        passedtimes = times
//        times.append("10:00")
//        times.append("11:00")
//        times.append("13:00")
//        times.append("16:00")
        return passedtimes
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You tapped me!")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return availableTimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let time = availableTimes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentAvailableTimeCell", for: indexPath) as! AppointmentAvailableTimeCell
//        cell.availableTime.text = "10:00"
        cell.setTime(time: time)
        return cell
    }

}
