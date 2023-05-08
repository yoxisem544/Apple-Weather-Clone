//
//  WaveView.swift
//  WeatherClone
//
//  Created by David on 2023/5/7.
//

import SwiftUI

struct WaveView: View {

    let dayColor: Color
    let nightColor: Color
    let sunColor: Color
    let horizonColor: Color
    let waveStrokeWidth: CGFloat = 4.0
    let horizonStrokeWidth: CGFloat = 1.0

    var body: some View {
        VStack {
            GeometryReader { proxy in
                Wave()
                    .stroke(nightColor, lineWidth: waveStrokeWidth)

                Wave()
                    .stroke(dayColor, lineWidth: waveStrokeWidth)
                    .mask {
                        GeometryReader { innerProxy in
                            Rectangle()
                                .frame(
                                    width: innerProxy.size.width,
                                    height: innerProxy.size.height / 2
                                )
                        }
                    }

                Rectangle()
                    .frame(height: horizonStrokeWidth)
                    .position(
                        x: proxy.size.width / 2,
                        y: proxy.size.height / 2
                    )
                    .foregroundColor(horizonColor)

                Circle()
                    .frame(width: 12)
                    .position(
                        Wave.point(
                            for: proxy.size.width / 3,
                            in: CGRect(origin: .zero, size: proxy.size)
                        )
                    )
                    .foregroundColor(sunColor)
                    .shadow(color: sunColor, radius: 6)
            }
        }
    }
}

struct Wave: Shape {

    let resolution = 10
    let amplitude = 1

    static func point(for x: CGFloat, in rect: CGRect) -> CGPoint {
        let freq = 2 * Double.pi
        let wavelength = rect.width / CGFloat(freq)
        let relativeX = x / wavelength
        let h = rect.height / 2
        let y = cos(relativeX) * h + rect.midY

        return CGPoint(x: x, y: y)
    }

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        let startPoint = CGPoint(x: rect.minX, y: rect.midY)
        path.move(to: startPoint)

        for x in stride(from: 0, through: rect.width, by: 1) {
            let point = Wave.point(for: x, in: rect)

            if x == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }

        return Path(path.cgPath)
    }
}

struct WaveView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                WaveView(
                    dayColor: Color(red: 0.65, green: 0.77, blue: 0.89),
                    nightColor: Color(red: 0.28, green: 0.45, blue: 0.63),
                    sunColor: .white,
                    horizonColor: Color(red: 0.69, green: 0.78, blue: 0.88)
                )
                WaveView(
                    dayColor: Color(red: 0.65, green: 0.77, blue: 0.89),
                    nightColor: Color(red: 0.28, green: 0.45, blue: 0.63),
                    sunColor: .white,
                    horizonColor: Color(red: 0.69, green: 0.78, blue: 0.88)
                )
            }
            HStack {
                WaveView(
                    dayColor: Color(red: 0.65, green: 0.77, blue: 0.89),
                    nightColor: Color(red: 0.28, green: 0.45, blue: 0.63),
                    sunColor: .white,
                    horizonColor: Color(red: 0.69, green: 0.78, blue: 0.88)
                )
                WaveView(
                    dayColor: Color(red: 0.65, green: 0.77, blue: 0.89),
                    nightColor: Color(red: 0.28, green: 0.45, blue: 0.63),
                    sunColor: .white,
                    horizonColor: Color(red: 0.69, green: 0.78, blue: 0.88)
                )
            }
        }
        .background(.gray)
    }
}
