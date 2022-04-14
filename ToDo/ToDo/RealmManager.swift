//
//  RealmManager.swift
//  ToDo
//
//  Created by Paweł Brzozowski on 14/04/2022.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm() {
        do {
            let cofnig = Realm.Configuration()
            
            Realm.Configuration.defaultConfiguration = cofnig
            
            localRealm = try Realm()
        } catch {
            print("Error with openning realm: \(error)")
        }
    }
    
    func addTask(taskTitle: String) {
        if let localRealm = localRealm {
            do {
                let newTask =  Task(value: ["title": taskTitle, "completed": false])
                localRealm.add(newTask)
                getTasks()
                print("Added new task to Realm \(newTask)")
            } catch {
                print("Error adding task to realm: \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTasks = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            allTasks.forEach { task in
                tasks.append(task)
            }
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                let taskToUpdate = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToUpdate.isEmpty else {return}
                
                try localRealm.write {
                    taskToUpdate[0].completed = completed
                    getTasks()
                    print("Udpated task with id: \(id), status now: \(completed)")
                }
                
            } catch {
                print("Error updating task: \(id), \(error)")
            }
        }
    }
    
    func deleteTask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let taskToDelete = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !taskToDelete.isEmpty else {return}
                
                try localRealm.write {
                    localRealm.delete(taskToDelete)
                    getTasks()
                    print("Deleted task: \(id)")
                }
            } catch {
               print("Error with udpating task id: \(id)")
            }
        }
    }
}
