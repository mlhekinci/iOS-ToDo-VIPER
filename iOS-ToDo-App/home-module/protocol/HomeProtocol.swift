//
//  HomeProtocol.swift
//  iOS-ToDo-App
//
//  Created by Melih on 30.08.2022.
//

import Foundation


protocol ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol? {get set}
    var homeView: PresenterToViewHomeProtocol? {get set}
    
    func getTask()
    func searh(q: String)
    func delete(task_id: Int)
}

protocol PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol? {get set}
    
    func getAllTask()
    func searchTask(q: String)
    func deleteTask(task_id: Int)
}

protocol InteractorToPresenterHomeProtocol {
    func dataToPresenter(taskList: Array<Task>)
}

protocol PresenterToViewHomeProtocol {
    func dataToView(taskList: Array<Task>)
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref: ViewController)
}
