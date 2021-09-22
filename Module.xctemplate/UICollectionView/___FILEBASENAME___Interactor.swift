//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Konstantin Syrbu. All rights reserved.
//  m4f1h4rd@gmail.com
//

import Foundation

protocol I___VARIABLE_productName:identifier___InteractorDelegate: AnyObject {}

protocol I___VARIABLE_productName:identifier___Interactor: AnyObject {
    var delegate: I___VARIABLE_productName:identifier___InteractorDelegate? { get set }
}

final class ___VARIABLE_productName:identifier___Interactor: I___VARIABLE_productName:identifier___Interactor {

    // MARK: - Declare delegate

    weak var delegate: I___VARIABLE_productName:identifier___InteractorDelegate?

}
