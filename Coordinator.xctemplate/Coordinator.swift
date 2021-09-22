//
//  Coordinator.swift
//  ___PROJECTNAME___
//
//  Copyright © ___YEAR___ Konstantin Syrbu. All rights reserved.
//  m4f1h4rd@gmail.com
//

import Foundation
import Swinject

enum PresentType {
    case root, push, popAndPush, present, modal
}

protocol ICoordinator {
    
    var resolver: Resolver { get }
	
    // Present ViewController with Completion Handler
    func presentModule<T: UIViewController>(_ view: T.Type, _ type: PresentType, _ animated: Bool)
    func presentModule<T: UIViewController>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ completion: (() -> Void)?)
	
    // Present ViewController with Parameters and Completion Handler
    func presentModule<T: UIViewController>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ parameters: [String: Any])
    func presentModule<T: UIViewController>(_ view: T.Type, _ type: PresentType, _ animated: Bool, _ parameters: [String: Any], _ completion: (() -> Void)?)
	
    // Dismiss ViewController with Completion Handler and without Completion Handler
    func dismissFromNavigationController(_ animated: Bool)
    func dismissFromNavigationController(_ animated: Bool, _ completion: (() -> Void)?)
    
}

final class Coordinator: BaseCoordinator {
    
    static let shared = Coordinator.createCoordinator()
	
    private static func createCoordinator() -> Coordinator {
        
    // To use this method, you must be Embed the Main.storyboard with UINavigationController, if you don't, your application will be crash.
    let rootVC = UIApplication.shared.delegate!.window!!.rootViewController! as? UINavigationController
		
        // Let's register all your Assembly Class here
        let assembler = Assembler()
        assembler.apply(assemblies: [
            CommonAssembly()
        ])
		
        let coordinator = Coordinator(navigationController: rootVC, assembler: assembler)
        return coordinator
    }

}
