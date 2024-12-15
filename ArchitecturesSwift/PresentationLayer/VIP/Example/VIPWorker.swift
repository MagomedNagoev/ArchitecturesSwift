//
//  VIPWorker.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 15/12/24.
//

import Foundation

protocol VIPWorkerProtocol {
    func getPerson() -> Person
}

final class VIPWorker: VIPWorkerProtocol {
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func getPerson() -> Person {
        return userService.getUser()
    }
}
