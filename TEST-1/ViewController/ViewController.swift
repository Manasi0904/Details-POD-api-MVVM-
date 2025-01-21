//
//  ViewController.swift
//  TEST-1
//
//  Created by Kumari Mansi on 10/01/25.
//
//
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet var profileLabel: UILabel!
    @IBOutlet var firstView: UIView!
    @IBOutlet var lastView: UIView!
    @IBOutlet var dateOfBirthView: UIView!
    @IBOutlet var anniversarryView: UIView!
    @IBOutlet var genderView: UIView!
    @IBOutlet var emailView: UIView!
    @IBOutlet var mobileView: UIView!
    @IBOutlet var homeView: UIView!
    @IBOutlet var stateView: UIView!
    @IBOutlet var cityView: UIView!
    
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastnameLabel: UILabel!
    @IBOutlet var dateOfBirthLabel: UILabel!
    @IBOutlet var anniversarryLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var emailIDLabel: UILabel!
    @IBOutlet var mobileNumberLabel: UILabel!
    @IBOutlet var homeLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var userDateOfBirthlabel: UILabel!
    @IBOutlet var useranniversarryLabel: UILabel!
    @IBOutlet var usergenderlabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var mobileTextField: UITextField!
    @IBOutlet var homeTextField: UITextField!
    @IBOutlet var userStatelabel: UILabel!
    @IBOutlet var userCitylabel: UILabel!
    @IBOutlet var updateButton: UIButton!
    @IBOutlet var dateOfBirthButton: UIButton!
    @IBOutlet var anniversarryButton: UIButton!
    @IBOutlet var genderButton: UIButton!
    @IBOutlet var stateButton: UIButton!
    @IBOutlet var cityButton: UIButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet var ninghtyLabel: UILabel!
    
    
    let genderPicker = UIPickerView()
    let statePicker = UIPickerView()
    let cityPicker = UIPickerView()
    let datePicker = UIDatePicker()
    let anniversaryPicker = UIDatePicker()
    var activePicker: UIView?
    
    
    let genders = ["Male", "Female"]
    let states = ["Uttar Pradesh", "Meghalaya", "Bihar", "Uttrakhand"]
    let cities = ["Noida", "Greater Noida", "Ghazipur", "Varanasi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPickers()
        setupTapGesture()
        setupTextFieldObservers()
        validateForm()
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        tap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tap)
        
        let center: NotificationCenter = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        firstView.layer.cornerRadius = 8
        firstView.layer.borderWidth = 0.5
        firstView.layer.borderColor = UIColor.platinum.cgColor
        
        lastView.layer.cornerRadius = 8
        lastView.layer.borderWidth = 0.5
        lastView.layer.borderColor = UIColor.platinum.cgColor
        
        
        dateOfBirthView.layer.cornerRadius = 8
        dateOfBirthView.layer.borderWidth = 0.5
        dateOfBirthView.layer.borderColor = UIColor.platinum.cgColor
        
        
        anniversarryView.layer.cornerRadius = 8
        anniversarryView.layer.borderWidth = 0.5
        anniversarryView.layer.borderColor = UIColor.platinum.cgColor
        
        genderView.layer.cornerRadius = 8
        genderView.layer.borderWidth = 0.5
        genderView.layer.borderColor = UIColor.platinum.cgColor
        
        
        emailView.layer.cornerRadius = 8
        emailView.layer.borderWidth = 0.5
        emailView.layer.borderColor = UIColor.platinum.cgColor
        
        
        mobileView.layer.cornerRadius = 8
        mobileView.layer.borderWidth = 0.5
        mobileView.layer.borderColor = UIColor.platinum.cgColor
        
        
        homeView.layer.cornerRadius = 8
        homeView.layer.borderWidth = 0.5
        homeView.layer.borderColor = UIColor.platinum.cgColor
        
        stateView.layer.cornerRadius = 8
        stateView.layer.borderWidth = 0.5
        stateView.layer.borderColor = UIColor.platinum.cgColor
        
        cityView.layer.cornerRadius = 8
        cityView.layer.borderWidth = 0.5
        cityView.layer.borderColor = UIColor.platinum.cgColor
        
       profileLabel.font = UIFont(name:"Circe-Bold", size: 16)
        firstNameLabel.font = UIFont(name:"Circe Regular", size: 12)
        lastnameLabel.font = UIFont(name:"Circe Regular", size: 12)
        dateOfBirthLabel.font = UIFont(name:"Circe Regular", size: 12)
        anniversarryLabel.font = UIFont(name:"Circe Regular", size: 12)
        genderLabel.font = UIFont(name:"Circe Regular", size: 12)
        emailIDLabel.font = UIFont(name:"Circe Regular", size: 12)
        mobileNumberLabel.font = UIFont(name:"Circe Regular", size: 12)
        homeLabel.font = UIFont(name:"Circe Regular", size: 12)
        stateLabel.font = UIFont(name:"Circe Regular", size: 12)
        cityLabel.font = UIFont(name:"Circe Regular", size: 12)
        
        
        firstNameTextField.font = UIFont(name:"Circe Regular", size: 15)
        lastNameTextField.font = UIFont(name:"Circe Regular", size: 15)
        userDateOfBirthlabel.font = UIFont(name:"Circe Regular", size: 15)
        useranniversarryLabel.font = UIFont(name:"Circe Regular", size: 15)
        usergenderlabel.font = UIFont(name:"Circe Regular", size: 15)
        emailTextField.font = UIFont(name:"Circe Regular", size: 15)
        mobileTextField.font = UIFont(name:"Circe Regular", size: 15)
        ninghtyLabel.font = UIFont(name:"Circe Regular", size: 15)
        homeTextField.font = UIFont(name:"Circe Regular", size: 15)
        userStatelabel.font = UIFont(name:"Circe Regular", size: 15)
        userCitylabel.font = UIFont(name:"Circe Regular", size: 15)
        updateButton?.titleLabel?.font = UIFont(name: "Circe Regular", size: 14)
        updateButton.layer.cornerRadius = 5
        mainView.layer.cornerRadius = 14
        mainView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        
        
        
    }
    
    func setupPickers() {
        genderPicker.delegate = self
        genderPicker.dataSource = self
        statePicker.delegate = self
        statePicker.dataSource = self
        cityPicker.delegate = self
        cityPicker.dataSource = self
        emailTextField.delegate = self
        mobileTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        
        anniversaryPicker.datePickerMode = .date
        anniversaryPicker.maximumDate = Date()
        anniversaryPicker.addTarget(self, action: #selector(handleAnniversaryPicker(_:)), for: .valueChanged)
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissPicker))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func keyboardShown(notification: Notification) {
      //  KeyboardConstraints.constant = 250
        view.layoutIfNeeded()
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.view.endEditing(true)
    }
    @objc func keyboardHidden(notification: Notification) {
       // KeyboardConstraints.constant = 0
    }
    
    
    func setupTextFieldObservers() {
        firstNameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        lastNameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        mobileTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        homeTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
      

    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        validateForm()
    }
    @objc func dismissPicker() {
        activePicker?.removeFromSuperview()
      
        validateForm()
    }
    
    func showPicker(picker: UIView, forLabel label: UILabel) {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        toolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        
        toolbar.setItems([doneButton, flexSpace], animated: false)
        
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.backgroundColor = .white
        
        view.addSubview(toolbar)
        view.addSubview(picker)
        
        
        NSLayoutConstraint.activate([
            picker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            picker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            picker.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            picker.heightAnchor.constraint(equalToConstant: 200),
            
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolbar.bottomAnchor.constraint(equalTo: picker.topAnchor)
        ])
        
        activePicker = picker
      
    }
    
    @objc func doneButtonTapped() {
        
        if let picker = activePicker {
            
            switch picker {
            case genderPicker:
                print("genders.count")
                let selectedIndex = genderPicker.selectedRow(inComponent: 0)
                usergenderlabel.text = genders[selectedIndex]
                
            case statePicker:
                print("statePicker.count")
                let selectedIndex = statePicker.selectedRow(inComponent: 0)
                userStatelabel.text = states[selectedIndex]
            case cityPicker:
                print("cityPicker.count")
                let selectedIndex = cityPicker.selectedRow(inComponent: 0)
                userCitylabel.text = cities[selectedIndex]
                
            default:
                print("default.count")
            }
            
            
            validateForm()
            picker.removeFromSuperview()
            activePicker = nil
       
        }
    }
    
    
    @objc func handleDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.dateStyle = .medium
        userDateOfBirthlabel.text = formatter.string(from: sender.date)
        sender.removeFromSuperview()
        validateForm()
    }
    
    @objc func handleAnniversaryPicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        formatter.dateStyle = .medium
        useranniversarryLabel.text = formatter.string(from: sender.date)
        sender.removeFromSuperview()
        validateForm()
    }
    
    func validateForm() {
        let isFirstNameValid = validateName(firstNameTextField.text)
        let isLastNameValid = validateName(lastNameTextField.text)
        let isEmailValid = validateEmail(emailTextField.text)
        let isMobileValid = validateMobile(mobileTextField.text)
        let isAddressValid = validateAddress(homeTextField.text)
        
        let isFormValid = isFirstNameValid && isLastNameValid && isEmailValid && isMobileValid && isAddressValid &&
        !(userDateOfBirthlabel.text?.isEmpty ?? true) &&
        !(useranniversarryLabel.text?.isEmpty ?? true) &&
        !(userStatelabel.text?.isEmpty ?? true) &&
        !(userCitylabel.text?.isEmpty ?? true) &&
        !(usergenderlabel.text?.isEmpty ?? true)
        
        updateButton.isEnabled = isFormValid
        updateButton.alpha = isFormValid ? 1.0 : 0.5
    }
    
    func validateName(_ name: String?) -> Bool {
        guard let name = name, !name.isEmpty else { return false }
        let regex = "^[a-zA-Z]{2,40}$"
        
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: name)
    }
    
    func validateEmail(_ email: String?) -> Bool {
        guard let email = email, !email.isEmpty else { return false }
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: email)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            guard let email = textField.text, validateEmail(email) else {
                showAlert(title: "Invalid Email", message: "Please enter a valid email address.")
                return
            }
        }
    }

    
    
    func validateMobile(_ mobile: String?) -> Bool {
        guard let mobile = mobile, !mobile.isEmpty else { return false }
        _ = mobile.count == 10 && mobile.allSatisfy { $0.isNumber }
        return true
    }
    func validateAddress(_ address: String?) -> Bool {
        guard let address = address, !address.isEmpty else { return false }
        
        if address.count > 75 {
            showAlert(title: "Invalid Address", message: "Address cannot be more than 75 characters.")
            return false
        }
        
        return true
    }

    
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == mobileTextField {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            if !allowedCharacters.isSuperset(of: characterSet) {
                showAlert(title: "Invalid Input", message: "Mobile Number contains only number.")
                return false
            }
            
            let currentText = textField.text ?? ""
            let updatedText = (currentText as NSString).replacingCharacters(in: range, with: string)
            return updatedText.count <= 10
        } else if textField == firstNameTextField {
            let allowedCharacters = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ")
            let characterSet = CharacterSet(charactersIn: string)
            if !allowedCharacters.isSuperset(of: characterSet) {
                showAlert(title: "Invalid Input", message: "Name cannot contain numbers.")
                return false
            }
            
            let updatedText = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
            return updatedText.count <= 40
        }
        else if textField == lastNameTextField {
            let allowedCharacters = CharacterSet(charactersIn: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ")
            let characterSet = CharacterSet(charactersIn: string)
            if !allowedCharacters.isSuperset(of: characterSet) {
                showAlert(title: "Invalid Input", message: "Name cannot contain numbers.")
                return false
            }
            
            let updatedText = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
            return updatedText.count <= 40
        }
        return true
    }
    
    
    @IBAction func genderPickerButton(_ sender: Any) {
        showPicker(picker: genderPicker, forLabel: usergenderlabel)
    }
    
    @IBAction func statePickerButton(_ sender: Any) {
        showPicker(picker: statePicker, forLabel: userStatelabel)
    }
    
    @IBAction func cityPickerbutton(_ sender: Any) {
        showPicker(picker: cityPicker, forLabel: userCitylabel)
    }
    
    @IBAction func dateOfBirthButton(_ sender: Any) {
        showPicker(picker: datePicker, forLabel: userDateOfBirthlabel)
    }
    
    @IBAction func anniversarryButtontapped(_ sender: Any) {
        showPicker(picker: anniversaryPicker, forLabel: useranniversarryLabel)
    }
    
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case genderPicker: return genders.count
        case statePicker: return states.count
        case cityPicker: return cities.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case genderPicker: return genders[row]
        case statePicker: return states[row]
        case cityPicker: return cities[row]
        default: return nil
        }
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        
     
        
        let isFirstNameValid = validateName(firstNameTextField.text)
        let isLastNameValid = validateName(lastNameTextField.text)
        let isEmailValid = validateEmail(emailTextField.text)
        let isMobileValid = validateMobile(mobileTextField.text)
        let isAddressValid = validateAddress(homeTextField.text)
        
        
        if isFirstNameValid && isLastNameValid && isEmailValid && isMobileValid && isAddressValid &&
            !(userDateOfBirthlabel.text?.isEmpty ?? true) &&
            !(useranniversarryLabel.text?.isEmpty ?? true) &&
            !(userStatelabel.text?.isEmpty ?? true) &&
            !(userCitylabel.text?.isEmpty ?? true) &&
            !(usergenderlabel.text?.isEmpty ?? true) {
            
            
            let firstName = firstNameTextField.text ?? ""
            let lastName = lastNameTextField.text ?? ""
            let email = emailTextField.text ?? ""
            let mobileNo = mobileTextField.text ?? ""
            let address = homeTextField.text ?? ""
            let dateOfBirth = userDateOfBirthlabel.text ?? ""
            let gender = usergenderlabel.text ?? ""
            let state = userStatelabel.text ?? ""
            let city = userCitylabel.text ?? ""
            
            
            let viewModel = ViewModel()
            viewModel.updateUserProfile(firstName: firstName, lastName: lastName, email: email, mobileNo: mobileNo, address: address, dateOfBirth: dateOfBirth, gender: gender, state: state, city: city) { result in
                switch result {
                case .success(let response):
                    print(response.message)
                    self.showAlert(title: "Success", message: response.message)
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    self.showAlert(title: "Error", message: error.localizedDescription)
                }
            }
        } else {
            showAlert(title: "Invalid Input", message: "Please fill in all required fields correctly.")
        }
    }
}





