//
//  CartVC.swift
//  F
//
//  Created by ZYFAR on 13.07.17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class CartVC: UIViewController {

    @IBOutlet var cartV: UIView!
    @IBOutlet weak var cartPickerV: UIPickerView!
    @IBOutlet weak var cartTV: UITableView!
    var dishes = [String]()
    var hookah = [String]()
    var bar = [String]()
    var items = [[String]]()
    let tables = ["1" , "2" , "3" , "4" , "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartTV.tableFooterView = UIView()
        cartTV.estimatedRowHeight = 40
        cartTV.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = []
        dishes = CartManager.shared.getAllDishes()
        bar = CartManager.shared.getAllBar()
        hookah = CartManager.shared.getAllHookah()
        items.append(dishes)
        items.append(bar)
        items.append(hookah)
        cartTV.reloadData()
    }
    
    @IBAction func showCheckoutView(_ sender: UIButton) {
        self.view.addSubview(cartV)
        Animations.shared.showCustomView(view: cartV)
    }
    @IBAction func dismissCheckoutView(_ sender: UIButton) {
        Animations.shared.dismissCustomView(view: cartV)
    }
}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! CartCell
        cell.lblName.text = items[indexPath.section][indexPath.row]
        cell.lblAmount.text = "0"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Кухня"
        } else if section == 1 {
            return "Бар"
        } else {
            return "Кальян"
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items[indexPath.section].remove(at: indexPath.row)
            switch indexPath.section {
            case 0:
                CartManager.shared.removeDish(id: indexPath.row)
            case 1:
                CartManager.shared.removeBar(id: indexPath.row)
            case 2:
                CartManager.shared.removeHookah(id: indexPath.row)
            default:
                break
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}

extension CartVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tables.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tables[row]
    }
}
