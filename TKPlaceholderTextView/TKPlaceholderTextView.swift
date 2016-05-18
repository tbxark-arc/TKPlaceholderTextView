//
//  TKPlaceholderTextView.swift
//  TKPlaceholderTextView
//
//  Created by Tbxark on 16/5/18.
//  Copyright © 2016年 TBXark. All rights reserved.
//

import UIKit

class TKPlaceholderTextView: UITextView {
    let placeholderLabel: UILabel = UILabel()
    
    var placeholder: String = "" {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    
    var placeholderColor: UIColor = UIColor.lightGrayColor() {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }
    
    override  var font: UIFont! {
        didSet {
            placeholderLabel.font = font
        }
    }
    
    override  var textAlignment: NSTextAlignment {
        didSet {
            placeholderLabel.textAlignment = textAlignment
        }
    }
    
    override  var text: String! {
        didSet {
            textDidChange()
        }
    }
    
    override  var attributedText: NSAttributedString! {
        didSet {
            textDidChange()
        }
    }
    
    override  var textContainerInset: UIEdgeInsets {
        didSet {
            updateConstraintsForPlaceholderLabel()
        }
    }
    
    
    init() {
        super.init(frame: CGRectZero, textContainer: nil)
        shareInit()
    }
    
    override  init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        shareInit()
    }
    
    required  init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        shareInit()
    }
    
    private func shareInit() {
        NSNotificationCenter.defaultCenter().addObserver(self,
                                                         selector: #selector(TKPlaceholderTextView.textDidChange),
                                                         name: UITextViewTextDidChangeNotification,
                                                         object: nil)
        
        placeholderLabel.font = font
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.textAlignment = textAlignment
        placeholderLabel.text = placeholder
        placeholderLabel.numberOfLines = 0
        placeholderLabel.backgroundColor = UIColor.clearColor()
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeholderLabel)
        updateConstraintsForPlaceholderLabel()
    }
    
    private func updateConstraintsForPlaceholderLabel() {
        let t = textContainerInset.top
        let b = textContainerInset.bottom
        let l = textContainerInset.left
        let r = textContainerInset.right
        
        removeConstraints(constraints)
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-\(l)-[view]-\(r)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": placeholderLabel]));
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-\(t)-[view]-\(b)-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["view": placeholderLabel]));
    }
    
    @objc private func textDidChange() {
        placeholderLabel.hidden = !text.isEmpty
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        placeholderLabel.preferredMaxLayoutWidth = textContainer.size.width - textContainer.lineFragmentPadding * 2.0
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self,
                                                            name: UITextViewTextDidChangeNotification,
                                                            object: nil)
    }

}
