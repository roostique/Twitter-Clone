//
//  Utilities.swift
//  Twitter
//
//  Created by Rustem Supayev on 06/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class Utilities {
    
    func inputContainerView(withImage image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        let iv = UIImageView()
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true

        iv.image = image
        view.addSubview(iv)
        iv.anchor(left: view.leftAnchor, bottom: view.bottomAnchor,
                  paddingLeft: 8, paddingBottom: 8)
        iv.setDimensions(width: 24, height: 24)
        
        view.addSubview(textField)
        textField.anchor(left: iv.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,
                         paddingLeft: 8, paddingBottom: 8)
        
        let separatorView = UIView()
        separatorView.backgroundColor = .white
        view.addSubview(separatorView)
        separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,
                             paddingLeft: 8, height: 0.8)
        
        return view
    }
    
    func textField(withPlaceholder placeholder: String) -> UITextField {
        let txt = UITextField()
        txt.textColor = .white
        txt.font = UIFont.systemFont(ofSize: 16)
        txt.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return txt
    }
    
    func attributedButton(_ firstPart: String, _ secondPart: String) -> UIButton {
        let btn = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: firstPart, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: secondPart, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        
        btn.setAttributedTitle(attributedTitle, for: .normal)
        
        return btn
    }
}
