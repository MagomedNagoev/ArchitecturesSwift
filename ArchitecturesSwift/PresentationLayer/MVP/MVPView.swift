//
//  MVPViewController.swift
//  Architectures
//
//  Created by Нагоев Магомед on 15/12/24.
//

import UIKit

protocol MVPViewProtocol: AnyObject {
    func displayGreeting(greeting: String)
}

final class MVPViewController: UIViewController {
    private var presenter: MVPPresenterProtocol

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
    
    // MARK: - Init
    init(presenter: MVPPresenterProtocol) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        presenter.presentGreeting()
    }
    
    private func setupView() {
        title = "MVP"
        view.backgroundColor = .white
        
        view.addSubview(label)
        label.center = view.center
    }
}

extension MVPViewController: MVPViewProtocol {
    func displayGreeting(greeting: String) {
        label.text = greeting
    }
}
