//
//  SaveInteractor.swift
//  iOS-ToDo-App
//
//  Created by Melih on 1.09.2022.
//

import Foundation

class SaveInteractor: PresenterToInteractorSaveProtocol {
    
    let DB: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("task.sqlite")
        
        DB = FMDatabase(path: copyPath.path)
    }
    
    func addNewTodo(task_title: String) {
        DB?.open()
        
        do {
            try DB?.executeUpdate("INSERT INTO todos (task_title) VALUES (?)", values: [task_title])
        } catch {
            print(error.localizedDescription)
        }
        DB?.close()
    }
}
