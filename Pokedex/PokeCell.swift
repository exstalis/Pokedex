//
//  PokeCell.swift
//  Pokedex
//
//  Created by elif ece arslan on 12/9/16.
//  Copyright © 2016 KolektifLabs. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 8.0
        
    }
    
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon 
        nameLabel.text = self.pokemon.name.capitalized
        thumbnailImageView.image = UIImage(named: "\(self.pokemon.pokedexID)")
        
    }
    
    
    
}
