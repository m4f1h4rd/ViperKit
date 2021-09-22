//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Konstantin Syrbu. All rights reserved.
//  m4f1h4rd@gmail.com
//

import Foundation

protocol I___VARIABLE_productName:identifier___Presenter: AnyObject {
    var parameters: [String: Any]? { get set }

    func onViewDidLoad()
}

final class ___VARIABLE_productName:identifier___Presenter: I___VARIABLE_productName:identifier___Presenter {

    var parameters: [String: Any]?

    private var interactor: I___VARIABLE_productName:identifier___Interactor!
    private var router: I___VARIABLE_productName:identifier___Router!
    private weak var view: I___VARIABLE_productName:identifier___ViewController!

    // MARK: - Lifecycle

    init(interactor: I___VARIABLE_productName:identifier___Interactor, router: I___VARIABLE_productName:identifier___Router, view: I___VARIABLE_productName:identifier___ViewController) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }

    // MARK: - Internal

    func onViewDidLoad() {}

}

// MARK: - Private

private extension ___VARIABLE_productName:identifier___Presenter {}

// MARK: - I___VARIABLE_productName:identifier___InteractorDelegate

extension ___VARIABLE_productName:identifier___Presenter: I___VARIABLE_productName:identifier___InteractorDelegate {}
