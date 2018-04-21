//
//  ImageTableViewCell.swift
//  GCDTableViewController
//
//  Created by macbook air on 20/04/2018.
//  Copyright © 2018 Lytkin Artem. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
  
  @IBOutlet weak var tweetImage: UIImageView!
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  
  //MARK: - Public API
  var imageURL: URL? {
    didSet {
      tweetImage.image = nil
      updateUI()
    }
  }
  
  private func updateUI() {
    if let url = imageURL
    {
      spinner.startAnimating()
      DispatchQueue.global(qos: .utility).async
        {
        let contentOfURL = try? Data(contentsOf: url)
          if let imageData = contentOfURL
          {
            let image = UIImage(data: imageData)
            DispatchQueue.main.async
              {
                if (url == self.imageURL)
                {
                  self.tweetImage.image = image
                  self.spinner?.stopAnimating()
                }
            }
          }
      }
    }
  }

}
