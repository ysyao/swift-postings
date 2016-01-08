//
//  ViewController.swift
//  swiftpostings
//
//  Created by 易诗尧 on 16/1/4.
//  Copyright © 2016年 yishiyao. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let identifier: String = "apiItemCell"
    lazy var apiItems: ApiDataBase = ApiDataBase()
    @IBOutlet var uiTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        uiTableView.delegate = self
        uiTableView.dataSource = self
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row as Int
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        if let items = apiItems.tableData[indexPath.section].apiItems {
            let item = items[row]
            cell.textLabel?.text = item.name
            cell.detailTextLabel?.text = item.description
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = apiItems.getItemsInSection(section) {
            return items.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return apiItems.tableData[section].sectionName
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return apiItems.tableData.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row as Int
        let item = apiItems.tableData[indexPath.section].apiItems![row]
        let uiStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let identifier: String = item.controllerIdentifier {
            let controller = uiStoryboard.instantiateViewControllerWithIdentifier(identifier)
            self.presentViewController(controller, animated: true, completion: didPresentViewController)
        }
    }
    
    //在打开新viewController之后将tableView上被选中的row设定为为选中
    func didPresentViewController() -> Void {
        self.uiTableView.deselectRowAtIndexPath(self.uiTableView.indexPathForSelectedRow!, animated: true)
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let backItem = UIBarButtonItem()
//        backItem.title = "Api List"
//        self.navigationItem.backBarButtonItem = backItem
//    }
}

