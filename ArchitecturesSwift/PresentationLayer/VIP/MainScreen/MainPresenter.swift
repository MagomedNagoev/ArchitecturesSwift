//
//  MainPresenter.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 15/12/24.
//

import UIKit

protocol MainPresenterProtocol {
    func presentListOfScreens(response: Main.OpenScreen.Response)
}

final class MainPresenter {
    weak var view: MainViewProtocol?
}

// MARK: MainPresenterProtocol
extension MainPresenter: MainPresenterProtocol {
    func presentListOfScreens(response: Main.OpenScreen.Response) {
        let viewModel = Main.OpenScreen.ViewModel(screens: response.screens)
        view?.dispayListOfScreens(viewModel: viewModel)
    }
}
