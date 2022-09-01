//
//  EditInteractor.swift
//  iOS-ToDo-App
//
//  Created by Melih on 1.09.2022.
//

import Foundation

class EditInteractor: PresenterToInteractorEditProtocol {
    
    let DB: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("task.sqlite")
        
        DB = FMDatabase(path: copyPath.path)
    }
    
    func updateTodo(task_id: Int, task_title: String) {
        DB?.open()
        
        do {
            try DB!.executeUpdate("UPDATE todos SET task_title = ? WHERE task_id = ?", values: [task_title, task_id])
        }catch {
            print(error.localizedDescription)
        }
        DB?.close()
    }
}
