//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Lanars. All rights reserved.
//  https://lanars.com/
//

import Foundation

protocol I___VARIABLE_productName:identifier___Presenter: class {
    var parameters: [String: Any]? { get set }

    func onViewDidLoad()
    func getTitle() -> String
    func handleBackClick()
    func canGoBack() -> Bool
}

final class ___VARIABLE_productName:identifier___Presenter: I___VARIABLE_productName:identifier___Presenter {

    var parameters: [String: Any]?

    private var interactor: I___VARIABLE_productName:identifier___Interactor!
    private var wireframe: I___VARIABLE_productName:identifier___Wireframe!
    private weak var view: I___VARIABLE_productName:identifier___ViewController!

    private var isDataChanged = false

    // MARK: - Lifecycle

    init(interactor: I___VARIABLE_productName:identifier___Interactor, wireframe: I___VARIABLE_productName:identifier___Wireframe, view: I___VARIABLE_productName:identifier___ViewController) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.view = view
    }

    // MARK: - Internal

    func onViewDidLoad() {}
    
    func getTitle() -> String {
        return "".localized
    }

    func canGoBack() -> Bool {
        guard isDataChanged else { return true }
        
        view.showNotSavedAlert()
        return false
    }

    // MARK: - Handle

    func handleBackClick() {
        wireframe.closeVC()
    }

}

// MARK: - Private

private extension ___VARIABLE_productName:identifier___Presenter {}

// MARK: - I___VARIABLE_productName:identifier___InteractorDelegate

extension ___VARIABLE_productName:identifier___Presenter: I___VARIABLE_productName:identifier___InteractorDelegate {}
