//
//  MVVMViewModel.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 19/01/25.
//

import Foundation

protocol MVVMViewModelProtocol {
    func presentGreeting(completion: (String) -> Void)
    func updateText(currentText: String, completion: (String) -> Void)
}

final class MVVMViewModel: MVVMViewModelProtocol {
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func presentGreeting(completion: (String) -> Void) {
        let person = userService.getUser()
        let greeting = "Hello," + " " + person.firstName + " " + person.lastName + "!"
        
        completion(greeting)
    }
    
    func updateText(currentText: String, completion: (String) -> Void) {
        completion(currentText + "!")
    }
}
