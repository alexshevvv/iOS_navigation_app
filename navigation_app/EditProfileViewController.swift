//
//  EditProfileViewController.swift
//  navigation_app
//
//  Created by Алексей  Шевченко on 19.09.2024.
//

import Foundation
import UIKit

class EditProfileViewController: UIViewController {
    
    var userProfile: UserProfile!
    var onSave: ((UserProfile) -> Void)?
    
    let firstNameField = UITextField()
    let lastNameField = UITextField()
    let middleNameField = UITextField()
    let birthDateField = UITextField()
    let professionField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        populateFields()
    }
    
    func setupUI() {
        setupTextField(firstNameField, placeholder: "Имя", topAnchor: view.safeAreaLayoutGuide.topAnchor)
        setupTextField(lastNameField, placeholder: "Фамилия", topAnchor: firstNameField.bottomAnchor)
        setupTextField(middleNameField, placeholder: "Отчество", topAnchor: lastNameField.bottomAnchor)
        setupTextField(birthDateField, placeholder: "Дата рождения", topAnchor: middleNameField.bottomAnchor)
        setupTextField(professionField, placeholder: "Профессия", topAnchor: birthDateField.bottomAnchor)
        
        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.backgroundColor = .blue
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: professionField.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 50),
            saveButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupTextField(_ textField: UITextField, placeholder: String, topAnchor: NSLayoutYAxisAnchor) {
        textField.placeholder = placeholder
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func populateFields() {
        firstNameField.text = userProfile.firstName
        lastNameField.text = userProfile.lastName
        middleNameField.text = userProfile.middleName
        birthDateField.text = userProfile.birthDate
        professionField.text = userProfile.profession
    }
    
    @objc func saveButtonTapped() {
        let updatedProfile = UserProfile(
            firstName: firstNameField.text ?? "",
            lastName: lastNameField.text ?? "",
            middleName: middleNameField.text ?? "",
            birthDate: birthDateField.text ?? "",
            profession: professionField.text ?? ""
        )
        onSave?(updatedProfile)
        navigationController?.popViewController(animated: true)
    }
}
