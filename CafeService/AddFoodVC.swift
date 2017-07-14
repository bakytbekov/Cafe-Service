//
//  AddFoodVC.swift
//  F
//
//  Created by ZYFAR on 13.07.17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class AddFoodVC: UIViewController {

    @IBOutlet weak var kindOfFoodTF: UITextField!
    let pickerView = UIPickerView()
    var kindOfFood = ["Кухня" , "Бар" , "Кальян"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        kindOfFoodTF.inputView = pickerView
    }
}

extension AddFoodVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return kindOfFood.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return kindOfFood[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        kindOfFoodTF.text = kindOfFood[row]
        self.view.endEditing(false)
    }
}
