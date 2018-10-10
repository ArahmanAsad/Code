//
//  AppDelegate.swift
//  Code
//
//  Created by A.Rahman on 8/7/18.
//  Copyright © 2018 per. All rights reserved.
//

import UIKit

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
     @IBOutlet weak var TableView: UITableView!
    
     override func viewDidLoad() {
        super.viewDidLoad()
    Database.inputData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDisplayScreen", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextScreen=segue.destination as? DisplayVC{
        nextScreen.recievedInformation = Database.Array[sender as! Int]
        }
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Database.Array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = TableView.dequeueReusableCell(withIdentifier: "Cell")as! MyCell
   
//    cell.label.text=""
//    cell.laImage.image=nil
        
    cell.label.text=Database.Array[indexPath.row].name
    cell.laImage.image=Database.Array[indexPath.row].image
    return cell
    }


}

