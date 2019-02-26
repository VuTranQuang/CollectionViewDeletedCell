//
//  CollectionViewCell.swift
//  CollectionViewDeletedCell
//
//  Created by Vũ on 2/26/19.
//  Copyright © 2019 Vũ. All rights reserved.
//

import UIKit
protocol CollectionViewCellDelegate: class {
    func deleteCell(cell: CollectionViewCell)
}

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var deleteButtonBackgroundView: UIVisualEffectView!
    var delegate: CollectionViewCellDelegate?
    @IBOutlet weak var imageCell: UIImageView! {
        didSet {
            
            deleteButtonBackgroundView.layer.cornerRadius = deleteButtonBackgroundView.bounds.width/2
            deleteButtonBackgroundView.layer.masksToBounds = true
            deleteButtonBackgroundView.isHidden = !isEditing
        }
    }
    var isEditing: Bool = false {
        didSet {
            deleteButtonBackgroundView.isHidden = !isEditing
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        delegate?.deleteCell(cell: self)
    }
}
