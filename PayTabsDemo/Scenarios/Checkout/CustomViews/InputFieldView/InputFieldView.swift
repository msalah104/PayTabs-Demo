//
//  InputFieldView.swift
//  PayTabsDemo
//
//  Created by Mohammed Salah on 02/06/2020.
//  Copyright © 2020 MSalah. All rights reserved.
//


import UIKit

enum InputType {
    case text
    case email
    case phone
    case number
}


class InputFieldView: UIView {

    let nibName = "InputFieldView"
    var contentView: InputFieldViewContent?
    var inputType: InputType = .text {
        didSet {
            updateInputType()
        }
    }
    
    @IBInspectable
    var titleText: String = ""
    
    @IBInspectable
    var placeHolderText: String = ""
    
    var text: String  {
        get {
            return contentTextField.text ?? ""
        }
        set {
            contentTextField.text = newValue
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        self.titleLabel = contentView!.titleLabel
        self.contentTextField = contentView!.contentTextField
        self.errorLabel = contentView!.errorLabel
    }
    
   override func awakeFromNib() {
       super.awakeFromNib()
       self.titleLabel.text = titleText
       self.contentTextField.placeholder = placeHolderText
       
   }

    func loadViewFromNib() -> InputFieldViewContent? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? InputFieldViewContent
    }
    
    func updateInputType()  {
        switch inputType {
        case .text:
            break
        case .email:
            contentTextField.keyboardType = .emailAddress
            break
        case .phone:
            contentTextField.keyboardType = .phonePad
            break
        case .number:
            contentTextField.keyboardType = .numberPad
            break
        }
    }
   

}

class InputFieldViewContent: UIView {
    
    @IBOutlet weak var tagsView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var extraInfoImage: UIButton!
}
