//
//  Rank.swift
//  DASO
//
//  Created by Trinh Ta on 1/4/18.
//  Copyright © 2018 Trinh Ta. All rights reserved.
//

import Foundation


struct Rank {
    var name: String!;
    var score: Int!;
    var rank: Int!;
    
    static func createSameple() ->[Rank] {
        let rank = Rank(name: "Sanchez", score: 7635, rank: 347);
        let rank1 = Rank(name: "Ozil", score: 7856, rank: 348);
        let rank2 = Rank(name: "Ramsey", score: 7432, rank: 349);
        let rank3 = Rank(name: "Lacazette", score: 7410, rank: 350);
        let rank4 = Rank(name: "Stansell", score: 7325, rank: 351);
        let rank5 = Rank(name: "Giroud", score: 7320, rank: 352);
        
        let array: [Rank] = [rank, rank1,rank2, rank3, rank4,rank5];
        
        return array;
        
        
        
        
        
        
        
    }
    
    
    
}
