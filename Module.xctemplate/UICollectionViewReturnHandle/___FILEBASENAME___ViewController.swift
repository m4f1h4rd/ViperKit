//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Lanars. All rights reserved.
//  https://lanars.com/
//

import UIKit

protocol I___VARIABLE_productName:identifier___ViewController: BaseVCProtocol {
    func reloadData(at indexPath: IndexPath)
    func showNotSavedAlert()
}

final class ___VARIABLE_productName:identifier___ViewController: BaseVC {

    var presenter: I___VARIABLE_productName:identifier___Presenter!

    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareCollectionView()
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

private extension ___VARIABLE_productName:identifier___ViewController {
    
    func prepareCollectionView() {
        collectionView.register(dataSource: self, delegate: self, cellIDs: [])
    }

}

// MARK: - I___VARIABLE_productName:identifier___ViewController

extension ___VARIABLE_productName:identifier___ViewController: I___VARIABLE_productName:identifier___ViewController {

    func reloadData(at indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
    }

    func showNotSavedAlert() {
        UIAlertController.showNotSavedAlertController() { [weak self] in
            self?.presenter.handleBackClick()
        }
    }

}

// MARK: - UICollectionViewDataSource

extension ___VARIABLE_productName:identifier___ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getRowsCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(cellClass: UICollectionViewCell.self, for: indexPath)
        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension ___VARIABLE_productName:identifier___ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.size
    }

}
