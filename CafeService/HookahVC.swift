//
//  HookahVC.swift
//  F
//
//  Created by ZYFAR on 13.07.17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class HookahVC: UIViewController {

    @IBOutlet weak var hookahTV: UITableView!
    let items = ["Классический","На молоке","Мята" , "Al Fakher"]
    var item = [Hookah]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hookahTV.tableFooterView = UIView()
        hookahTV.register(UINib(nibName: "WaiterCell", bundle: nil), forCellReuseIdentifier: "WaiterCell")
        hookahTV.estimatedRowHeight = 40
        hookahTV.rowHeight = UITableViewAutomaticDimension
    }
}

extension HookahVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WaiterCell") as! WaiterCell
        
        cell.btnOrder.tag = indexPath.row
        cell.lblName.text = items[indexPath.row]
        let name = Hookah(str: items[indexPath.row])
        item.append(name)
        cell.btnOrder.addTarget(self, action: #selector(Order), for: .touchUpInside)
        return cell
    }
    
    
    func Order(sender: UIButton) {
        let buttonTag = sender.tag
        CartManager.shared.addHookah(name: item[buttonTag].name)
    }
}
