//
//  SplashScreenView.swift
//  smarthome
//
//  Created by Dmitriy Shrayber on 22.05.2024.
//

import UIKit

class SplashScreenViewController: UIViewController, SplashScreenViewProtocol {
    var presenter: SplashScreenPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let label = UILabel()
        label.text = "Loading..."
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.presenter.appCheckin()
        }
    }

}
