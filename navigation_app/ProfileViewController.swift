//
//  ProfileViewController.swift
//  navigation_app
//
//  Created by Алексей  Шевченко on 19.09.2024.
//

import Foundation
import UIKit

struct UserProfile {
    var firstName: String
    var lastName: String
    var middleName: String
    var birthDate: String
    var profession: String
}

class ProfileViewController: UIViewController {
    
    var userProfile = UserProfile(firstName: "Иван", lastName: "Иванов", middleName: "Иванович", birthDate: "01.01.1990", profession: "Инженер")
    
    let firstNameLabel = UILabel()
    let lastNameLabel = UILabel()
    let middleNameLabel = UILabel()
    let birthDateLabel = UILabel()
    let professionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        setupLabel(label: firstNameLabel, text: "Имя: \(userProfile.firstName)", topAnchor: view.safeAreaLayoutGuide.topAnchor)
        setupLabel(label: lastNameLabel, text: "Фамилия: \(userProfile.lastName)", topAnchor: firstNameLabel.bottomAnchor)
        setupLabel(label: middleNameLabel, text: "Отчество: \(userProfile.middleName)", topAnchor: lastNameLabel.bottomAnchor)
        setupLabel(label: birthDateLabel, text: "Дата рождения: \(userProfile.birthDate)", topAnchor: middleNameLabel.bottomAnchor)
        setupLabel(label: professionLabel, text: "Профессия: \(userProfile.profession)", topAnchor: birthDateLabel.bottomAnchor)
        
        let editButton = UIButton(type: .system)
        editButton.setTitle("Изменить данные", for: .normal)
        editButton.backgroundColor = .blue
        editButton.setTitleColor(.white, for: .normal)
        editButton.layer.cornerRadius = 10
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        
        view.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            editButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editButton.heightAnchor.constraint(equalToConstant: 50),
            editButton.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func setupLabel(label: UILabel, text: String, topAnchor: NSLayoutYAxisAnchor) {
        label.text = text
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func editButtonTapped() {
        let editVC = EditProfileViewController()
        editVC.userProfile = userProfile
        editVC.onSave = { updatedProfile in
            self.userProfile = updatedProfile
            self.updateProfileInfo()
        }
        navigationController?.pushViewController(editVC, animated: true)
    }
    
    func updateProfileInfo() {
        firstNameLabel.text = "Имя: \(userProfile.firstName)"
        lastNameLabel.text = "Фамилия: \(userProfile.lastName)"
        middleNameLabel.text = "Отчество: \(userProfile.middleName)"
        birthDateLabel.text = "Дата рождения: \(userProfile.birthDate)"
        professionLabel.text = "Профессия: \(userProfile.profession)"
    }
}
