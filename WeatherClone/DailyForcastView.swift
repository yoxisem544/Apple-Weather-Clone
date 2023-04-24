//
//  DailyForcastView.swift
//  WeatherClone
//
//  Created by David on 2023/4/19.
//

import SwiftUI

struct DailyForcastView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "calendar")
                Text("10-day Forcast".uppercased())
                    .font(.system(size: 12))
                    .fontWeight(.medium)
            }
            .foregroundColor(.white)
            .opacity(0.6)
            .frame(maxWidth: .infinity, alignment: .leading)

            Divider()

            VStack {
                ForEach(1...10, id: \.self) { element in
                    HStack {
                        Text("Today")
                            .foregroundColor(.white)

                        Spacer()

                        Image(systemName: "sun.max.fill")
                            .foregroundColor(.yellow)

                        Spacer()
                            .frame(maxWidth: 50)

                        Text("23°")
                            .foregroundColor(.white)
                            .opacity(0.6)

                        RangeProgressView()
                            .frame(maxWidth: 100)

                        Text("23°")
                            .foregroundColor(.white)
                    }

                    Divider()
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct DailyForcastView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            DailyForcastView()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue)
    }
}