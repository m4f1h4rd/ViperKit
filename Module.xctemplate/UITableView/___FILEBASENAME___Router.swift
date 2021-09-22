//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Konstantin Syrbu. All rights reserved.
//  m4f1h4rd@gmail.com
//

import Foundation

protocol I___VARIABLE_productName:identifier___Router: AnyObject {
    func closeVC(_ animated: Bool)
}

final class ___VARIABLE_productName:identifier___Router: I___VARIABLE_productName:identifier___Router {

    private let coordinator: ICoordinator

    // MARK: - Lifecycle

    init(coordinator: ICoordinator) {
        self.coordinator = coordinator
    }

    // MARK: - Navigation

    func closeVC(_ animated: Bool) {
        Coordinator.shared.dismissFromNavigationController(animated)
    }

}
