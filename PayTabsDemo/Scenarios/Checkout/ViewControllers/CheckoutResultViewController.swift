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

    @IBOutlet var responseCodeLbl: UILabel!
    @IBOutlet var responseResultLbl: UILabel!
    @IBOutlet var tknEmailLbl: UILabel!
    @IBOutlet var tknPassLbl: UILabel!
    @IBOutlet var tokenLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let barButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(CheckoutResultViewController.didPressDone(_:)))
        navigationController?.navigationItem.rightBarButtonItem = barButton

        responseCodeLbl.text = code
        responseResultLbl.text = result
        tknEmailLbl.text = email
        tknPassLbl.text = pass
        tokenLbl.text = token
    }

    @IBAction func didPressDone(_: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
