

import UIKit

class PlayersViewController: UITableViewController {
  
  var players:[Player] = playersData
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return players.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)
    -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("PlayerCell", forIndexPath: indexPath)
        as! PlayerCell
      
      let player = players[indexPath.row] as Player
      cell.player = player
      return cell
  }
  
  // Mark Unwind Segues
  @IBAction func cancelToPlayersViewController(segue:UIStoryboardSegue) {
  }
  
  @IBAction func savePlayerDetail(segue:UIStoryboardSegue) {
    if let playerDetailsViewController = segue.sourceViewController as? PlayerDetailsViewController {
      
      //add the new player to the players array
      if let player = playerDetailsViewController.player {
        players.append(player)
        
        //update the tableView
        let indexPath = NSIndexPath(forRow: players.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
      }
    }
  }
}
