//
//  UIButton + Ext.swift
//  TaskExecuterApp
//
//  Created by Ahmed Mazher on 17/06/2022.
//

import UIKit

extension UIButton{
    
    func selectedBtn(){
        self.isSelected = true
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .black
    }
    
}
