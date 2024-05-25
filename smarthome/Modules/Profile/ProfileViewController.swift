//
//  ProfileViewController.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import UIKit

import UIKit

public class ProfileViewController: UIViewController, ProfileViewProtocol {
    public var presenter: ProfilePresenterProtocol?

    private let nameLabel = UILabel()
    private let bioLabel = UILabel()
    private let logoutButton = UIButton()
    private let detailsButton = UIButton()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        presenter?.viewDidLoad()
    }

    private func setupNavigationBar() {
        title = "Profile"
        navigationController?.navigationBar.backgroundColor = .red
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        let sendButton = UIBarButtonItem(title: "Send", style: .plain, target: self, action: #selector(didTapSendButton))
        navigationItem.rightBarButtonItem = sendButton
    }

    private func setupView() {
        view.backgroundColor = .white

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        detailsButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(nameLabel)
        view.addSubview(bioLabel)
        view.addSubview(logoutButton)
        view.addSubview(detailsButton)

        nameLabel.text = "Name"
        bioLabel.text = "Bio"

        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = .systemRed
        logoutButton.layer.cornerRadius = 8
        logoutButton.addTarget(self, action: #selector(didTapLogoutButton), for: .touchUpInside)

        detailsButton.setTitle("Details", for: .normal)
        detailsButton.backgroundColor = .systemBlue
        detailsButton.layer.cornerRadius = 8
        detailsButton.addTarget(self, action: #selector(didTapDetailsButton), for: .touchUpInside)

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            bioLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            logoutButton.topAnchor.constraint(equalTo: bioLabel.bottomAnchor, constant: 20),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 200),
            logoutButton.heightAnchor.constraint(equalToConstant: 44),

            detailsButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 20),
            detailsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsButton.widthAnchor.constraint(equalToConstant: 200),
            detailsButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    @objc private func didTapLogoutButton() {
        presenter?.logout()
    }

    @objc private func didTapSendButton() {
        // Handle send button action
        print("Send button tapped")
    }

    @objc private func didTapDetailsButton() {
        presenter?.showProfileDetails()
    }

    public func displayUserProfile(_ profile: UserProfile) {
        nameLabel.text = profile.name
        bioLabel.text = profile.bio
    }

    public func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
