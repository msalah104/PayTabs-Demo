//
//  CheckoutResultViewController.swift
//  PayTabsDemo
//
//  Created by Mohammed Salah on 03/06/2020.
//  Copyright © 2020 MSalah. All rights reserved.
//

import UIKit

class CheckoutResultViewController: UIViewController {

    var code = ""
    var result = ""
    var email = ""
    var pass = ""
    var token = ""
    
    @IBOutlet weak var responseCodeLbl: UILabel!
    @IBOutlet weak var responseResultLbl: UILabel!
    @IBOutlet weak var tknEmailLbl: UILabel!
    @IBOutlet weak var tknPassLbl: UILabel!
    @IBOutlet weak var tokenLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let barButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(CheckoutResultViewController.didPressDone(_:)))
        self.navigationController?.navigationItem.rightBarButtonItem = barButton
        
        responseCodeLbl.text = code
        responseResultLbl.text = result
        tknEmailLbl.text = email
        tknPassLbl.text = pass
        tokenLbl.text = token
    }
    
    @objc @IBAction func didPressDone(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
