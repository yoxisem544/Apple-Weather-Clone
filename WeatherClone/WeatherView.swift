//
//  WeatherView.swift
//  WeatherClone
//
//  Created by David on 2023/4/19.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ScrollView{
            VStack {
                WeatherSummaryView()
                    .padding(.top, 40)
                    .padding(.bottom, 40)

                HourlyForcastView()

                DailyForcastView()
            }
            .padding(.horizontal)
        }
        .background(.blue)
    }

}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
