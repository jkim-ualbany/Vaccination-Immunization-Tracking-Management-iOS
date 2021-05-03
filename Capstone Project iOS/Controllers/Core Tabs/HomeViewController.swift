//
//  ViewController.swift
//  Capstone Project iOS
//
//  Created by Harp on 3/22/21.
//

import UIKit

class HomeViewController: UIViewController {
    // here is a demo for fetching login information and displaying uid on the notification label
    @IBOutlet weak var notificationlabel: UILabel!
    //let conn = DatabaseConnection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //conn.delegate = self
        // Do any additional setup after loading the view.
        
        // here is testing code

        //conn.downloadItems("login", ["login":"alice","password":"alice"])
        let obj = Database.getInstance().fetchLogin("alice", "alice")
        if (obj == nil) {
            notificationlabel.text = "login failed"
        } else {
            let o = obj
            notificationlabel.text = "welcome user \(o!.uid ?? -1)"
        }
        
    }


}

