//
//  MVVMViewModel.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 19/01/25.
//

import Foundation

protocol MVVMViewModelProtocol {
    func transform(input: MVVMViewModel.Input) -> MVVMViewModel.Output
}

final class MVVMViewModel {
    private let userService: UserServiceProtocol

    init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    func fetchText() -> String {
        let person = userService.getUser()
        let greeting = "Hello," + " " + person.firstName + " " + person.lastName + "!"
        
        return greeting
    }
}

extension MVVMViewModel: MVVMViewModelProtocol {
    struct Input { }

    struct Output {
        let greetingText: String
    }
    
    func transform(input: Input) -> Output {
        return Output(greetingText: fetchText())
    }
}
