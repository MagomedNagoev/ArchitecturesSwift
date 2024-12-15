//
//  VIPViewController.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 15/12/24.
//

import UIKit

protocol VIPViewProtocol: AnyObject {
    func displayGreeting(viewModel: VIP.Greeting.ViewModel)
}

final class VIPViewController: UIViewController {
    // MARK: - Dependencies
    private let interactor: VIPInteractorProtocol
    
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
    init(interactor: VIPInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        interactor.onViewDidLoad()
    }
    
    private func setupView() {
        title = "VIP"
        view.backgroundColor = .white
        
        view.addSubview(label)
        label.center = view.center
    }
}

// MARK: - VIPViewProtocol
extension VIPViewController: VIPViewProtocol {
    func displayGreeting(viewModel: VIP.Greeting.ViewModel) {
        label.text = viewModel.text
    }
}
