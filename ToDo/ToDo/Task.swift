//
//  Task.swift
//  ToDo
//
//  Created by Paweł Brzozowski on 14/04/2022.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
