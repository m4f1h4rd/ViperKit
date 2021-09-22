//
//  BaseCoordinator.swift
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Konstantin Syrbu. All rights reserved.
//  m4f1h4rd@gmail.com
//

import Foundation
import Swinject

class BaseCoordinator: ICoordinator {
    
    var resolver: Resolver {
        return assembler.resolver
    }
    
    private let assembler: Assembler!
    private let navigationController: UINavigationController?
	
    // MARK: - Lifecycle
    
    init(navigationController: UINavigationController?, assembler: Assembler) {
        self.navigationController = navigationController
        self.assembler = assembler
    }
	
    // MARK: - Internal
	
    func dismissFromNavigationController(_ animated: Bool) {
        dismissFromNavigationController(animated, nil)
    }
	
    func dismissFromNavigationController(_ animated: Bool, _ completion: (() -> Void)?) {
        _ = navigationController?.popViewController(animated: animated)
        completion?()
    }
	
    func presentModule<T>(_ view: T.Type, _ type: PresentType, _ animated: Bool) where T: UIViewController {
        presentModule(view, type, animated, nil)
    }
	
    func presentModule<T>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ completion: (() -> Void)?) where T: UIViewController {
        guard let vc = resolver.resolve(view, argument: self as ICoordinator) else { return }
        
        switch type {
        case .root:
            navigationController?.setViewControllers([vc], animated: animated)
        case .push:
            navigationController?.pushViewController(vc, animated: animated)
            completion?()
        case .present:
            navigationController?.present(vc, animated: animated) {
                completion?()
            }
        case .modal:
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            navigationController?.present(vc, animated: animated) {
                completion?()
            }
        case .popAndPush:
            _ = navigationController?.popViewController(animated: false)
            _ = navigationController?.pushViewController(vc, animated: animated)
            completion?()
        }
    }

    func presentModule<T>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ parameters: [String: Any]) where T: UIViewController {
        presentModule(view, type, animated, parameters, nil)
    }

    func presentModule<T>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ parameters: [String: Any], _ completion: (() -> Void)?) where T: UIViewController {
        guard let vc = resolver.resolve(view, arguments: self as ICoordinator, parameters) else { return }
        
        switch type {
        case .root:
            navigationController?.setViewControllers([vc], animated: animated)
        case .push:
            navigationController?.pushViewController(vc, animated: animated)
            completion?()
        case .present:
            navigationController?.present(vc, animated: animated) {
                completion?()
            }
        case .modal:
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            navigationController?.present(vc, animated: animated) {
                completion?()
            }
        case .popAndPush:
            _ = navigationController?.popViewController(animated: false)
            _ = navigationController?.pushViewController(vc, animated: animated)
            completion?()
        }
    }

}
