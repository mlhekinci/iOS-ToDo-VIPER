//
//  SavePresenter.swift
//  iOS-ToDo-App
//
//  Created by Melih on 1.09.2022.
//

import Foundation

class SavePresenter: ViewToPresenterSaveProtocol {
    var saveInteractor: PresenterToInteractorSaveProtocol?
    
    func addTodo(task_title: String) {
        saveInteractor?.addNewTodo(task_title: task_title)
    }
}
