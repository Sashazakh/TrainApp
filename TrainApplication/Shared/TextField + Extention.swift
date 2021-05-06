//
//  TextFieldStyle.swift
//  TrainApplication
//
//  Created by  Alexandr Zakharov on 06.05.2021.
//

import UIKit

extension UITextField {
    func setPlaceholder(data: String) {
        self.textColor = .black
        self.attributedPlaceholder = NSAttributedString(string: data,
                                                        attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
    }
    
}
