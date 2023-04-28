//
//  WeatherSnapshot.swift
//  WeatherClone
//
//  Created by David on 2023/4/28.
//

import Foundation
import SwiftUI

struct WeatherSnapshot: Identifiable {
    let id = UUID()
    let time: Date
    let condition: WeatherCondition
    let temperature: Temperature
}
