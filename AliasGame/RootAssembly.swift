//
//  RootAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol RootAssemblyProtocol {
    
    var presentationAssembly: PresentationAssemblyProtocol { get }
    
}

class RootAssembly: RootAssemblyProtocol {


    private let router: RouterInput

    let presentationAssembly: PresentationAssemblyProtocol

    private let servicesAssembly: ServicesAssemblyProtocol

    private let coreAssembly: CoreAssemblyProtocol


    init() {
        let coreAssembly = CoreAssembly()
        let servicesAssembly = ServicesAssembly(coreAssembly: coreAssembly)
        let presentationAssembly = PresentationAssembly(servicesAssembly: servicesAssembly)
        let router = Router(presentationAssembly: presentationAssembly)
        presentationAssembly.router = router
        router.start()
        self.coreAssembly = coreAssembly
        self.servicesAssembly = servicesAssembly
        self.presentationAssembly = presentationAssembly
        self.router = router
    }


}
