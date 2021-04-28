//
//  FindProviderViewController.swift
//  Capstone Project iOS
//
//  Created by Harp on 3/28/21.
//

import UIKit

class FindProviderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cellDetailContainer: UIView!
    
    var detailContainerViewConstraint = NSLayoutConstraint() // height=0
    var detailContainerViewHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
//        tableView.estimatedRowHeight =
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        detailContainerViewHeight = cellDetailContainer.frame.height // height of expanded view
//        var constHeightEqualToZero: NSLayoutConstraint!
//        cellDetailContainer.translatesAutoresizingMaskIntoConstraints = false
//        constHeightEqualToZero = cellDetailContainer.heightAnchor.constraint(equalToConstant: 0)
//        detailContainerViewConstraint = constHeightEqualToZero
//        constHeightEqualToZero.isActive = true // collapse
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You tapped me!")
//        if(cellDetailContainer.frame.height == 0) {
//            if(detailContainerViewConstraint.constant == self.detailContainerViewHeight) {
//                UIView.animate(withDuration: 0.35, animations: {
//                    self.detailContainerViewConstraint.constant = 0
//                    self.view.layoutIfNeeded()
//                }, completion: {_ in
//                })
//            }
//            UIView.animate(withDuration: 0.35, animations: {
//                self.detailContainerViewConstraint.constant = self.detailContainerViewHeight
//                self.view.layoutIfNeeded()
//            }, completion: {_ in
//            })
//        } else {
//            UIView.animate(withDuration: 0.35, animations: {
//                self.detailContainerViewConstraint.constant = 0
//                self.view.layoutIfNeeded()
//            }, completion: {_ in
//            })
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "providerInfoCell", for: indexPath) as! providerInfoCell
        
        cell.providerName.text = "Dr. Atrey"
        cell.distance.text = "3.2 miles"
        cell.address.text = "1400 Washington Ave, NY 12222"
        cell.contact.text = "(1)646-777-7777"
        cell.website.text = "www.albany.edu"
        
        return cell
    }
    

}
