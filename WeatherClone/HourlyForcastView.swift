//
//  HourlyForcastView.swift
//  WeatherClone
//
//  Created by David on 2023/4/19.
//

import SwiftUI

struct HourlyForcastView: View {
    var body: some View {
        VStack {
            Text("Rainy conditions from 10PM-12AM, with thunderstorm expected at 4AM.")
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
                    ForEach(1...24, id: \.self) { element in
                        VStack {
                            Text("\(element)")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            Image(systemName: "sun.max.fill")
                                .foregroundColor(.yellow)
                                .padding(.vertical, 6)

                            Text("25°")
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
            HourlyForcastView()
        }
        .padding()
        .background(.blue)
    }
}
