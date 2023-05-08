//
//  SunTrackerView.swift
//  WeatherClone
//
//  Created by David on 2023/5/4.
//

import SwiftUI

struct SunTrackerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "sunset.fill")
                    .foregroundColor(.currentTheme.sectionHeaderColor)

                Text("Sunset".uppercased())
                    .foregroundColor(.currentTheme.sectionHeaderColor)
                    .font(.system(size: 12, weight: .medium))
            }
            .padding(.top, 12)
            .padding(.horizontal)
            
            Text("6:46PM")
                .foregroundColor(.white)
                .font(.system(size: 36, weight: .medium))
                .shadow(radius: 1.0)
                .padding(.horizontal)
                .padding(.top, 2)

            Spacer()

            WaveView(
                dayColor: Color(red: 0.65, green: 0.77, blue: 0.89),
                nightColor: Color(red: 0.28, green: 0.45, blue: 0.63),
                sunColor: .white,
                horizonColor: Color(red: 0.69, green: 0.78, blue: 0.88)
            )

            Spacer()

            Text("Sunrise: 7:48AM")
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .medium))
                .shadow(radius: 1.0)
                .padding([.leading, .trailing, .bottom])
                .padding(.top, 6)
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }
}

struct SunTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            HStack {
                SunTrackerView()
                    .aspectRatio(1, contentMode: .fill)
                SunTrackerView()
                    .aspectRatio(1, contentMode: .fill)
            }
        }
        .padding()
        .background(.blue)
    }
}
