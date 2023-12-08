//
//  StopWatchButtons.swift
//  StopWatchApp
//
//  Created by Mounika Dara on 08/12/23.
//

import SwiftUI

class StopWatch: ObservableObject {
    
    @AppStorage("timeElapsedFormatted") var timeElapsedFormatted = "00:00:00" {
            didSet {
                objectWillChange.send()
            }
        }
    @AppStorage("mode") var mode: stopWatchMode = .stopped {
            didSet {
                objectWillChange.send()
            }
        }
    @AppStorage("secondsElapsed") var secondsElapsed  = 0.0 {
            didSet {
                objectWillChange.send()
            }
        }
    var completedSecondsElapsed = 0.0
    var timer = Timer()

    func start() {
        self.mode = .timing
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
        self.secondsElapsed += 0.01
        self.formatTime()
        }
    }

    func stop() {
        timer.invalidate()
        self.mode = .stopped
        self.completedSecondsElapsed = self.secondsElapsed
        self.secondsElapsed = 0.0
        self.timeElapsedFormatted = "00:00:00"
    }

    func pause() {
        timer.invalidate()
        self.mode = .paused
    }

    func formatTime() {
        let minutes: Int32 = Int32(self.secondsElapsed/60)
        let minutesString =  (minutes < 10) ? "0\(minutes)" : "\(minutes)"
        let seconds: Int32 = Int32(self.secondsElapsed) - (minutes * 60)
        let secondsString = (seconds < 10) ? "0\(seconds)" : "\(seconds)"
        let milliseconds: Int32 = Int32(self.secondsElapsed.truncatingRemainder(dividingBy: 1) * 100)
        let millisecondsString = (milliseconds < 10) ? "0\(milliseconds)" : "\(milliseconds)"
        self.timeElapsedFormatted = minutesString + ":" + secondsString + ":" + millisecondsString
    }
}

