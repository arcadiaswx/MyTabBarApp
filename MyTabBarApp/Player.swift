
import UIKit

struct Player {
  var name: String?
  var category: String?
  var rating: Int
  
  init(name: String?, category: String?, rating: Int) {
    self.name = name
    self.category = category
    self.rating = rating
  }
}
