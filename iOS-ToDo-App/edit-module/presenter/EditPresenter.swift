//
//  EditPresenter.swift
//  iOS-ToDo-App
//
//  Created by Melih on 1.09.2022.
//

import Foundation

class EditPresenter: ViewToPresenterEditProtocol {
    var editInteractor: PresenterToInteractorEditProtocol?
    
    func update(task_id: Int, task_title: String) {
        editInteractor?.updateTodo(task_id: task_id, task_title: task_title)
    }
}
