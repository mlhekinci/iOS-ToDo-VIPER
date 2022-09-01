//
//  SaveProtocol.swift
//  iOS-ToDo-App
//
//  Created by Melih on 1.09.2022.
//

import Foundation

protocol ViewToPresenterSaveProtocol {
    var saveInteractor: PresenterToInteractorSaveProtocol? {get set}
    func addTodo(task_title: String)
}

protocol PresenterToInteractorSaveProtocol {
    func addNewTodo(task_title: String)
}

protocol PresenterToRouterSaveProtocol {
    static func createModule(ref: SaveViewController)
}
