//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Lanars. All rights reserved.
//  https://lanars.com/
//

import UIKit

protocol I___VARIABLE_productName:identifier___ViewController: BaseVCProtocol {
    func reloadData()
}

final class ___VARIABLE_productName:identifier___ViewController: BaseVC {

    var presenter: I___VARIABLE_productName:identifier___Presenter!

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareTableView()
        presenter.onViewDidLoad()
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

    func prepareTableView() {
        tableView.register(dataSource: self, cellIDs: [])
    }

}

// MARK: - I___VARIABLE_productName:identifier___ViewController

extension ___VARIABLE_productName:identifier___ViewController: I___VARIABLE_productName:identifier___ViewController {

    func reloadData() {
        tableView.reloadData()
    }

}

// MARK: - UITableViewDataSource

extension ___VARIABLE_productName:identifier___ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getRowsCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowType = presenter.getRowType(at: indexPath)

        switch rowType {
        case .title:
            let cell = tableView.dequeueReusableCell(UITableViewCell.self)
            return cell
        }
    }

}

// MARK: - UITableViewDelegate

extension ___VARIABLE_productName:identifier___ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        DispatchQueue.main.async {
            self.dismiss(animated: true) {
                self.presenter.selectRow(at: indexPath)
            }
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter.handleWillDisplay(at: indexPath)
    }

}
