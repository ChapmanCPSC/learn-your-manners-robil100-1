//
//  ViewController.swift
//  Robillard Manner
//
//  Created by Daniel Corona on 4/17/16.
//  Copyright © 2016 Matt Robillard. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UITableViewController, MFMailComposeViewControllerDelegate {
    

    var manners : [Manner] = [
        
        Manner(image: UIImage(named: "Thank You")!, name: "Thank You", description: "When receiving something, say 'Thank you.' Be especially appreciative and say 'thank you' for any gift you receive."),
        Manner(image: UIImage(named: "Sneezing")!, name: "Sneezing", description: "Cover your mouth when you cough or sneeze, and don't pick your nose in public."),
        Manner(image: UIImage(named: "The Golden Rule")!, name: "The Golden Rule", description: "Treat others the way you'd like to be treated."),
        Manner(image: UIImage(named: "Table Manners")!, name: "Table Manners", description: "Use eating utensils properly. If you are unsure how to do so, ask someone to teach you or watch what people you respect do.  Keep a napkin on your lap; use it to wipe your mouth when necessary."),
        Manner(image: UIImage(named: "Excuse Me")!, name: "Excuse Me", description: "If you do need to get somebody's attention right away, the phrase 'excuse me' is the most polite way for you to enter the conversation."),
        Manner(image: UIImage(named: "Knocking")!, name: "Knocking", description: "Knock on closed doors -- and wait to see if there's a response -- before entering."),
        Manner(image: UIImage(named: "Talking on the Phone")!, name: "Talking on the Phone", description: "When you make a phone call, introduce yourself first and then ask if you can speak with the person you are calling."),
        Manner(image: UIImage(named: "Bad Words")!, name: "Bad Words", description: "Never use foul language in front of people if you don't know if it will bother them.")
    ]
    
    var selectedManners : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let cellNib = UINib(nibName: "MannerTableViewCell", bundle: nil)
        self.tableView.registerNib(cellNib, forCellReuseIdentifier: "detail_view")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.manners.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let manner = self.manners[indexPath.row]
    
        let cell = tableView.dequeueReusableCellWithIdentifier("detail_view") as! MannerTableViewCell
        cell.initManner(manner)
    
        return cell
        
    }
    
    @IBOutlet weak var testLabel: UILabel!
    
    
    //bring page for user to set recipient email
    @IBAction func setEmailButton(sender: UIButton) {
        let navVC = self.storyboard!.instantiateViewControllerWithIdentifier("email_view") as! EmailViewController
        
        
        self.presentViewController(navVC, animated: true, completion: nil)
    }
    
    //email the results
    @IBAction func sendResultsButton(sender: AnyObject)
    {
        let composeEmailVC = MFMailComposeViewController()
        composeEmailVC.mailComposeDelegate = self
        
        let userDefaults = NSUserDefaults()
        
        composeEmailVC.setToRecipients([userDefaults.stringForKey("Email")!])
        composeEmailVC.setSubject("Manners App Summary")
        
        var messageBody : String
        
        if selectedManners[0] == ""
        {
            messageBody = "No manners have been viewed"
        }
        else
        {
            messageBody = "The following manners have been reviewed:" + "\r\n"
            
            for m in selectedManners
            {
                messageBody = messageBody + m + "\r\n"
            }
        }
        
        composeEmailVC.setMessageBody(messageBody, isHTML: false)
        
        self.presentViewController(composeEmailVC, animated: true, completion: nil)

    }

    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
        tableView.cellForRowAtIndexPath(indexPath)?.tintColor = UIColor.whiteColor()
        tableView.cellForRowAtIndexPath(indexPath)?.backgroundColor = UIColor.greenColor()

        
        let navVC = self.storyboard!.instantiateViewControllerWithIdentifier("detail_view") as! UINavigationController
        
        let detailVC = navVC.viewControllers[0] as! MannerDetailViewController
        detailVC.m = self.manners[indexPath.row]
        
        selectedManners.append(detailVC.m.name)
        
        self.presentViewController(navVC, animated: true, completion: nil)
    
    }

}

