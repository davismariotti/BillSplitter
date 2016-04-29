//
//  SummaryTableViewController.swift
//  BillSplitter
//
//  Created by gomeow on 4/26/16.
//  Copyright © 2016 Davis Mariotti. All rights reserved.
//

import UIKit

class SummaryTableViewController: UITableViewController {
    
    
    var transactions: Array<AnyObject> = []
    
    func loadSampleTransactions() {
        let photo1 = UIImage(named: "dog1")!
        let t1 = ["name":"Corgi Butt", "photo":photo1, "amount": 42.00]
        
        
        
        let photo2 = UIImage(named: "dog2")!
        let t2 = ["name":"Doug Barkman", "photo":photo2, "amount": 47.00]
        
        let photo3 = UIImage(named: "dog3")!
        let t3 = ["name":"Snowball", "photo":photo3, "amount": 0.00]
        
        let photo4 = UIImage(named: "default")!
        let t4 = ["name":"Billy", "photo":photo4, "amount": 876.01]
        
        transactions += [t1, t2, t3, t4]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleTransactions()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "SummaryTableViewCell"
        
        tableView.registerNib(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SummaryTableViewCell
        
        let t = transactions[indexPath.row]
        
        cell.name.text = t["name"] as? String
        cell.avatar.image = t["photo"] as? UIImage
        let amount: Double = t["amount"] as! Double
        cell.amount.text = String(format:"%.2f", amount)
        if(amount != 0.0) {
            cell.backgroundColor = UIColor.redColor()
        }
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}