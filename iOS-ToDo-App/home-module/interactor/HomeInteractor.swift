//
//  HomeInteractor.swift
//  iOS-ToDo-App
//
//  Created by Melih on 30.08.2022.
//

import Foundation

class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    var homePresenter: InteractorToPresenterHomeProtocol?
    
    let DB: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("task.sqlite")
        
        DB = FMDatabase(path: copyPath.path)
    }
   
    func getAllTask() {
        var list = [Task]()
        
        DB?.open()
        
        do{
            let query = try DB!.executeQuery("SELECT * FROM todos", values: nil)
            
            while query.next() {
                let task = Task(task_id: Int(query.string(forColumn: "task_id"))!, task_title: query.string(forColumn: "task_title")!)
                list.append(task)
            }
            
            homePresenter?.dataToPresenter(taskList: list)
            
        }catch {
            print(error.localizedDescription)
        }
        
        DB?.close()
    }
    
    func searchTask(q: String) {
       var list = [Task]()
        
        DB?.open()
        
        do {
            let query = try DB!.executeQuery("SELECT * FROM todos WHERE task_title like '%\(q)%'", values: nil)
            
            while query.next() {
                
                let task = Task(task_id: Int(query.string(forColumn: "task_id"))!, task_title: query.string(forColumn: "task_title")!)
                
                list.append(task)
            }
            
            homePresenter?.dataToPresenter(taskList: list)
            
        }catch {
            print(error.localizedDescription)
        }
        
        DB?.close()
    }
    
    func deleteTask(task_id: Int) {
        DB?.open()
        
        do {
            try DB!.executeUpdate("DELETE FROM todos WHERE task_id = ?", values: [task_id])
            
            getAllTask()
        }catch {
            print(error.localizedDescription)
        }
        
        DB?.close()
    }
}
