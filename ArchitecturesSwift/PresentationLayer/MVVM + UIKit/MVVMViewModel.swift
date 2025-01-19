//
//  MVVMViewModel.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 19/01/25.
//

import Foundation

protocol MVVMViewModelProtocol {
    var bindGreetingToController : ((String) -> ()) { get set }
    func updateGreeting()
    func onViewDidLoad()
}

final class MVVMViewModel {
    private let userService: UserServiceProtocol
    private var text: String = "" {
        didSet {
            self.bindGreetingToController(text)
        }
    }
    
    var bindGreetingToController : ((String) -> ()) = { _ in }
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    private func presentGreeting() {
        let person = userService.getUser()
        let greeting = "Hello," + " " + person.firstName + " " + person.lastName + "!"
        
        text = greeting
    }
}

extension MVVMViewModel: MVVMViewModelProtocol {
    func updateGreeting() {
        text += "!"
    }
    
    func onViewDidLoad() {
        presentGreeting()
    }
}
