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
    func getRowsCount() -> Int
    func getRowType(at indexPath: IndexPath) -> ___VARIABLE_productName:identifier___TableViewConfig
    func getData<Value>(at indexPath: IndexPath) -> Value?
    func updateData<Value>(value: Value?, type: ___VARIABLE_productName:identifier___TableViewConfig)
    func selectRow(at indexPath: IndexPath)
    func handleWillDisplay(at indexPath: IndexPath)
    func handleBackClick()
    func canGoBack() -> Bool
}

final class ___VARIABLE_productName:identifier___Presenter: I___VARIABLE_productName:identifier___Presenter {

    var parameters: [String: Any]?

    private var interactor: I___VARIABLE_productName:identifier___Interactor?
    private var wireframe: I___VARIABLE_productName:identifier___Wireframe?
    private weak var view: I___VARIABLE_productName:identifier___ViewController?

    private var model: JSONable?
    private var isDataChanged = false

    // MARK: - Lifecycle

    init(interactor: I___VARIABLE_productName:identifier___Interactor, wireframe: I___VARIABLE_productName:identifier___Wireframe, view: I___VARIABLE_productName:identifier___ViewController) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.view = view
    }

    // MARK: - Internal

    func onViewDidLoad() {
        model = parameters?["Model"] as? JSONable
    }
    
    func getTitle() -> String {
        return "".localized
    }

    func canGoBack() -> Bool {
        guard isDataChanged else { return true }
        
        view?.showNotSavedAlert()
        return false
    }
    
    // MARK: - TableView config

    func getRowsCount() -> Int {
        return CellType.rows.count
    }

    func getRowType(at indexPath: IndexPath) -> ___VARIABLE_productName:identifier___TableViewConfig {
        return CellType.getType(at: indexPath)
    }

    func getData<Value>(at indexPath: IndexPath) -> Value? {
        let type = CellType.getType(at: indexPath)

        isDataChanged = true

        switch type {
        case .title      : return model as? Value
        }
    }

    func updateData<Value>(value: Value?, type: ___VARIABLE_productName:identifier___TableViewConfig) {
        switch type {
        case .title      : model = value as? JSONable
        }
    }

    func selectRow(at indexPath: IndexPath) {}

    func handleWillDisplay(at indexPath: IndexPath) {
        let isLoaded: Bool? = nil
        
        guard isLoaded == true else { return }
            
        view?.showActivity()
    }

    // MARK: - Handle

    func handleBackClick() {
        wireframe?.closeVC()
    }

}

// MARK: - Private

private extension ___VARIABLE_productName:identifier___Presenter {}

// MARK: - I___VARIABLE_productName:identifier___InteractorDelegate

extension ___VARIABLE_productName:identifier___Presenter: I___VARIABLE_productName:identifier___InteractorDelegate {

    func didGetTitle(result: Result) {
        view?.hideActivity()

        switch result {
        case .Success(let data):
            break
        case .Failure(let error):
            view?.showInfoView(type: .serverError(text: error?.message))
        }
    }

}

// MARK: - ___VARIABLE_productName:identifier___TableViewConfig

fileprivate typealias CellType = ___VARIABLE_productName:identifier___TableViewConfig

enum ___VARIABLE_productName:identifier___TableViewConfig {

    case title

    static let rows: [___VARIABLE_productName:identifier___TableViewConfig] = [.title]

    static func getIndexPath(of config: ___VARIABLE_productName:identifier___TableViewConfig) -> IndexPath? {
        return rows
            .firstIndex(where: { $0 == config })
            .map { IndexPath(row: $0, section: .zero) }
    }

    static func getType(at indexPath: IndexPath) -> ___VARIABLE_productName:identifier___TableViewConfig {
        return rows[indexPath.row]
    }

}
