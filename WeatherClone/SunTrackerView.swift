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
                    .foregroundColor(.white)
                    .opacity(0.6)

                Text("Sunset".uppercased())
                    .foregroundColor(.white)
                    .opacity(0.6)
                    .font(.system(size: 12, weight: .medium))
            }
            
            Text("6:46PM")
                .foregroundColor(.white)
                .font(.system(size: 36, weight: .medium))
                .shadow(radius: 1.0)

            Spacer()

            ProgressView(value: 0)
                .progressViewStyle(RangeProgressView(range: 0.0...1.0,
                                                     foregroundColors: [.blue],
                                                     backgroundColor: .gray))
                .frame(maxHeight: 5.0)

            Spacer()

            Text("Sunrise: 7:48AM")
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .medium))
                .shadow(radius: 1.0)
        }
        .padding()
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
