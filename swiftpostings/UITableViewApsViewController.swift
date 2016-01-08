//
//  UITableViewApsViewController.swift
//  swiftpostings
//
//  Created by 易诗尧 on 16/1/6.
//  Copyright © 2016年 yishiyao. All rights reserved.
//

import UIKit

class UITableViewApsViewController: UITableViewController {
    enum UIBarButtonStatus {
        case EDITING, NONE
    }
    
    let cellIdentifier = "imageTableCell"
    let cellNibName = "ImageTableCell"
    var cell: ImageTableViewCell?
    var cellCount: Int = 50

    var editButton: UIBarButtonItem {
        get {
            return UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("edit"))
        }
    }
    var backButton: UIBarButtonItem {
        get{
            return UIBarButtonItem(title: "Close", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("close"))
        }
    }
    var doneButton: UIBarButtonItem {
        get {
            return UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("done"))
        }
    }
    
    var isDisplayEditingBar: Bool? {
        set {
            if let newValue1 = newValue {
                if newValue1 {
                    self.navigationItem.leftBarButtonItem = nil
                    self.navigationItem.rightBarButtonItem = doneButton
                } else {
                    self.navigationItem.rightBarButtonItem = editButton
                    self.navigationItem.leftBarButtonItem = backButton
                }
            }
        }
        get {
            return self.isDisplayEditingBar
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        isDisplayEditingBar = false
    }
    
    func edit() -> Void {
        isDisplayEditingBar = true
        self.tableView.setEditing(true, animated: true)
    }
    
    func close() -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func done() -> Void {
         isDisplayEditingBar = false
        self.tableView.setEditing(false, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        cell = self.tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? ImageTableViewCell
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
        return cellCount
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(cell != nil) {
            let size: CGSize = (cell?.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize))!
            return (size.height + 1)
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 78
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case UITableViewCellEditingStyle.Delete:
            cellCount -= 1
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            break
        default:
            return
        }
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
