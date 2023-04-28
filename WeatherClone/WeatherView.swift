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
                WeatherSummaryView(viewModel: wsvm)
                    .padding(.top, 40)
                    .padding(.bottom, 40)

                HourlyForcastView(viewModel: .mock)

                DailyForcastView()
            }
            .padding(.horizontal)
        }
        .background(.blue)
    }

    var wsvm: WeatherSummaryView.ViewModel { .mockData }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
