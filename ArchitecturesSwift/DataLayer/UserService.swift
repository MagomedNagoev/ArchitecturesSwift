//
//  UserService.swift
//  Architectures
//
//  Created by Нагоев Магомед on 15/12/24.
//

import Foundation

protocol UserServiceProtocol {
    func getUser() -> Person
}

final class UserServiceStub: UserServiceProtocol {
    func getUser() -> Person {
        return .init(firstName: "Magomed", lastName: "Nagoev")
    }
}
