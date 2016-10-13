//
//  Goal+CoreDataProperties.swift
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

extension Goal {

    @NSManaged var completed: NSNumber?
    @NSManaged var cost: NSNumber?
    @NSManaged var endDate: Date?
    @NSManaged var name: String?
    @NSManaged var startDate: Date?
    @NSManaged var giveUpItem: GiveUpItem?
    @NSManaged var progressMonitor: ProgressMonitor?

}
