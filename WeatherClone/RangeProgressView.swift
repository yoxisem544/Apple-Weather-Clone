//
//  RangeProgressView.swift
//  WeatherClone
//
//  Created by David on 2023/4/19.
//

import SwiftUI

struct RangeProgressView: ProgressViewStyle {

    let range: ClosedRange<Double>
    let foregroundColors: [Color]
    let backgroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(backgroundColor)

                Capsule()
                    .fill(LinearGradient(colors: foregroundColors, startPoint: .leading, endPoint: .trailing))
                    .frame(width: proxy.size.width * fillWidthScale)
                    .offset(x: proxy.size.width * range.lowerBound)

                Circle()
                    .foregroundColor(backgroundColor)
                    .frame(width: proxy.size.height + 4, height: proxy.size.height + 4)
                    .position(
                        x: proxy.size.width * (configuration.fractionCompleted ?? 0),
                        y: proxy.size.height / 2
                    )

                Circle()
                    .foregroundColor(.white)
                    .position(
                        x: proxy.size.width * (configuration.fractionCompleted ?? 0),
                        y: proxy.size.height / 2
                    )
            }
            .clipped()
        }
    }

    var fillWidthScale: Double {
        let normalizedRange = range.upperBound - range.lowerBound
        return normalizedRange

    }
}

struct RangeProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                ForEach(0...10, id: \.self) { n in
                    ProgressView(value: 0.5)
                        .frame(height: 10)
                        .progressViewStyle(RangeProgressView(
                            range: 0.0...(Double(n) / 10.0),
                            foregroundColors: [.blue, .purple],
                            backgroundColor: .green
                        ))
                        .padding()
                }
                ForEach(0...10, id: \.self) { n in
                    ProgressView(value: 0.5)
                        .frame(height: 10)
                        .progressViewStyle(RangeProgressView(
                            range: (Double(n) / 10.0)...1.0,
                            foregroundColors: [.blue, .purple],
                            backgroundColor: .green
                        ))
                        .padding()
                }
                ForEach(0...5, id: \.self) { n in
                    ProgressView(value: 0.5)
                        .frame(height: 10)
                        .progressViewStyle(RangeProgressView(
                            range: (Double(n) / 10.0)...(Double(10-n) / 10.0),
                            foregroundColors: [.blue, .purple],
                            backgroundColor: .green
                        ))
                        .padding()
                }
            }
        }
    }
}
