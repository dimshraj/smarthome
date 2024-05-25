//
//  ProfileDetailsView.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 21.05.2024.
//

import UIKit

public class ProfileDetailsViewController: UIViewController, ProfileDetailsViewProtocol {
    public var presenter: ProfileDetailsPresenter!

    private let detailsLabel = UILabel()

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        navigationController?.navigationBar.backgroundColor = .blue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        let sendButton = UIBarButtonItem(title: "dismiss", style: .plain, target: self, action: #selector(didTapDismissButton))
        navigationItem.rightBarButtonItem = sendButton
        
        title = "Profile Details"
        view.backgroundColor = .white

        detailsLabel.text = "Detailed Information"
        detailsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailsLabel)

        NSLayoutConstraint.activate([
            detailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    @objc private func didTapDismissButton() {
        // Handle send button action
        presenter?.dismiss()
    }
}
