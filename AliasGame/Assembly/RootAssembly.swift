//
//  RootAssembly.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

class RootAssembly: IRootAssembly {


    private let coordinator: ICoordinator

    let presentationAssembly: IPresentationAssembly

    private let servicesAssembly: IServicesAssembly

    private let coreAssembly: ICoreAssembly


    init() {
        let coreAssembly = CoreAssembly()
        let servicesAssembly = ServicesAssembly(coreAssembly: coreAssembly)
        let presentationAssembly = PresentationAssembly(servicesAssembly: servicesAssembly)
        let coordinator = Coordinator(presentationAssembly: presentationAssembly)
        presentationAssembly.coordinator = coordinator
        coordinator.start()
        self.coreAssembly = coreAssembly
        self.servicesAssembly = servicesAssembly
        self.presentationAssembly = presentationAssembly
        self.coordinator = coordinator
    }


}
