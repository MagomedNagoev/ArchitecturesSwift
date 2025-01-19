//
//  MVVMViewModel.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 19/01/25.
//

import SwiftUI
import Combine

class MVVMSviftUIViewModel: ObservableObject {
    private let userService: UserServiceProtocol
    @Published var text: String = "Hello, MVVM + SwiftUI!"
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
        presentGreeting()
    }
    
    func presentGreeting() {
        let person = userService.getUser()
        text = "Hello," + " " + person.firstName + " " + person.lastName + "!"
    }
}


