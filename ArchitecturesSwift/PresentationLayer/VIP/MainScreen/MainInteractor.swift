//
//  MainInteractor.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 15/12/24.
//

import Foundation

protocol MainInteractorProtocol {
    func onViewDidLoad()
}

final class MainInteractor {
    // MARK: - Dependencies
    private let presenter: MainPresenterProtocol

    // MARK: - Init
    init(presenter: MainPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: MainInteractorProtocol
extension MainInteractor: MainInteractorProtocol {
    func onViewDidLoad() {
        let screens = Main.OpenScreen.ScreenType.allCases.map { $0 }
        let response = Main.OpenScreen.Response(screens: screens)
        presenter.presentListOfScreens(response: response)
    }
}
