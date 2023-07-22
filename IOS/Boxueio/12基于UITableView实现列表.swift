@available(iOS 2.0, *)
public class UITableViewController : UIViewController, 
    UITableViewDelegate, UITableViewDataSource { }

class EpisodeListViewController: UITableViewController {

    override func tableView(tableView: UITableView, 
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = 
            tableView.dequeueReusableCellWithIdentifier(
                "EpisodeItem", 
                forIndexPath: indexPath)
        
        return cell;
    }
}

override func tableView(tableView: UITableView, 
    numberOfRowsInSection section: Int) -> Int {
    return 10;
}

override func tableView(tableView: UITableView, 
    cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    // 1. Create the cell object
    let cell = 
        tableView.dequeueReusableCellWithIdentifier(
            "EpisodeItem", forIndexPath: indexPath)
    
    // 2. Get the label object
    let label = cell.viewWithTag(1024) as! UILabel
    
    // 3. Set label text
    label.text = "Episode " + String(indexPath.row)
    
    return cell;
}

class EpisodeListViewController: UITableViewController {
    func getEpisodeListItemData() {
        for i in 0..<10 {
            let e = EpisodeListItem()
            e.title = "Episode \(i)"
            e.finished = Bool(i % 2) ? true : false
            self.episodeListItems.append(e)
        }
    }
}

class EpisodeListViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getEpisodeListItemData()
    }
}

class EpisodeListViewController: UITableViewController {
    override func tableView(tableView: UITableView, 
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("EpisodeItem", 
            forIndexPath: indexPath)
        
        let label = cell.viewWithTag(1024) as! UILabel
        
        label.text = self.episodeListItems[indexPath.row].title
        
        cell.accessoryType = 
            self.episodeListItems[indexPath.row].finished ? .Checkmark : .None
        
        return cell;
    }
}

class EpisodeListViewController: UITableViewController {
    override func tableView(tableView: UITableView, 
        didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

class EpisodeListViewController: UITableViewController {
    // ...

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadEpisodeListItems()
    }
}

class EpisodeListViewController: UITableViewController {
    // ...

    func loadEpisodeListItems() {
        let episodeUrl = fileUrl("EpisodeList.plist");
        
        var error: NSError?
        let fileExist = 
            episodeUrl.checkResourceIsReachableAndReturnError(&error)
        
        if fileExist {
            if let data = NSData(contentsOfURL: episodeUrl) {
                let unarchiver = 
                    NSKeyedUnarchiver(forReadingWithData: data)
                episodeListItems =
                    unarchiver.decodeObjectForKey(
                        "EpisodeListItems") as! [EpisodeListItem]
                
                unarchiver.finishDecoding()
            }
        }
        else {
            getEpisodeListItemData()
            saveEpisodeListItems()
        }
    }

}