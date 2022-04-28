//
//  debouncer.swift
//  movie-app
//
//  Created by Matúš Klasovitý on 25/04/2022.
//

import Foundation

// Source: https://daddycoding.com/2020/03/10/ios-tutorial-debounce-your-network-call/


public class Debouncer: NSObject {
    public var callback: (() -> Void)
    public var delayInSeconds: Double
    public weak var timer: Timer?

    public init(delayInSeconds: Double, callback: @escaping (() -> Void)) {
        self.delayInSeconds = delayInSeconds
        self.callback = callback
    }

    public func call() {
        timer?.invalidate()
        let nextTimer = Timer.scheduledTimer(timeInterval: delayInSeconds, target: self, selector: #selector(Debouncer.fireNow), userInfo: nil, repeats: false)
        timer = nextTimer
    }

    @objc func fireNow() {
        self.callback()
    }
}
