//
//  RideTableViewController.swift
//  PolyRideshares
//
//  Created by Jack Fales on 11/16/19.
//  Copyright © 2019 Justin Poist. All rights reserved.
//

import UIKit

class RideTableViewController: UITableViewController {
    
    // MARK: Properties
    var OfferPosts = [OfferPost]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load the sample data
        loadOfferPosts()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("HERE2")
        return OfferPosts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "RideTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RideTableViewCell  else {
        fatalError("The dequeued cell is not an instance of RideTableViewCell.")
        }
        
        // Fetches the appropriate OfferPost for the data source layout.
        let OfferPost3 = OfferPosts[indexPath.row]
        
        cell.fromToLabel.text = OfferPost3.fromLocation + " to " + OfferPost3.toLocation
        cell.dateTimeLabel.text = OfferPost3.date + " @ " + OfferPost3.time
        cell.seatsNameLabel.text = "Open Seats: " + OfferPost3.numSeats
        cell.nameLabel.text = OfferPost3.username
        print("HERE")
        
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Private Methods
    private func loadOfferPosts() {
        
        let OfferPost1 = OfferPost(username: "Jack Fales", fromLocation: "San Luis Obispo", toLocation: "Los Angeles", date: "11/20/2019", time: "05:30", price: "25", phoneNumber: "7141112222", willStop: true, numSeats: "3");
        let OfferPost2 = OfferPost(username: "Jack Fales", fromLocation: "San Luis Obispo", toLocation: "Los Angeles", date: "11/20/2019", time: "05:30", price: "25", phoneNumber: "7141112222", willStop: true, numSeats: "3");
        OfferPosts += [OfferPost1, OfferPost2]
        
    }

}
