//
//  PhotosCollectionViewController.swift
//  PhotoApp
//
//  Created by Akmal Nurmatov on 3/26/20.
//  Copyright © 2020 Akmal Nurmatov. All rights reserved.
//

import UIKit



class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {fatalError("cell is not a PhotosCollectionViewCell")}
    
        let photo = photoController.photos[indexPath.row]
        cell.photo = photo
    
        return cell
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else {return}
        
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = .lightGray
        case "Blue":
            backgroundColor = .blue
        default:
            break
        }
        view.backgroundColor = backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "SelectThemeModal":
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            destinationVC.themeHelper = themeHelper
        case "AddPhotoDetail":
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
        case "ShowPhotoCell":
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView?.indexPathsForSelectedItems?.first else { return }
            destinationVC.photo = photoController.photos[indexPath.row]
            destinationVC.photoController = photoController
            destinationVC.themeHelper = themeHelper
        default:
            break
        }
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPhotoDetail" {
            guard let addPhotoVC = segue.destination as? PhotoDetailViewController else {return}
            addPhotoVC.photoController = photoController
            addPhotoVC.themeHelper = themeHelper
        } else if segue.identifier == "ShowPhotoCell" {
            guard let showPhotoVC = segue.destination as? PhotoDetailViewController, let index = collectionView.indexPathsForSelectedItems?.first?.row else {return}
            showPhotoVC.themeHelper = themeHelper
            showPhotoVC.photoController = photoController
            showPhotoVC.photo = photoController.photos[index]
        } else if segue.identifier == "SelectThemeModal" {
            guard let selectThemeVC = segue.destination as? ThemeSelectionViewController else {return}
            selectThemeVC.themeHelper = themeHelper 
        }
        
    }
    */
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
