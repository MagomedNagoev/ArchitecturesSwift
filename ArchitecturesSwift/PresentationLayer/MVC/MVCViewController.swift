//
//  MVCViewController.swift
//  Architectures
//
//  Created by Нагоев Магомед on 15/12/24.
//

import UIKit

// View + Controller
final class MVCViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel(
            frame: .init(
                x: 0,
                y: 0,
                width: view.frame.width,
                height: 50
            )
        )
        label.textAlignment = .center
        return label
    }()
    
    private let userService: UserServiceProtocol

    init(userService: UserServiceProtocol) {
        self.userService = userService
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        displayGreeting()
    }
    
    private func setupView() {
        title = "MVC"
        view.backgroundColor = .white
        
        view.addSubview(label)
        label.center = view.center
    }

    private func displayGreeting() {
        let person = userService.getUser()
        let greeting = "Hello" + " " + person.firstName + " " + person.lastName
        label.text = greeting
    }
}
