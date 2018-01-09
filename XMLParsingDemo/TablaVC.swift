//
//  TablaVC.swift
//  XMLParsingDemo
//
//  Created by Henry AT on 8/12/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

import UIKit

class TablaVC: UITableViewController, XMLParserDelegate {

  var parser = XMLParser()  // Objeto para parsear XML
  var posts = NSMutableArray()  // Arreglo donde guardare mis datos
  var elements = NSMutableDictionary()
  var element = NSString()
  var title1 = NSMutableString()
  var date = NSMutableString()

  
  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
      self.beginParsing()  // llamamos ala funcion
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return posts.count
    }



    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) 

        // Configure the cell...
      cell.textLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "title") as! String
      cell.detailTextLabel?.text = (posts.object(at: indexPath.row) as AnyObject).value(forKey: "date") as! String
      return cell

    }


  
  
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
  
  
  
  
  
  
  func beginParsing()
  {
    posts = []
    
    let url = URL(string: "http://images.apple.com/main/rss/hotnews/hotnews.rss")
    parser = XMLParser(contentsOf: url!)
 !e()
    self.tableView.reloadData()
 }

  

  func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [AnyHashable: Any]) {
    element = elementName as NSString
    if (elementName as NSString).isEqual(to: "item")
    {
      elements = NSMutableDictionary.alloc()
      elements = [:]
      title1 = NSMutableString.alloc()
      title1 = ""
      date = NSMutableString.alloc()
      date = ""
    }

  }
  
  
  
  
  
  func parser(_ parser: XMLParser, foundCharacters string: String?) {
    if element.isEqual(to: "title") {
      title1.append(string!)
    } else if element.isEqual(to: "pubDate") {
      date.append(string!)
    }
  }
  
  
  func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    
    if (elementName as NSString).isEqual(to: "item") {
      if !title1.isEqual(nil) {
        elements.setObject(title1, forKey: "title" as NSCopying)
      }
      if !date.isEqual(nil) {
        elements.setObject(date, forKey: "date" as NSCopying)
      }
      posts.add(elements)
    }

  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

}
