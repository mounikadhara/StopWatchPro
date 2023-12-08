//
//  StopWatchButtons.swift
//  StopWatchApp
//
//  Created by Mounika Dara on 08/12/23.
//

import SwiftUI

struct LapsModel: Identifiable, Codable{
    var id = UUID()
    var lap: String
    
    init(_ lap: String) {
        self.lap = lap
    }
    
}
