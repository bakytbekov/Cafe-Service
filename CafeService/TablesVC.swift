//
//  TablesVC.swift
//  CafeService
//
//  Created by ZYFAR on 14.07.17.
//  Copyright © 2017 iCoder. All rights reserved.
//

import UIKit

class TablesVC: UIViewController {
    
    let tableNames = ["1" , "2" , "3" , "4" , "5" , "6" , "7" , "8" , "9" , "10" , "11" , "12" , "13" , "14" , "15" , "16" , "17" , "18" , "19"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension TablesVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TablesCell", for: indexPath) as! TablesCell
        cell.tablesImages.image = UIImage(named: "restaurant")
        cell.tablesNames.text = tableNames[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
