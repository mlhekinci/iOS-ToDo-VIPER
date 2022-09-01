//
//  EditViewController.swift
//  iOS-ToDo-App
//
//  Created by Melih on 31.08.2022.
//

import UIKit

class EditViewController: UIViewController {
    
    @IBOutlet weak var updateInput: UITextField!
    
    var task: Task?
    var editPresenterObject: ViewToPresenterEditProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        EditRouter.createModule(ref: self)
        
        if let mTask = task {
            updateInput.text = mTask.task_title
        }
    }
    
    @IBAction func updateTodoButton(_ sender: Any) {
        if let input = updateInput.text, let m_task = task {
            editPresenterObject?.update(task_id: m_task.task_id!, task_title: input)
        }
    }
}
