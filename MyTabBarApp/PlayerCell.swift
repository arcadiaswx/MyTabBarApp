

import UIKit

class PlayerCell: UITableViewCell {
  
  @IBOutlet weak var categoryLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var ratingImageView: UIImageView!
  
  var player: Player! {
    didSet {
      categoryLabel.text = player.category
      nameLabel.text = player.name
      ratingImageView.image = imageForRating(player.rating)
    }
  }
  
  func imageForRating(rating:Int) -> UIImage? {
    let imageName = "\(rating)Stars"
    return UIImage(named: imageName)
  }
  
  
}
