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

    var text: String {
        get {
            return contentTextField.text ?? ""
        }
        set {
            contentTextField.text = newValue
        }
    }

    var titleLabel: UILabel!
    var contentTextField: UITextField!
    var errorLabel: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
        contentView = view
        titleLabel = contentView!.titleLabel
        contentTextField = contentView!.contentTextField
        errorLabel = contentView!.errorLabel
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = titleText
        contentTextField.placeholder = placeHolderText
    }

    func loadViewFromNib() -> InputFieldViewContent? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? InputFieldViewContent
    }

    func updateInputType() {
        switch inputType {
        case .text:
            break
        case .email:
            contentTextField.keyboardType = .emailAddress
        case .phone:
            contentTextField.keyboardType = .phonePad
        case .number:
            contentTextField.keyboardType = .numberPad
        }
    }
}

class InputFieldViewContent: UIView {
    @IBOutlet var tagsView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet var contentTextField: UITextField!
    @IBOutlet var extraInfoImage: UIButton!
}
