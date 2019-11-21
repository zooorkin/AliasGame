//
//  ImageService.swift
//  AliasGame
//
//  Created by Андрей Зорькин on 21/11/2019.
//  Copyright © 2019 Андрей Зорькин. All rights reserved.
//

protocol IImageService {

    var delegate: IImageServiceDelegate? { get set }

}


protocol IImageServiceDelegate {

}


class ImageService: IImageService, INetworkingDelegate, IMachineLearningDelegate, ICoreDataStackDelegate {

    var delegate: IImageServiceDelegate?

    private var networking: INetworking

    private var machineLearning: IMachineLearning

    private var coreDataStack: ICoreDataStack


    init(networking: INetworking, machineLearning: IMachineLearning, coreDataStack: ICoreDataStack) {
        self.networking = networking
        self.machineLearning = machineLearning
        self.coreDataStack = coreDataStack
        self.networking.delegate = self
        self.machineLearning.delegate = self
        self.coreDataStack.delegate = self
    }


}
