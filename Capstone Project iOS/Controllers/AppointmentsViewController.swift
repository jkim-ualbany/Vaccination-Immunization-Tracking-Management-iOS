//
//  AppointmentsViewController.swift
//  Capstone Project iOS
//
//  Created by Harp on 3/28/21.
//

import UIKit

class AppointmentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell") as! appointmentCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell", for: indexPath) as! appointmentCell
        cell.virusName.text = "Covid-19"
        cell.dateHeader.text = "Tomorrow"
        cell.date.text = "2021-04-20"
        cell.time.text = "10:00AM"
        cell.address.text = "1400 Washington Ave, NY 12222"
        cell.office.text = "UAlbany"
        cell.provider.text = "Dr. Atrey"
        cell.contact.text = "646-777-7777"
        cell.website.text = "www.albany.edu"
        return cell
    }
    



}
