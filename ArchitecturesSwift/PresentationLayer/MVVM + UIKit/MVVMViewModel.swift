//
//  MVVMViewModel.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 19/01/25.
//

import Foundation

protocol MVVMViewModelProtocol {
    func presentGreeting(compleation: @escaping (String) -> Void)
    func updateText(currentText: String, compleation: @escaping (String) -> Void)
}

final class MVVMViewModel: MVVMViewModelProtocol {
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func presentGreeting(compleation: @escaping (String) -> Void){
        let person = userService.getUser()
        let greeting = "Hello," + " " + person.firstName + " " + person.lastName + "!"
        
        compleation(greeting)
    }
    
    func updateText(currentText: String, compleation: @escaping (String) -> Void) {
        compleation(currentText + "!")
    }
}
