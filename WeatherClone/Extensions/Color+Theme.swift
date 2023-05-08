//
//  Color+Theme.swift
//  WeatherClone
//
//  Created by David on 2023/5/8.
//

import Foundation
import SwiftUI

extension Color {
    struct Theme {
        let sectionHeaderColor = Color(red: 0.54, green: 0.77, blue: 0.99)
    }

    static var currentTheme: Theme {
        Theme()
    }
}
