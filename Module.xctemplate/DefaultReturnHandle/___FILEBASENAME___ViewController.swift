//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Lanars. All rights reserved.
//  https://lanars.com/
//

import UIKit

protocol I___VARIABLE_productName:identifier___ViewController: BaseVCProtocol {
    func showNotSavedAlert()
}

final class ___VARIABLE_productName:identifier___ViewController: BaseVC {

    var presenter: I___VARIABLE_productName:identifier___Presenter!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.onViewDidLoad()
    }

    override func didBtBackClicked() {
        view.endEditing(true)

        guard presenter.canGoBack() else { return }

        super.didBtBackClicked()
    }

    // MARK: - UI

    override func prepareUI() {}

    // MARK: - Localization

    override func prepareLocalization() {
        title = presenter.getTitle()
    }

}

// MARK: - Private

private extension ___VARIABLE_productName:identifier___ViewController {}

// MARK: - I___VARIABLE_productName:identifier___ViewController

extension ___VARIABLE_productName:identifier___ViewController: I___VARIABLE_productName:identifier___ViewController {
    
    func showNotSavedAlert() {
        UIAlertController.showNotSavedAlertController() { [weak self] in
            self?.presenter.handleBackClick()
        }
    }
    
}
