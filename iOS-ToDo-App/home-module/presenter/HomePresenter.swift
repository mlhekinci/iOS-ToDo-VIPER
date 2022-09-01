//
//  HomePresenter.swift
//  iOS-ToDo-App
//
//  Created by Melih on 30.08.2022.
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {
   
    var homeInteractor: PresenterToInteractorHomeProtocol?
    var homeView: PresenterToViewHomeProtocol?
    
    func getTask() {
        homeInteractor?.getAllTask()
    }
    
    func searh(q: String) {
        homeInteractor?.searchTask(q: q)
    }
    
    func delete(task_id: Int) {
        homeInteractor?.deleteTask(task_id: task_id)
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func dataToPresenter(taskList: Array<Task>) {
        homeView?.dataToView(taskList: taskList)
    }
}
