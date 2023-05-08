//
//  WeatherCondition.swift
//  WeatherClone
//
//  Created by David on 2023/4/28.
//

import Foundation
import SwiftUI

enum WeatherCondition: CustomStringConvertible {
    case sunny, cloudy, raining, partlyCloudy, thunderstorm, snowing

    var description: String {
        switch self {
        case .sunny:        return "Sunny"
        case .cloudy:       return "Cloudy"
        case .raining:      return "Raining"
        case .partlyCloudy: return "Mostly Sunny"
        case .thunderstorm: return "Thunderstorm"
        case .snowing:      return "Snowing"
        }
    }

    var systemImageString: String {
        switch self {
        case .sunny:        return "sun.max.fill"
        case .cloudy:       return "cloud.fill"
        case .raining:      return "cloud.rain.fill"
        case .partlyCloudy: return "cloud.sun.fill"
        case .thunderstorm: return "cloud.bolt.rain.fill"
        case .snowing:      return "cloud.snow.fill"
        }
    }
}

extension WeatherCondition {
    @ViewBuilder
    func systemImage() -> some View {
        var image = Image(systemName: systemImageString)

        switch self {
        case .sunny:
            image.foregroundColor(.yellow)
        case .cloudy:
            image.foregroundColor(.white)
        case .raining:
            image.foregroundColor(.white).tint(.blue)
        case .partlyCloudy:
            image.foregroundColor(.white)
        case .thunderstorm:
            image.foregroundColor(.white).tint(.blue)
        case .snowing:
            image.foregroundColor(.white)
        }
    }
}
