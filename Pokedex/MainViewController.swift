//
//  MainViewController.swift
//  Pokedex
//
//  Created by elif ece arslan on 12/9/16.
//  Copyright © 2016 KolektifLabs. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemons = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    var filteredPokemons = [Pokemon]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        parsePokemonCSV()
        initAudio()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func initAudio(){
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")
        do {
           musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path!)!)
        } catch let _error as NSError {
            print(_error.debugDescription)
        }
    }
    
    func parsePokemonCSV() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            for row in rows{
                let pokeID = Int(row["id"]!)!
                let name = row["identifier"]!
                let poke = Pokemon(name: name, pokedexID: pokeID)
                pokemons.append(poke)
            }
        }catch let _error as NSError{
            print(_error.debugDescription)
        }
    }
    @IBAction func onMusicButton(_ sender:UIButton) {
        if musicPlayer.isPlaying {
            musicPlayer.pause()
            sender.alpha = 0.2
        }else {
            musicPlayer.play()
            sender.alpha = 1.0

        }
    }
}




private typealias CollectionDelegate = MainViewController
extension CollectionDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}


private typealias CollectionDelegateFlowLayout = MainViewController
extension CollectionDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
    
}

private typealias CollectionDataSource = MainViewController
extension CollectionDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"PokeCell", for: indexPath) as? PokeCell {
//            let pokemon = Pokemon(name: "pokemon", pokedexID: indexPath.row)
//            let poke = pokemons[indexPath.row]
            let poke: Pokemon!
            if inSearchMode {
                poke = filteredPokemons[indexPath.row]
                cell.configureCell(poke)

            }else {
                poke = pokemons[indexPath.row]
                cell.configureCell(poke)

            }
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if inSearchMode {
            return filteredPokemons.count

        }
        return pokemons.count
    }
}

private typealias SearchBarDelegate = MainViewController
extension SearchBarDelegate: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            view.endEditing(true)
            collection.reloadData()

        }else{
            inSearchMode = true
            let lower = searchBar.text!.lowercased()
            filteredPokemons = pokemons.filter({$0.name.range(of: lower) != nil} )
            collection.reloadData()

        }

    }
}
