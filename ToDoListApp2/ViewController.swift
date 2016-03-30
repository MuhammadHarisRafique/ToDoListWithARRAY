//
//  ViewController.swift
//  ToDoListApp2
//
//  Created by Mac on 3/26/16.
//  Copyright © 2016 Mac. All rights reserved.
//

import UIKit

struct TaskStruct {
    
    var myTask: [String] = []
    var Description: [String] = []
    var photo: [String] = []
    

}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var index: Int?
    var task: String?
    var descrip: String?
    var img: String?
    var structObect = TaskStruct()
    
    @IBOutlet weak var editBarButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var cancelbarButtonOutlet: UIBarButtonItem!
    
    
    ////*******WORKING WITH ARRAY********//

    
    //    var myTask = ["Eat", "Play", "Walking", "Reading", "Job", "Meet With Relative", "Meet With Friends"]
    //  var Description = ["BreakFast and Only Dinner", "Cricket at 5:00 PM", "Joging in Park near office at 7:00", "Reading Book in Office for one Hour", "9:00 to 4:00", "At 8:00 PM", "At 10:00 PM"]
//    var myTask: [String] = []
//    var Description: [String] = []

    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.cancelbarButtonOutlet.enabled = false
        self.editBarButtonOutlet.enabled = false
        if task != "" && task != nil
        {
            // MARK: - Working with Array
            
//            myTask.append(task!)
//            Description.append(descrip!)
            
            
            //********WORKING WITH STRUCT********//
            
            structObect.myTask.append(task!)
            structObect.Description.append(descrip!)
            structObect.photo.append(img!)
                     
            
            tblview.reloadData()
        }
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let mycell: CustomCellTableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomCellTableViewCell
        mycell.ViewInCellOutlet.layer.cornerRadius = 5
        
        ////*******WORKING WITH ARRAY********//
        
       // mycell.lblTask.text = myTask[indexPath.row]
       // mycell.lblDescription.text = Description[indexPath.row]
        
         //********WORKING WITH STRUCT********//
        
        mycell.lblTask.text = structObect.myTask[indexPath.row]
        mycell.lblDescription.text = structObect.Description[indexPath.row]
    mycell.photoImageViewOutlet.image = UIImage(named: img!)
//        if  indexPath.row % 2 == 0
//        {
//       // mycell.photoImageViewOutlet.image = UIImage(named: structObect.photo[indexPath.row])
//            mycell.photoImageViewOutlet.image = UIImage(named: "b.jpg")
//        }
//        else
//        {
//            mycell.photoImageViewOutlet.image = UIImage(named: "c.jpg")
// 
//        }
        return mycell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return structObect.myTask.count
        //return myTask.count
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        index = indexPath.row
        self.cancelbarButtonOutlet.enabled = true
        self.editBarButtonOutlet.enabled = true
        print(index)
        
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let mysegue2: AddTaskController = segue.destinationViewController as! AddTaskController
        if segue.identifier == "editsegue"
        {
            ////*******WORKING WITH ARRAY********//
            //            mysegue2.labelDescriptionText =  Description[index!]
            //            mysegue2.labelTaskText = myTask[index!]
            
            mysegue2.labelDescriptionText =  structObect.Description[index!]
            mysegue2.labelTaskText = structObect.myTask[index!]
            mysegue2.addImage = structObect.photo[index!]
            mysegue2.updateCondition = true
            mysegue2.saveCondition = false
            mysegue2.index2 = index
            
            
            // new addition//
            ////*******WORKING WITH ARRAY********//
            //            mysegue2.forArrayTask = myTask
            //            mysegue2.forArrayDes = Description
            
            //********WORKING WITH STRUCT********//
            
            mysegue2.structObject2 = structObect
            
            
            
        }
        if segue.identifier == "viewController2"
            
        {
            ////*******WORKING WITH ARRAY********//
//            
//            mysegue2.forArrayTask = myTask
//            mysegue2.forArrayDes = Description
            mysegue2.structObject2 = structObect
            
        }
        
    }
    @IBAction func addBarButton(sender: AnyObject)
    {
        performSegueWithIdentifier("viewController2", sender: sender)
    }
    
    
    @IBAction func cancelbarButtonAction(sender: UIBarButtonItem)
    {
        if index != nil
        {
            structObect.myTask.removeAtIndex(index!)
            structObect.Description.removeAtIndex(index!)
            self.cancelbarButtonOutlet.enabled = false
            self.editBarButtonOutlet.enabled = false
            tblview.reloadData()
        }
    }
    
    @IBAction func editBarButtonAction(sender: UIBarButtonItem)
    {
        performSegueWithIdentifier("editsegue", sender: sender)
        
    }
    
    
    
}

