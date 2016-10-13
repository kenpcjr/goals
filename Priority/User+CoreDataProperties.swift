//
//  User+CoreDataProperties.swift
//  Priority
//
//  Created by Kenneth Cooke on 8/1/16.
//  Copyright © 2016 kencooke. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var mostRecentSacrifice: Date?
    @NSManaged var goalInProgress: ProgressMonitor?
    @NSManaged var goalsComplete: NSOrderedSet?

}
