//
//  MainModels.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 15/12/24.
//

import UIKit

enum Main {
    // MARK: Use cases
    enum OpenScreen {
        enum ScreenType: String, CaseIterable {
            case mvc
            case mvp
            case vip
        }
        
        struct Request { }
        struct Response {
            let screens: [ScreenType]
        }
        struct ViewModel {
            let screens: [ScreenType]
        }
    }
}
