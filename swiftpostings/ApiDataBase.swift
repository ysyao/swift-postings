//
//  ApiItems.swift
//  swiftpostings
//
//  Created by 易诗尧 on 16/1/5.
//  Copyright © 2016年 yishiyao. All rights reserved.
//
//  这是一个数据生成Model，将所有的api囊括进来供UITableViewController页面生成列表。
//
import UIKit

public class ApiDataBase {
    //每一项row的数据
    public class ApiItem {
        var name: String
        var description: String
        var controllerIdentifier: String?
        init(name: String, description: String, controllerIdentifier: String?) {
            self.name = name
            self.controllerIdentifier = controllerIdentifier
            self.description = description
        }
    }
    
    //每一个section的数据
    public class ApiSection {
        var sectionName: String
        var sectionId: Int
        var apiItems: [ApiItem]?
        init(sectionId: Int, sectionName: String, apiItems: [ApiItem]?) {
            self.sectionId = sectionId
            self.sectionName = sectionName
            self.apiItems = apiItems
        }
    }
    
    var tableData = [ApiSection]()
    
    let section0: [[String?]]? = [
        ["UITableView Api", "Add, delete, edit uitableview", "uiTableViewNavigationController"],
        ["UIButton Api", "description of UiButton", nil],
        ["UILable Api", "description of UiLable", nil],
        ["UIImageView Api", "description of UIImageView", nil],
        ["UIDatePicker Api", "description of UIDatePicker", nil],
    ]
    
    init() {
        //生成数据
        tableData.append(generateSectionByArray(0, sectionName: "UIKit", sectionArray: section0))
        tableData.append(generateSectionByArray(1, sectionName: "API", sectionArray: nil))
    }
    
    
    func getItemsInSection(section: Int) -> [ApiItem]? {
        return tableData[section].apiItems!
    }
    
    private func generateSectionByArray(sectionId: Int, sectionName: String, sectionArray: [[String?]]?) -> ApiSection {
        var itemsInSection = [ApiItem]()
        if let array = sectionArray {
            for itemData: [String?] in array {
                let item = ApiItem(name: itemData[0]!, description: itemData[1]!, controllerIdentifier: itemData[2])
                itemsInSection.append(item)
            }
        }
        
        return ApiSection(sectionId: sectionId, sectionName: sectionName, apiItems: itemsInSection)
    }

}
