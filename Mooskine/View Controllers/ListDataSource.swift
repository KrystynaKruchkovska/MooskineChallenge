//
//  ListDataSource.swift
//  Mooskine
//
//  Created by Mac on 12/14/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class ListDataSource<EntityType: NSManagedObject, CellType: UITableViewCell>: NSObject, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var tableView : UITableView
    var managedObjectContext:NSManagedObjectContext
    var fetchRequest : NSFetchRequest<NSManagedObject>
    var fetchedResultsController : NSFetchedResultsController<NSManagedObject>
    
    
    init(tableView: UITableView, managedObjectContext: NSManagedObjectContext, fetchRequest: NSFetchRequest<EntityType>, configure: @escaping (CellType, EntityType) -> Void) {
        //
        self.tableView = tableView
        self.managedObjectContext = managedObjectContext
        self.fetchRequest = fetchRequest as! NSFetchRequest<NSManagedObject>
        
        configure.(<#T##CellType#>, <#T##EntityType#>)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController. .sections?.count ?? 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    //
}

extension ListDataSource {
    
    
    fileprivate func setUpFetchedResultController() {
        let fetchRequest:NSFetchRequest<Note> = Note.fetchRequest()
        let predicate = NSPredicate(format: "notebook == %@", notebook)
        fetchRequest.predicate = predicate
        let sortDeskription = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDeskription]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataController.viewContext, sectionNameKeyPath: nil, cacheName: "notes")
        
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            
        } catch {
            fatalError("the fetched couldn't be performed \(error.localizedDescription)")
        }
    }
}
