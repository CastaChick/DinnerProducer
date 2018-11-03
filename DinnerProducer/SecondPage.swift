//
//  FirstPage.swift
//  DinnerProducer
//
//  Created by Taichi Kasai on 2018/10/19.
//  Copyright © 2018 Taichi Kasai. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var sugestionLabel: UILabel!
   
    var sugestionText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sugestionLabel.text = sugestionText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }    
}
