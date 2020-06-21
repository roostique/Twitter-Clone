//
//  CaptionTextView.swift
//  Twitter
//
//  Created by Rustem Supayev on 08/05/2020.
//  Copyright © 2020 Rustem Supayev. All rights reserved.
//

import UIKit

class CaptionTextView: UITextView {
    
    let placeholderLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textColor = .darkGray
        lbl.text = "What`s happening?"
        return lbl
    }()
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 16)
        isScrollEnabled = false
        heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 8, paddingLeft: 4)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleHidePlaceholder), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleHidePlaceholder() {
        placeholderLabel.isHidden = !text.isEmpty  // Тоже самое, что и:
        
        //        if text.isEmpty {
        //            placeholderLabel.isHidden = false
        //        } else {
        //            placeholderLabel.isHidden = true
        //        }
        
    }
}
