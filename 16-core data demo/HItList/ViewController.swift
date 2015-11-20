//
//  ViewController.swift
//  HItList
//
//  Created by Yiqi Wang on 15/11/20.
//  Copyright © 2015年 Yiqi Wang. All rights reserved.
//  http://www.raywenderlich.com/115695/getting-started-with-core-data-tutorial

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  //NSManagedObject represents a single object stored in Core Data—you must use it to create, edit, save and delete from your Core Data persistent store. As you’ll see shortly, NSManagedObject is a shape-shifter. It can take the form of any entity in your data model, appropriating whatever attributes and relationships you defined.
  var people = [NSManagedObject]()
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    //1 
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    let managedContext = appDelegate.managedObjectContext
    
    //2 As the name suggests, NSFetchRequest is the class responsible for fetching from Core Data. Fetch requests are both powerful and flexible. You can use requests to fetch a set of objects that meet particular criteria (e.g., “give me all employees that live in Wisconsin and have been with the company at least three years”), individual values (e.g., “give me the longest name in the database”) and more.Fetch requests have several qualifiers that refine the set of results they return. For now, you should know that NSEntityDescription is one of these qualifiers (one that is required!).Setting a fetch request’s entity property, or alternatively initializing it with init(entityName:), fetches all objects of a particular entity. This is what you do here to fetch all Person entities.
    let fetchRequest = NSFetchRequest(entityName: "Person")
    
    //3 You hand the fetch request over to the managed object context to do the heavy lifting. executeFetchRequest() returns an array of managed objects that meets the criteria specified by the fetch request.
    do {
      let results = try managedContext.executeFetchRequest(fetchRequest)
      people = results as! [NSManagedObject]
    } catch let error as NSError {
      print("Could not fetch \(error), \(error.userInfo)")
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //This will set a title and register the UITableViewCell class with the table view. You do this so that when you dequeue a cell, the table view will return a cell of the correct type.
    title = "\"TheList\""
    tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  // MARK: UITableViewDataSource
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("cell")

    let person = people[indexPath.row]
    //Why do you have to do this? As it turns out, NSManagedObject doesn’t know about the name attribute you defined in your data model, so there’s no way of accessing it directly with a property. The only way Core Data provides to read the value is key-value coding, commonly referred to as KVC.
    cell!.textLabel!.text = person.valueForKey("name") as? String
    
    return cell!
  }
  
  @IBAction func addName(sender: UIBarButtonItem) {
    let alert = UIAlertController(title: "New Name", message: "Add a new name", preferredStyle: .Alert)
    
    let saveAction = UIAlertAction(title: "Save", style: .Default, handler: {(action:UIAlertAction) -> Void in
      let textField = alert.textFields!.first
      self.saveName(textField!.text!)
      self.tableView.reloadData()
    })
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: {(action : UIAlertAction) -> Void in})
    
    alert.addTextFieldWithConfigurationHandler({ (textfield : UITextField) -> Void in })
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    presentViewController(alert, animated: true, completion: nil)
  }
  
  func saveName(name: String) {
    //1 Before you can save or retrieve anything from your Core Data store, you first need to get your hands on an NSManagedObjectContext. You can think of a managed object context as an in-memory “scratchpad” for working with managed objects.Think of saving a new managed object to Core Data as a two-step process: first, you insert a new managed object into a managed object context; then, after you’re happy with your shiny new managed object, you “commit” the changes in your managed object context to save it to disk.Xcode has already generated a managed object context as part of the new project’s template – remember, this only happens if you check the Use Core Data checkbox at the beginning. This default managed object context lives as a property of the application delegate. To access it, you first get a reference to the app delegate.
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    let managedContext = appDelegate.managedObjectContext
    
    //2 You create a new managed object and insert it into the managed object context. You can do this in one step with NSManagedObject’s designated initializer: init(entity:insertIntoManagedObjectContext:).You may be wondering what an NSEntityDescription is all about. Recall that earlier, I called NSManagedObject a “shape-shifter” class because it can represent any entity. An entity description is the piece that links the entity definition from your data model with an instance of NSManagedObject at runtime.
    let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
    
    let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
    
    //3 With an NSManagedObject in hand, you set the name attribute using key-value coding. You have to spell the KVC key (“name” in this case) exactly as it appears on your data model, otherwise your app will crash at runtime.
    person.setValue(name, forKey: "name")
    
    //4 You commit your changes to person and save to disk by calling save on the managed object context. Note that save can throw an error, which is why you call it using the try keyword and within a do block.
    do {
      try managedContext.save()
      
    //5 Congratulations! Your new managed object is now safely ensconced in your Core Data persistent store. Still within the do block, insert the new managed object into the people array so that it shows up in the table view when it reloads.
      people.append(person)
    } catch let error as NSError {
      print("could not save \(error), \(error.userInfo)")
    }
  }

}

