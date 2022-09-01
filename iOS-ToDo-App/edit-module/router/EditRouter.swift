//
//  EditRouter.swift
//  iOS-ToDo-App
//
//  Created by Melih on 1.09.2022.
//

import Foundation


class EditRouter: PresenterToRouterEditProtocol {
    static func createModule(ref: EditViewController) {
        ref.editPresenterObject = EditPresenter()
        ref.editPresenterObject?.editInteractor = EditInteractor()
    }
}
