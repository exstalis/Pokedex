//
//  Pokemon.swift
//  Pokedex
//
//  Created by elif ece arslan on 12/9/16.
//  Copyright © 2016 KolektifLabs. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexID: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvoTxt: String!
    private var _pokeURL: String!
    // use Nil-Coalescing Operator to unwrap optionals babe :D
    //It is shorthand for the code below:
    // a != nil ? a! : b
    // a! ?? b
    var name: String {
        return _name ?? ""
    }
    var pokedexID: Int {
        return _pokedexID ?? 0
    }
    var description: String {
        return _description != nil ? _description : ""
    }
    var type: String {
        return _type != nil ? _type : ""
    }
    var defense: String {
        return _defense != nil ? _defense : ""
    }
    var height: String {
        return _height != nil ? _height : ""
    }
    var weight: String {
        return _weight != nil ? _weight : ""
    }
    var attact: String {
        return _attack != nil ? _attack : ""
    }
    var nextEvoTxt: String {
        return _nextEvoTxt != nil ? _nextEvoTxt : ""
    }
    var pokeURL: String {
        return _pokeURL != nil ? _pokeURL : ""
    }
    
    init(name: String, pokedexID: Int) {
        self._name = name
        self._pokedexID = pokedexID
        self._pokeURL = "\(BASE_URL)\(POKEMON_URL)\(self._pokedexID)"
    }
    
    func fetchPokemonDetail (completed: @escaping DownloadComplete) {
        Alamofire.request(_pokeURL).responseJSON { (response) in
            print ("JSON Response: \(response.result.value)")
            let JSON = response.result.value
            if let dict = JSON as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                if let height = dict["height"] as? String {
                    self._height = height
                }
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                print("weight: \(self._weight)")
                print("height: \(self._height)")
                print("attack: \(self._attack)")
                print("defense: \(self._defense)")
            }
            completed()
        }
    }

}
