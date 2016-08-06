//
//  GiveUpItem+CoreDataProperties.swift
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

extension GiveUpItem {

    @NSManaged var cost: NSNumber?
    @NSManaged var frequency: NSNumber?
    @NSManaged var name: String?
    @NSManaged var goal: Goal?
    @NSManaged var progressMonitor: ProgressMonitor?

}
