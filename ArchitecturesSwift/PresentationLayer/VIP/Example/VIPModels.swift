//
//  VIPModels.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 15/12/24.
//

import UIKit

enum VIP {
    // MARK: Use cases
    enum Greeting {
        struct Request { }
        struct Response {
            let person: Person
        }
        struct ViewModel {
            let text: String
        }
    }
}
