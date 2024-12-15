//
//  VIPInteractor.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 15/12/24.
//

import Foundation

protocol VIPInteractorProtocol {
    func onViewDidLoad()
}

final class VIPInteractor {
    // MARK: - Dependencies
    private let worker: VIPWorkerProtocol
    private let presenter: VIPPresenterProtocol

    // MARK: - Init
    init(
        worker: VIPWorkerProtocol,
        presenter: VIPPresenterProtocol
    ) {
        self.worker = worker
        self.presenter = presenter
    }
}

// MARK: VIPInteractorProtocol
extension VIPInteractor: VIPInteractorProtocol {
    func onViewDidLoad() {
        let person = worker.getPerson()

        let response = VIP.Greeting.Response(person: person)
        presenter.presentSomething(response: response)
    }
}
