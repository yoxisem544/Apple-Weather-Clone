//
//  WeatherSummaryView.swift
//  WeatherClone
//
//  Created by David on 2023/4/19.
//

import SwiftUI

struct WeatherSummaryView: View {

    @StateObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text(viewModel.locationName)
                .font(.system(size: 32))

            Text(viewModel.currentTemp.fahrenheitString)
                .font(.system(size: 100))
                .fontWeight(.thin)

            Text(viewModel.currentWeatherCondition.description)
                .font(.system(size: 20))
                .fontWeight(.medium)

            Text("H:\(viewModel.currentDayHighTemp.fahrenheitString) L:\(viewModel.currentDayLowTemp.fahrenheitString)")
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
            WeatherSummaryView(viewModel: mockViewModel)
                .padding(.top, 60)
        }
        .frame(maxWidth: .infinity)
        .background(.blue)
    }

    static var mockViewModel: WeatherSummaryView.ViewModel {
        .mockData
    }
}

extension WeatherSummaryView {

    class ViewModel: ObservableObject {
        let locationName: String
        let currentTemp: Temperature
        let currentWeatherCondition: WeatherCondition
        let currentDayHighTemp: Temperature
        let currentDayLowTemp: Temperature

        init(
            locationName: String,
            currentTemp: Temperature,
            currentWeatherCondition: WeatherCondition,
            currentDayHighTemp: Temperature,
            currentDayLowTemp: Temperature
        ) {
            self.locationName = locationName
            self.currentTemp = currentTemp
            self.currentWeatherCondition = currentWeatherCondition
            self.currentDayHighTemp = currentDayHighTemp
            self.currentDayLowTemp = currentDayLowTemp
        }
    }
}

extension WeatherSummaryView.ViewModel {
    static var mockData: WeatherSummaryView.ViewModel {
        return WeatherSummaryView.ViewModel(
            locationName: "Olmos Oark",
            currentTemp: .F(68),
            currentWeatherCondition: .partlyCloudy,
            currentDayHighTemp: .F(72),
            currentDayLowTemp: .F(52)
        )
    }
}
