//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Konstantin Syrbu. All rights reserved.
//  m4f1h4rd@gmail.com
//

import Foundation
import Swinject

final class ___VARIABLE_productName:identifier___Assembly: Assembly {
	
    func assemble(container: Container) {
        container.register(I___VARIABLE_productName:identifier___Router.self) { (_, coordinator: ICoordinator) -> I___VARIABLE_productName:identifier___Router in
            ___VARIABLE_productName:identifier___Router(coordinator: coordinator)
        }
		
        container.register(I___VARIABLE_productName:identifier___Interactor.self) { _ in
            let interactor = ___VARIABLE_productName:identifier___Interactor()
            return interactor
        }
		
        container.register(I___VARIABLE_productName:identifier___Presenter.self) { (r, coordinator: ICoordinator, view: I___VARIABLE_productName:identifier___ViewController) in
            let router = r.resolve(I___VARIABLE_productName:identifier___Router.self, argument: coordinator)!
            let interactor = r.resolve(I___VARIABLE_productName:identifier___Interactor.self)!
            let presenter = ___VARIABLE_productName:identifier___Presenter(interactor: interactor, router: router, view: view)
            interactor.delegate = presenter
            return presenter
        }
		
        /*
        // If you need passing some parameter, you can add new params with name parameters or other, ex:
        container.register(___VARIABLE_productName:identifier___ViewController.self) { (r, coordinator: ICoordinator, parameters: [String: Any]) in
            let view = ___VARIABLE_productName:identifier___ViewController()
            let presenter = r.resolve(IPresenter.self, arguments: coordinator, view as I___VARIABLE_productName:identifier___ViewController)!
            presenter.parameters = parameters
            view.presenter = presenter
            return view
        }
        */
		
        container.register(___VARIABLE_productName:identifier___ViewController.self) { (r, coordinator: ICoordinator) in
            let view = ___VARIABLE_productName:identifier___ViewController()
            let presenter = r.resolve(I___VARIABLE_productName:identifier___Presenter.self, arguments: coordinator, view as I___VARIABLE_productName:identifier___ViewController)!
            presenter.parameters = nil
            view.presenter = presenter
            return view
        }
    }
    
}
