//
//  ViewController.swift
//  iOS-ToDo-App
//
//  Created by Melih on 30.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var taskTableView: UITableView!
    
    var homePresenterObject: ViewToPresenterHomeProtocol?
    var taskList = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.delegate = self
        taskTableView.dataSource = self
        HomeRouter.createModule(ref: self)
        
        copyDB()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePresenterObject?.getTask()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toEditPage") {
            if let task = sender as? Task {
                let target = segue.destination as! EditViewController
                target.task = task
            }
        }
    }
    
    
    func copyDB() {
        let bundlePath = Bundle.main.path(forResource: "task", ofType: ".sqlite")
        
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("task.sqlite")
        
        let fileManager = FileManager.default
        
        if (fileManager.fileExists(atPath: copyPath.path)) {
            print("File already exists")
        } else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
            }catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: PresenterToViewHomeProtocol {
    func dataToView(taskList: Array<Task>) {
        self.taskList = taskList
        self.taskTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let task = taskList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskTableViewCell
        
        cell.taskTitleLabel.text = task.task_title!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = taskList[indexPath.row]
        performSegue(withIdentifier: "toEditPage", sender: task)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

