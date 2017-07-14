//
//  CookerVC.swift
//  F
//
//  Created by ZYFAR on 13.07.17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class CookerVC: UIViewController {
    
    @IBOutlet weak var foodProgressSC: UISegmentedControl!
    @IBOutlet weak var foodProgressTV: UITableView!
    let toDoList = ["Овощной рататуй" , "Фундучная карамель" , "Перлотто с боровиками"]
    let inProgressList = ["Паштет изи печени"]
    let doneList = ["Лосось с цветной капустой" , "Сибас, запеченный с шалфеем"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func foodProgressSCAction(_ sender: Any) {
        foodProgressTV.reloadData()
    }
}

extension CookerVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var countList = 0
        
        switch foodProgressSC.selectedSegmentIndex {
        case 0:
            countList = toDoList.count
            break
        case 1:
            countList = inProgressList.count
            break
        case 2:
            countList = doneList.count
            break
        default:
            break
        }
        return countList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        switch foodProgressSC.selectedSegmentIndex {
        case 0:
            cell.textLabel?.text = toDoList[indexPath.row]
            //cell.sendToNextBtn.isHidden = false
            break
        case 1:
            cell.textLabel?.text = inProgressList[indexPath.row]
            //cell.sendToNextBtn.isHidden = false
            break
        case 2:
            cell.textLabel?.text = doneList[indexPath.row]
            //cell.sendToNextBtn.isHidden = true
            break
        default:
            break
        }
        return cell
    }
}
