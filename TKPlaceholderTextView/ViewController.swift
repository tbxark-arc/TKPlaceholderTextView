//
//  ViewController.swift
//  TKPlaceholderTextView
//
//  Created by Tbxark on 16/5/18.
//  Copyright © 2016年 TBXark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = TKPlaceholderTextView()
        textView.placeholder = "Hello \nTKPlaceholderTextView"
        textView.frame = view.bounds.insetBy(dx: 100, dy: 100)
        view.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

