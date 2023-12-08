//
//  enumarationsFile.swift
//  StopWatchApp
//
//  Created by Mounika Dara on 08/12/23.
//

import SwiftUI

enum stopWatchMode:String,CodingKey {
    case timing
    case stopped
    case paused
}

enum StorageKeys:String {
    case buttonTitle, lapTime
}

enum StopWatchButtonShapes: String, CodingKey{
    case squareBorderButton, roundedBorderButton, circle, SquareFilledButton, roundedSquareFilledButton, capsule
}
