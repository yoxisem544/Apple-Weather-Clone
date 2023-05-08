//
//  AirQualityView.swift
//  WeatherClone
//
//  Created by David on 2023/5/8.
//

import SwiftUI

struct AirQualityView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Image(systemName: "aqi.low")
                    .foregroundColor(.currentTheme.sectionHeaderColor)

                Text("Air quality".uppercased())
                    .foregroundColor(.currentTheme.sectionHeaderColor)
                    .font(.system(size: 12, weight: .medium))
            }
            .padding(.bottom, 10)

            Text("24 - Good")
                .foregroundColor(.white)
                .font(.system(size: 24, weight: .bold))
                .shadow(radius: 1.0)
                .padding(.bottom, 10)

            Text("Air quality index is 24, which is similar to yesterdat at about this time.")
                .foregroundColor(.white)
                .font(.system(size: 13, weight: .medium))
                .shadow(radius: 1.0)
                .padding(.bottom, 32)
            
            ProgressView(value: 0)
                .progressViewStyle(
                    RangeProgressView(
                        range: 0.0...1.0,
                        foregroundColor: AnyShapeStyle(uvGradient),
                        backgroundColor: .gray
                    )
                )
                .frame(maxHeight: 5.0)
                .padding(.bottom, 8)
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16))
    }

    var uvGradient: LinearGradient {
        LinearGradient(
            colors: [
                .green,
                .yellow,
                .orange,
                .red,
                .purple
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}

struct AirQualityView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AirQualityView()
            Spacer()
        }
        .padding()
        .background(.blue)
    }
}
