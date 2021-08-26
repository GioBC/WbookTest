//
//  ViewController.swift
//  WBooks
//
//  Created by Yermis Beltran on 17/08/21.
//

import UIKit
import PKHUD

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var addAgeTextField: UITextField!
    @IBOutlet weak var acceptTermsButton: UIButton!
    
    var pickerView = UIPickerView()
    let manager: LoginManager = LoginManager()
    
    var isCheck: Bool = false
    var age: [String] = []
    let imageAcceptOn = UIImage(named: Constants.tabBarIconName.imageAcceptOn)
    let imageAcceptOff = UIImage(named: Constants.tabBarIconName.imageAcceptOff)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        fillAges()
        pickerView.delegate = self
        pickerView.dataSource = self
        addAgeTextField.inputView = pickerView
    }

    @IBAction func showHomeView(_ sender: Any) {
       
        validateLogin()
        
        let tabBarViewController = TabBarViewController()
        navigationController?.pushViewController(tabBarViewController, animated: true)
    }
    
    func validateLogin() {
        let areNamesValid = manager.validateName(name: nameTextField.text ?? "") &&
            manager.validateName(name: lastNameTextField.text ?? "")
        if !areNamesValid {
            showError(msg: Constants.Message.errorPersonalData)
        }
        
        let isValidName = manager.validateEmail(emailTextField.text ?? "")
        if !isValidName {
            showError(msg: Constants.Message.errorEmail)
        }
        
        if let age = addAgeTextField.text, age.isEmpty {
            showError(msg: Constants.Message.errorAge)
        }
        
        if !isCheck {
            showError(msg: Constants.Message.errorTerm)
        }
        HUD.hide()
    }
    
    func showError(msg: String) {
        
        let alertController = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    
    func fillAges() {
        for item in 8...90 {
            age.append("\(item)")
        }
    }
    
    @IBAction func acceptTerms(_ sender: Any) {
        isCheck.toggle()
        setBackButton(view: acceptTermsButton,
                      imageOn: imageAcceptOn,
                      imageOff: imageAcceptOff, onOffStatus: isCheck)
    }
    
    func setBackButton(view: UIButton, imageOn: UIImage?, imageOff: UIImage?, onOffStatus: Bool) {
        onOffStatus ? view.setImage(imageOn, for: .normal) : view.setImage(imageOff, for: .normal)
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return age[row]
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return age.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addAgeTextField.text = age[row]
        addAgeTextField.resignFirstResponder()
    }
}

