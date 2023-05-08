//
//  Temperature.swift
//  WeatherClone
//
//  Created by David on 2023/4/28.
//

import Foundation

enum Temperature {
    static let degreeSymobl = "°"

    case F(_ value: Int)
    case C(_ value: Int)

    var valueInF: Int {
        switch self {
        case .F(let v):
            return v
        case .C(let v):
            return Int((Double(v) * 1.8 + 32).rounded())
        }
    }

    var valueInC: Int {
        switch self {
        case .F(let v):
            return Int((Double(v - 32) * 0.55556).rounded())
        case .C(let v):
            return v
        }
    }

    var celciusString: String {
        "\(valueInC)" + Temperature.degreeSymobl
    }

    var fahrenheitString: String {
        "\(valueInF)" + Temperature.degreeSymobl
    }
}
