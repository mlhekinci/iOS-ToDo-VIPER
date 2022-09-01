//
//  SaveViewController.swift
//  iOS-ToDo-App
//
//  Created by Melih on 31.08.2022.
//

import UIKit

class SaveViewController: UIViewController {
    
    @IBOutlet weak var todoInput: UITextField!
    
    var savePresenterObject: ViewToPresenterSaveProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        SaveRouter.createModule(ref: self)
    }
    
    @IBAction func todoSaveButton(_ sender: Any) {
        if let input = todoInput.text {
            savePresenterObject?.addTodo(task_title: input)
        }
    }
}
