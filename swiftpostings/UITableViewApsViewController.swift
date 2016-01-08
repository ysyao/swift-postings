//
//  UITableViewApsViewController.swift
//  swiftpostings
//
//  Created by 易诗尧 on 16/1/6.
//  Copyright © 2016年 yishiyao. All rights reserved.
//

import UIKit

class UITableViewApsViewController: UITableViewController {
    let cellIdentifier = "imageTableCell"
    let cellNibName = "ImageTableCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let editButton: UIBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("edit"))
        self.navigationItem.rightBarButtonItem = editButton
        let backButton: UIBarButtonItem = UIBarButtonItem(title: "Close", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("close"))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    func edit() -> Void {
        print("Press Edit..")
    }
    
    func close() -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: ImageTableViewCell? = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? ImageTableViewCell
        if (cell == nil) {
            let nib = NSBundle.mainBundle().loadNibNamed(cellNibName, owner: self, options: nil)
            cell = nib[0] as? ImageTableViewCell
        }
        
        if(cell != nil) {
            cell!.nameLabel.text = "Jimmy"
            cell!.prepTimeLabel.text = "2016-1-1"
            //cell.imageView?.image =
        }
        return cell!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
