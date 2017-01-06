//
//  TableViewController.swift
//  ContactView
//
//  Created by NguyenDucBien on 1/5/17.
//  Copyright © 2017 NguyenDucBien. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var arrayData: NSMutableArray!
    var dictContacts = NSMutableDictionary()
    var arrayKey: NSArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.sectionIndexBackgroundColor = UIColor.grayColor()
        self.tableView.sectionIndexColor = UIColor.whiteColor()
        
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        arrayData = NSMutableArray()
        for i in 0...60
        {
            arrayData.addObject(Person())
            let person = arrayData[i] as! Person
            print(person.fullName)
        }
        for element in arrayData //Truy xuất lần lượt từng phần tử trong mảng arrayData
        {
            let person = element as! Person
            var firstLetter: String = (person.firstName as NSString!).substringToIndex(1) //Khai báo 1 string và gán giá trị là kí tự đầu tiên trong string firstName
            if firstLetter == "Đ" {
                firstLetter = "D"
            }
            if firstLetter == "Á" {
                firstLetter = "A"
            }
            var arrayForLetter: NSMutableArray! //Khai báo mảng để chứa các đối tượng person có firstName tương ứng với firstLetter
            
            if (dictContacts.valueForKey(firstLetter) != nil) // Kiểm tra nếu value tương ứng với key trong dictContacts mà tồn tại giá trị thì...
            {
                arrayForLetter = dictContacts.valueForKey(firstLetter) as! NSMutableArray //Gán giá trị đó đến mảng arayForLetter
                arrayForLetter.addObject(person)//Sau đó add thêm đối tượng person đến arrayForLetter
                dictContacts.setValue(arrayForLetter, forKey: firstLetter)
            }
            else //Trong trường hợp value tương ứng với key trong dictContacts mà bằng nil
            {
                arrayForLetter = NSMutableArray(object: person) // Gán đối tượng person đến mảng arrayForLetter
                dictContacts.setValue(arrayForLetter, forKey: firstLetter) // Sau đó set value cho dictContacts là arrayForLetter tương ứng với key là firstLetter
            }
        }
        arrayKey = dictContacts.allKeys as! [String] // Lấy ra mảng chứa tất cả các key tron dictContacts
        arrayKey = arrayKey.sortedArrayUsingSelector("compare:")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    //    override func didReceiveMemoryWarning() {
    //        super.didReceiveMemoryWarning()
    //        // Dispose of any resources that can be recreated.
    //    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return arrayKey.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let sectionTitle = arrayKey[section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        
        return (sectionPersons?.count)!
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayKey[section] as? String
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arrayKey as? [String]
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.grayColor()
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.whiteColor()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        let person = sectionPersons![indexPath.row] as! Person
        
        cell?.textLabel?.text = person.fullName
        cell?.detailTextLabel?.text = person.mobilePhone
        
        
        // Configure the cell...
        
        return cell!
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = DetailVC()
        let sectionTitle = arrayKey[indexPath.section]
        let sectionPersons = dictContacts[sectionTitle as! String]
        let person = sectionPersons![indexPath.row] as! Person
        detailVC.person = person
        self.navigationController?.pushViewController(detailVC, animated: true) // chuyen tu TableViewControler sang DetailVC
    }
    
    
  
    
}
