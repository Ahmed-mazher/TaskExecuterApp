//
//  UIViewController + Ext.swift
//  TaskExecuterApp
//
//  Created by Ahmed Mazher on 17/06/2022.
//

import UIKit

extension UIViewController{
    
    func clearButtonsSelectedSate(unselectBtns: [UIButton]){
        unselectBtns.forEach {
               $0.isSelected = false
               $0.setTitleColor(.black, for: .normal)
               $0.backgroundColor = .white
        }
    }
    
    
    func getCurrentDateAndTime()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let time = dateFormatter.string(from: Date())
        return time
    }
    
}
