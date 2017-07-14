//
//  BarVC.swift
//  F
//
//  Created by ZYFAR on 13.07.17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class BarVC: UIViewController {

    @IBOutlet weak var barTV: UITableView!
    let items = ["Cola", "Pepsi", "Fanta", "Sprite","Jack Daniels", "Martini", "Beer", "Vodka"]
    var item = [Bar]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barTV.tableFooterView = UIView()
        barTV.register(UINib(nibName: "WaiterCell", bundle: nil), forCellReuseIdentifier: "WaiterCell")
        barTV.estimatedRowHeight = 40
        barTV.rowHeight = UITableViewAutomaticDimension
    }
}

extension BarVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WaiterCell") as! WaiterCell
        
        cell.btnOrder.tag = indexPath.row
        cell.lblName.text = items[indexPath.row]
        let name = Bar(str: items[indexPath.row])
        item.append(name)
        cell.btnOrder.addTarget(self, action: #selector(Order), for: .touchUpInside)
        
        return cell
    }
    
    
    func Order(sender: UIButton) {
        let buttonTag = sender.tag
        CartManager.shared.addBar(name: item[buttonTag].name)
    }
}
