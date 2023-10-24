//
//  EditingProfileViewController.swift
//  Profile Example
//
//  Created by XE on 23.10.2023.
//

import UIKit

class EditingProfileViewController: UIViewController {
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var surnameTextField: UITextField!
    @IBOutlet private weak var ageSwitchState: UISwitch!
    @IBOutlet private weak var welcomeTextLabel: UILabel!
    
    var nameTFValue: String?
    var surnameTFValue: String?
    private var defaultWelcomeLabel = ""
    
    weak var delegate: EditProfileDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Preferences"
        ageSwitchState.isOn = false
        nameTextField.text = nameTFValue
        surnameTextField.text = surnameTFValue
        welcomeTextLabel.text = defaultWelcomeLabel
    }
    
    @IBAction func applyPressed(_ sender: Any) {
        delegate?.userDidChange(firstname: nameTextField.text ?? "Undefined", lastname: surnameTextField.text ?? "Undefined")
        setWelcomeText()
        hideKeyboard()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        welcomeTextLabel.text = defaultWelcomeLabel
        nameTextField.text = ""
        surnameTextField.text = ""
        delegate?.userDidResetInfo()
        ageSwitchState.isOn = false
        hideKeyboard()
    }
    
    private func setWelcomeText() {
        if ageSwitchState.isOn {
            welcomeTextLabel.text = "Hello, \(nameTextField.text ?? "Undefined") \(surnameTextField.text ?? "Undefined")"
        } else {
            welcomeTextLabel.text = "Hi, \(nameTextField.text ?? "Undefined")"
        }
    }
    
    private func hideKeyboard() {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
