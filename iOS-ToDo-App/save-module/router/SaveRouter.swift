//
//  SaveRouter.swift
//  iOS-ToDo-App
//
//  Created by Melih on 1.09.2022.
//

import Foundation

class SaveRouter: PresenterToRouterSaveProtocol {
    static func createModule(ref: SaveViewController) {
        ref.savePresenterObject = SavePresenter()
        ref.savePresenterObject?.saveInteractor = SaveInteractor()
    }
}
