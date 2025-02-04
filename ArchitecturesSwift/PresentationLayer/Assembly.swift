//
//  Assembly.swift
//  Architectures
//
//  Created by Нагоев Магомед on 15/12/24.
//

import UIKit
import SwiftUI

class Assembly {
    static func createMVC() -> UIViewController {
        MVCViewController(userService: UserServiceStub())
    }
    
    static func createMVP() -> UIViewController {
        let presenter = MVPPresenter(userService: UserServiceStub())
        let view = MVPViewController(presenter: presenter)
        
        presenter.view = view
        
        return view
    }
    
    static func createVIP() -> UIViewController {
        let worker = VIPWorker(userService: UserServiceStub())
        let presenter = VIPPresenter()

        let interactor = VIPInteractor(
            worker: worker,
            presenter: presenter
        )

        let viewController = VIPViewController(interactor: interactor)

        presenter.view = viewController
        return viewController
    }
    
    static func createMVVM() -> UIViewController {
        let viewModel = MVVMSviftUIViewModel(userService: UserServiceStub())
        
        let swiftUIView = MVVMSwiftUIView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: swiftUIView)
        hostingController.navigationItem.title = "MVVM + SwiftUI"
        
        return hostingController
    }
    
    static func createMVVM2() -> UIViewController {
        let viewModel = MVVMViewModel(userService: UserServiceStub())
        let viewController = MVVMViewController(viewModel: viewModel)

        return viewController
    }
    
    static func createMainViewController() -> UIViewController {
        let router = MainRouter()
        let presenter = MainPresenter()

        let interactor = MainInteractor(presenter: presenter)

        let viewController = MainTableViewController(
            router: router,
            interactor: interactor
        )

        presenter.view = viewController
        router.source = viewController
        return viewController
    }
}
