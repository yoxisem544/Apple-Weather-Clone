//
//  WeatherSummaryView.swift
//  WeatherClone
//
//  Created by David on 2023/4/19.
//

import SwiftUI

struct WeatherSummaryView: View {
    var body: some View {
        VStack {
            Text("Gukeng Township")
                .font(.system(size: 32))

            Text("25°")
                .font(.system(size: 100))
                .fontWeight(.thin)

            Text("Cloudy")
                .font(.system(size: 20))
                .fontWeight(.medium)

            Text("H:33° L:23°")
                .font(.system(size: 20))
                .fontWeight(.medium)
        }
        .foregroundColor(.white)
        .shadow(radius: 10)
    }
}

struct WeatherSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            WeatherSummaryView()
                .padding(.top, 60)
        }
        .frame(maxWidth: .infinity)
        .background(.blue)
    }
}
