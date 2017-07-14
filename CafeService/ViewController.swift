//
//  ViewController.swift
//  CafeService
//
//  Created by ZYFAR on 14.07.17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

enum ROLE {
    case admin
    case cooker
    case waiter
    
    func getName() -> String {
        switch self {
        case .waiter:
            return "Официант"
        case .admin:
            return "Администратор"
        case .cooker:
            return "Повар"
        }
    }
    func getVCId() -> String {
        switch self {
        case .waiter:
            return "WaiterVC"
        case .admin:
            return "AdminVC"
        case .cooker:
            return "CookerVC"
        }
    }
    init(name: String) {
        switch name {
        case ROLE.admin.getName():
            self = .admin
        case ROLE.cooker.getName():
            self = .cooker
        case ROLE.waiter.getName():
            self = .waiter
        default:
            self = .admin
        }
        
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var roleOfWorkersTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var incorrectPasswordLbl: UILabel!
    let roleOfWorkers: [ROLE] = [.admin, .cooker, .waiter]
    let pickerView = UIPickerView()
    var role: ROLE?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NSLocalizedString("Вход", comment: "Вход")
        
        pickerView.delegate = self
        roleOfWorkersTF.inputView = pickerView
    }
    @IBAction func showNextVC(_ sender: UIButton) {
        
        if passwordTF.text == "1" {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            role = ROLE(name: roleOfWorkersTF.text!)
            if role != nil {
                let vc = sb.instantiateViewController(withIdentifier: role!.getVCId())
                self.present(vc, animated: true)
            }
        } else {
            incorrectPasswordLbl.isHidden = false
            Animations.shared.incorrectPasswordAnimation(label: incorrectPasswordLbl)
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return roleOfWorkers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return roleOfWorkers[row].getName()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        roleOfWorkersTF.text = roleOfWorkers[row].getName()
        self.view.endEditing(false)
    }
}
