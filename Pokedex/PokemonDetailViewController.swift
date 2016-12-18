//
//  PokemonDetailViewController.swift
//  Pokedex
//
//  Created by elif ece arslan on 12/12/16.
//  Copyright © 2016 KolektifLabs. All rights reserved.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    var poke: Pokemon!
    @IBOutlet weak var nextEvoLabel: UILabel!
    @IBOutlet weak var nextEvoImageView: UIImageView!
    @IBOutlet weak var baseAttackLabel: UILabel!
    @IBOutlet weak var weihtLabel: UILabel!
    @IBOutlet weak var pokedexIDLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var currentEvoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // nam.text = poke.name.capitalized
        
        
        let img = UIImage(named: "\(poke.pokedexID)")
        poke.fetchPokemonDetail { 
        self.updateUI()
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateUI() {
        self.baseAttackLabel.text = poke.attact;
        self.defenseLabel.text = poke.defense;
        self.heightLabel.text = poke.height;
        self.weihtLabel.text = poke.weight;
        
    }

    @IBAction func goToPrevious(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
