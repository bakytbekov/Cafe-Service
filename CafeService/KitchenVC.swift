//
//  KitchenVC.swift
//  F
//
//  Created by ZYFAR on 13.07.17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class KitchenVC: UIViewController {

    @IBOutlet weak var kitchenTV: UITableView!
    let items = ["Перлотто с боровиками", "Овощной рататуй", "Лосось с цветной капустой", "Сибас, запеченный с шалфеем"]
    var food = [Dish]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        kitchenTV.tableFooterView = UIView()
        kitchenTV.register(UINib(nibName: "WaiterCell", bundle: nil), forCellReuseIdentifier: "WaiterCell")
        kitchenTV.estimatedRowHeight = 40
        kitchenTV.rowHeight = UITableViewAutomaticDimension
    }
}

extension KitchenVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WaiterCell") as! WaiterCell
        
        cell.btnOrder.tag = indexPath.row
        cell.lblName.text = items[indexPath.row]
        let dish = Dish(str: items[indexPath.row])
        food.append(dish)
        cell.btnOrder.addTarget(self, action: #selector(Order), for: .touchUpInside)
        return cell
    }
    
    
    func Order(sender: UIButton) {
        let buttonTag = sender.tag
        CartManager.shared.addDish(name: food[buttonTag].name)
    }

}
