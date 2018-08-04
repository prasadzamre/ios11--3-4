//
//  TableViewController.swift
//  Todoey with Firebase
//
//  Created by Prasad Zamre on 17/07/18.
//  Copyright © 2018 Prasad Zamre. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController {
    
    var itemArray = [Data]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    getData()
        
        

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "pzcell", for: indexPath)
        
        cell.textLabel?.text! = item.toDO
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func addItem(todo : String , done : String ){
        let item = Database.database().reference().child("Todoe")
        let itemdic = ["Item" : todo, "done" : String(done)]
        item.childByAutoId().setValue(itemdic)
        print(itemdic)
    }
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "Add new Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action1) in
            
            let newItem = Data()
            
            newItem.toDO = textfield.text!
            newItem.done = false
            
            self.itemArray.append(newItem)
            
            self.addItem(todo: newItem.toDO, done: String(newItem.done))
            
            self.tableView.reloadData()
        
            
            
           
            
        }
        
        alert.addTextField { (text) in
            text.placeholder = "Enter an item"
            textfield = text
        }
        
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
        
       
        
        
    }
    
    func getData(){
        let messageDB = Database.database().reference().child("Todoe")
        
        messageDB.observe(.childAdded) { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            let text = snapshotValue["Items"]!
            let sender = snapshotValue["done"]!
            print(text, sender)
            
            let message  = Data()
            message.toDO = text
            //message.done = sender
            
            self.itemArray.append(message)
        
            self.tableView.reloadData()
            
        }
        
    
    }
    

    
}
