//
//  PhotoController.swift
//  PhotoApp
//
//  Created by Akmal Nurmatov on 3/26/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(data: Data, title: String) {
        let newPhoto: Photo = Photo(imageData: data, title: title)
        
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, data: Data, string: String) {
        guard let index = photos.firstIndex(of: photo) else {return}
        
        var scratch = photo
        
        scratch.imageData = data
        scratch.title = string
        
        photos.remove(at: index)
        photos.append(scratch) 
        
    }
}
