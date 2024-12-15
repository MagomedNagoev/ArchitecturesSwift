//
//  MainRouter.swift
//  ArchitecturesSwift
//
//  Created by Нагоев Магомед on 15/12/24.
//

import UIKit

protocol MainRouterProtocol {
    func showScreen(screen: Main.OpenScreen.ScreenType)
}

final class MainRouter: MainRouterProtocol {
    weak var source: MainTableViewController?
    
    func showScreen(screen: Main.OpenScreen.ScreenType) {
        switch screen {
        case .mvc:
            source?.navigationController?.pushViewController(Assembly.createMVC(), animated: true)
        case .mvp:
            source?.navigationController?.pushViewController(Assembly.createMVP(), animated: true)
        case .vip:
            source?.navigationController?.pushViewController(Assembly.createVIP(), animated: true)
        }
    }
}
