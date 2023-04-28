//
//  HourlyForcastView.swift
//  WeatherClone
//
//  Created by David on 2023/4/19.
//

import SwiftUI

struct HourlyForcastView: View {

    @StateObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text(viewModel.currentWeatherSummary)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.horizontal, 16)
                .frame(maxWidth: .infinity, alignment: .leading)

            Divider()
                .padding(.leading, 16)
                .padding(.top, 6)
                .padding(.bottom, 10)

            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.hourlySnapshots) { snapshot in
                        VStack {
                            Text("Now")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            snapshot.condition.systemImage()
                                .padding(.vertical, 6)

                            Text(snapshot.temperature.fahrenheitString)
                                .font(.system(size: 20))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 12)
                    }
                }
            }
            .scrollIndicators(.never)
        }
        .padding(.vertical, 16)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct HourlyForcastView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            HourlyForcastView(viewModel: .mock)
        }
        .padding()
        .background(.blue)
    }
}

extension HourlyForcastView {
    class ViewModel: ObservableObject {
        let currentWeatherSummary: String
        let hourlySnapshots: [WeatherSnapshot]

        init(currentWeatherSummary: String, hourlySnapshots: [WeatherSnapshot]) {
            self.currentWeatherSummary = currentWeatherSummary
            self.hourlySnapshots = hourlySnapshots
        }
    }
}

extension HourlyForcastView.ViewModel {
    static var mock: HourlyForcastView.ViewModel {
        let currentDate = Date.now
        let hour: TimeInterval = 3600

        return HourlyForcastView.ViewModel(
            currentWeatherSummary: "Rainy conditions from 10PM-12AM, with thunderstorm expected at 4AM.",
            hourlySnapshots: [
                WeatherSnapshot(
                    time: currentDate,
                    condition: .sunny,
                    temperature: .F(68)
                ),
                WeatherSnapshot(
                    time: currentDate.addingTimeInterval(1 * hour),
                    condition: .sunny,
                    temperature: .F(70)
                ),
                WeatherSnapshot(
                    time: currentDate.addingTimeInterval(2 * hour),
                    condition: .cloudy,
                    temperature: .F(62)
                ),
            ]
        )
    }
}
