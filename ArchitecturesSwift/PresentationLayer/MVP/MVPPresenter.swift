//
//  MVPPresenter.swift
//  Architectures
//
//  Created by Нагоев Магомед on 15/12/24.
//

import Foundation

protocol MVPPresenterProtocol {
    func presentGreeting()
}

final class MVPPresenter : MVPPresenterProtocol {
    weak var view: MVPViewProtocol?
    private let userService: UserServiceProtocol

    init(view: MVPViewProtocol, userService: UserServiceProtocol) {
        self.view = view
        self.userService = userService
    }
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    func presentGreeting() {
        let person = userService.getUser()
        let greeting = "Hello," + " " + person.firstName + " " + person.lastName + "!"
        view?.displayGreeting(greeting: greeting)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.view?.displayGreeting(greeting: "Hi, Aziz!")
        }
    }
}
