//
//  ProgressMonitor+CoreDataProperties.swift
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

extension ProgressMonitor {

    @NSManaged var mostRecentSacrifice: NSDate?
    @NSManaged var numberOfSacrifices: NSNumber?
    @NSManaged var giveUpItem: GiveUpItem?
    @NSManaged var goal: Goal?
    @NSManaged var goalsComplete: User?
    @NSManaged var user: User?

}
