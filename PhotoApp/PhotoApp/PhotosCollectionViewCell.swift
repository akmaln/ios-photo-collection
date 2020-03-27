//
//  PhotosCollectionViewCell.swift
//  PhotoApp
//
//  Created by Akmal Nurmatov on 3/26/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let photo = photo else {return}
        
        imageView.image = UIImage(data: photo.imageData)
        nameLabel.text = photo.title 
        
    }
}
