//
//  RangeProgressView.swift
//  WeatherClone
//
//  Created by David on 2023/4/19.
//

import SwiftUI

struct RangeProgressView: View {
    var body: some View {
        ProgressView(value: 0.5, total: 1)
    }
}

struct RangeProgressView_Previews: PreviewProvider {
    static var previews: some View {
        RangeProgressView()
    }
}
