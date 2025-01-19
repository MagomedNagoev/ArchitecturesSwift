//
//  MVVMView.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 19/01/25.
//

import UIKit

final class MVVMViewController: UIViewController {
    private var viewModel: MVVMViewModelProtocol

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
    init(viewModel: MVVMViewModelProtocol) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        let output = viewModel.transform(input: .init())
        label.text = output.greetingText
    }
    
    private func setupView() {
        title = "MVVM + UIKit"
        view.backgroundColor = .white
        
        view.addSubview(label)
        label.center = view.center
    }
}
