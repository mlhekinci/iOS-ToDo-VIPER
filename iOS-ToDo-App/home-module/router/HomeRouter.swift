//
//  HomeRouter.swift
//  iOS-ToDo-App
//
//  Created by Melih on 30.08.2022.
//

import Foundation

class HomeRouter: PresenterToRouterHomeProtocol {
    static func createModule(ref: ViewController) {
        let presenter = HomePresenter()
        
        ref.homePresenterObject = presenter
        ref.homePresenterObject?.homeInteractor = HomeInteractor()
        ref.homePresenterObject?.homeView = ref
        ref.homePresenterObject?.homeInteractor?.homePresenter = presenter
    }
}
