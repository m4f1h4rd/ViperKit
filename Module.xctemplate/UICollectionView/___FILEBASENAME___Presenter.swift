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
    func getRowType(at indexPath: IndexPath) -> ___VARIABLE_productName:identifier___CollectionViewConfig
    func getData<Value>(at indexPath: IndexPath) -> Value?
    func updateData<Value>(value: Value?, type: ___VARIABLE_productName:identifier___CollectionViewConfig)
    func selectRow(at indexPath: IndexPath)
    func handleWillDisplay(at indexPath: IndexPath)
}

final class ___VARIABLE_productName:identifier___Presenter: I___VARIABLE_productName:identifier___Presenter {

    var parameters: [String: Any]?

    private var interactor: I___VARIABLE_productName:identifier___Interactor!
    private var wireframe: I___VARIABLE_productName:identifier___Wireframe!
    private weak var view: I___VARIABLE_productName:identifier___ViewController!

    private var model: Any?
    private var isDataChanged = false

    // MARK: - Lifecycle

    init(interactor: I___VARIABLE_productName:identifier___Interactor, wireframe: I___VARIABLE_productName:identifier___Wireframe, view: I___VARIABLE_productName:identifier___ViewController) {
        self.interactor = interactor
        self.wireframe = wireframe
        self.view = view
    }

    // MARK: - Internal

    func onViewDidLoad() {
        model = parameters?["Model"]
    }
    
    func getTitle() -> String {
        return "".localized
    }
    
    // MARK: - CollectionView config

    func getRowsCount() -> Int {
        return CellType.rows.count
    }

    func getRowType(at indexPath: IndexPath) -> ___VARIABLE_productName:identifier___CollectionViewConfig {
        return CellType.getType(at: indexPath)
    }

    func getData<Value>(at indexPath: IndexPath) -> Value? {
        let type = CellType.getType(at: indexPath)

        isDataChanged = true

        switch type {
        case .title      : return model as? Value
        }
    }

    func updateData<Value>(value: Value?, type: ___VARIABLE_productName:identifier___CollectionViewConfig) {
        switch type {
        case .title      : model = value
        }
    }

    func selectRow(at indexPath: IndexPath) {}

    func handleWillDisplay(at indexPath: IndexPath) {
        let isLoaded: Bool? = nil
        
        guard isLoaded == true else { return }
            
        view?.showActivity()
    }

    // MARK: - Handle

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

// MARK: - ___VARIABLE_productName:identifier___CollectionViewConfig

fileprivate typealias CellType = ___VARIABLE_productName:identifier___CollectionViewConfig

enum ___VARIABLE_productName:identifier___CollectionViewConfig {

    case title

    static let rows: [___VARIABLE_productName:identifier___CollectionViewConfig] = [.title]

    static func getIndexPath(of config: ___VARIABLE_productName:identifier___CollectionViewConfig) -> IndexPath? {
        return rows
            .firstIndex(where: { $0 == config })
            .map { IndexPath(row: $0, section: .zero) }
    }

    static func getType(at indexPath: IndexPath) -> ___VARIABLE_productName:identifier___CollectionViewConfig {
        return rows[indexPath.row]
    }

}
