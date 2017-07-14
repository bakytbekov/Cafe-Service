//
//  CartManager.swift
//  CafeService
//
//  Created by Niko on 7/5/17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import Foundation

class CartManager {
    static let shared = CartManager()
    private var dishes: [String] = []
    private var bar: [String] = []
    private var hookah: [String] = []
    
    func addDish(name: String) {
        dishes.append(name)
    }
    
    func removeDish(id: Int){
        dishes.remove(at: id)
    }
    
    func getAllDishes() -> [String] {
        return dishes
    }
    
    func addBar(name: String) {
        bar.append(name)
    }
    
    func getAllBar() -> [String] {
        return bar
    }
    
    func removeBar(id: Int) {
        bar.remove(at: id)
    }
    
    func addHookah(name: String) {
        hookah.append(name)
    }
    
    func getAllHookah() -> [String] {
        return hookah
    }
    
    func removeHookah(id: Int) {
        hookah.remove(at: id)
    }

}
