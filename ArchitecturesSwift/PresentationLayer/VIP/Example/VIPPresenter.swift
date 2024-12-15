//
//  VIPPresenter.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 15/12/24.
//

import UIKit

protocol VIPPresenterProtocol {
    func presentGreeting(response: VIP.Greeting.Response)
}

final class VIPPresenter {
    weak var view: VIPViewProtocol?
}

// MARK: VIPPresenterProtocol
extension VIPPresenter: VIPPresenterProtocol {
    func presentGreeting(response: VIP.Greeting.Response) {
        let greeting = "Hello," + " " + response.person.firstName + " " + response.person.lastName + "!"

        let viewModel = VIP.Greeting.ViewModel(text: greeting)
        view?.displayGreeting(viewModel: viewModel)
    }
}
