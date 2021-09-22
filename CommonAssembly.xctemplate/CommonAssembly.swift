//
//  CommonAssembly
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Konstantin Syrbu. All rights reserved.
//  m4f1h4rd@gmail.com
//

import Foundation
import Swinject

final class CommonAssembly: Assembly {
	
    func assemble(container: Container) {
        container.register(ICoordinator.self) { _ in
            Coordinator.shared
        }
    }
    
}
