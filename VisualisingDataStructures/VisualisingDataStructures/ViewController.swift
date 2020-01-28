//
//  ViewController.swift
//  VisualisingDataStructures
//
//  Created by Barnham, Samuel (ABH) on 28/01/2020.
//  Copyright © 2020 Barnham, Samuel (ABH). All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var item1: UILabel!
    
    @IBOutlet var item2: UILabel!
    
    @IBOutlet var item3: UILabel!
    
    @IBOutlet var item4: UILabel!
    
    @IBOutlet var item5: UILabel!
    
    @IBOutlet var item6: UILabel!
    
    @IBOutlet var item7: UILabel!
    
    @IBOutlet var item8: UILabel!
    
    @IBOutlet var item9: UILabel!
    
    @IBOutlet var item10: UILabel!
    
    
    let stack = Stack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hide()
    }
    
    @IBAction func pushButton(_ sender: Any) {
        let pushAlert = UIAlertController(title: "Enter item", message: nil, preferredStyle: .actionSheet)
        pushAlert.addTextField()
        let pushAction = UIAlertAction(title: "Push", style: .cancel, handler: {(action:UIAlertAction!) in
            stack.push(item: pushAlert.textFields![0])
            })
    }
    


    func hide() {
        item1.isHidden = true
        item2.isHidden = true
        item3.isHidden = true
        item4.isHidden = true
        item5.isHidden = true
        item6.isHidden = true
        item7.isHidden = true
        item8.isHidden = true
        item9.isHidden = true
        item10.isHidden = true
    }
}

