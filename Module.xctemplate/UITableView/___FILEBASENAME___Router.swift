//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Lanars. All rights reserved.
//  https://lanars.com/
//

import Foundation

protocol I___VARIABLE_productName:identifier___Wireframe: class {
    func closeVC()
    func navigateTo_Next_VC(params: [String: Any])
}

final class ___VARIABLE_productName:identifier___Wireframe: I___VARIABLE_productName:identifier___Wireframe {

    private let router: IAppRouter

    // MARK: - Lifecycle

    init(router: IAppRouter) {
        self.router = router
    }

    // MARK: - Navigation

    func closeVC() {
        AppRouter.shared.dismissFromNavigationController(true)
    }

    func navigateTo_Next_VC(params: [String: Any]) {
        //AppRouter.shared.presentModule(BaseVC.self, .push, true, params)
    }

}
