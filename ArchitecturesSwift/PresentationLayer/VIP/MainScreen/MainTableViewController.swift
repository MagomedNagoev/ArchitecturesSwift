//
//  MainTableViewController.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 15/12/24.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func dispayListOfScreens(viewModel: Main.OpenScreen.ViewModel)
}

final class MainTableViewController: UITableViewController {
    // MARK: - Dependencies
    private let router: MainRouterProtocol
    private let interactor: MainInteractorProtocol
    
    private var screens: [Main.OpenScreen.ScreenType] = []
    
    // MARK: - Init
    init(
        router: MainRouterProtocol,
        interactor: MainInteractorProtocol
    ) {
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        interactor.onViewDidLoad()
    }
    
    private func setupView() {
        title = "Архитектуры"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return screens.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = screens[indexPath.row]
        
        cell.textLabel?.text = item.rawValue
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let screen = screens[indexPath.row]
        
        router.showScreen(screen: screen)
    }
}

extension MainTableViewController: MainViewProtocol {
    func dispayListOfScreens(viewModel: Main.OpenScreen.ViewModel) {
        screens = viewModel.screens
        tableView.reloadData()
    }
}
