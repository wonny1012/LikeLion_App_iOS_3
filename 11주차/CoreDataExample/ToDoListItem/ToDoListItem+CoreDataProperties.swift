//
//  ToDoListItem+CoreDataProperties.swift
//  CoreDataExample
//
//  Created by kwon ji won on 11/23/23.
//
//

import Foundation
import CoreData


extension ToDoListItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListItem> {
        return NSFetchRequest<ToDoListItem>(entityName: "ToDoListItem")
    }
    //내가 만든 값들이 여기 저장되어 있다. 
    @NSManaged public var name: String?
    @NSManaged public var createAt: Date?

}

extension ToDoListItem : Identifiable {

}
