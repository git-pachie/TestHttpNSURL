//
//  ViewController.swift
//  TestNetwork
//
//  Created by Archimedes Angeles on 15/11/19.
//  Copyright © 2019 Archimedes Angeles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var posX = [Post]()
    
    @IBOutlet weak var tableX: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posX.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = posX[indexPath.row].title
        cell.detailTextLabel?.text = posX[indexPath.row].url
        
        return cell
    }
    
    
    var networkManager = NetworkManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        networkManager.fetchData { (postArray) in
            
            self.posX = postArray
            
//            for item in postArray {
//                print(item.title)
//
//                for tags in item._tags!
//                {
//                    print("tags :\(tags)")
//                }
//
//            }
            
            self.tableX.reloadData()
            
        }
        
        
        
    }
    
    
}

