//
//  SaveInteractor.swift
//  iOS-ToDo-App
//
//  Created by Melih on 1.09.2022.
//

import Foundation

class SaveInteractor: PresenterToInteractorSaveProtocol {
    func addNewTodo(task_title: String) {
        print("New todo: \(task_title)")
    }
}
