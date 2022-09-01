//
//  EditProtocol.swift
//  iOS-ToDo-App
//
//  Created by Melih on 1.09.2022.
//

import Foundation


protocol ViewToPresenterEditProtocol {
    var editInteractor: PresenterToInteractorEditProtocol? {get set}
    func update(task_id: Int, task_title: String)
}

protocol PresenterToInteractorEditProtocol {
    func updateTodo(task_id: Int, task_title: String)
}

protocol PresenterToRouterEditProtocol {
    static func createModule(ref: EditViewController)
}
