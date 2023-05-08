//
//  UVIndexView.swift
//  WeatherClone
//
//  Created by David on 2023/5/4.
//

import SwiftUI

struct UVIndexView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "sun.max.fill")
                    .foregroundColor(.currentTheme.sectionHeaderColor)

                Text("UV Index".uppercased())
                    .foregroundColor(.currentTheme.sectionHeaderColor)
                    .font(.system(size: 12, weight: .medium))
            }

            Text("0")
                .foregroundColor(.white)
                .font(.system(size: 36, weight: .medium))
                .shadow(radius: 1.0)

            Text("Low")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .medium))
                .shadow(radius: 1.0)

            Spacer()

            ProgressView(value: 0)
                .progressViewStyle(
                    RangeProgressView(
                        range: 0.0...1.0,
                        foregroundColor: AnyShapeStyle(uvGradient),
                        backgroundColor: .gray
                    )
                )
                .frame(maxHeight: 5.0)

            Spacer()

            Text("Use sun protection 11AM-4PM.")
                .lineLimit(nil)
                .foregroundColor(.white)
                .font(.system(size: 12, weight: .medium))
                .shadow(radius: 1.0)
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

struct UVIndexView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            HStack {
                UVIndexView()
                    .aspectRatio(1, contentMode: .fill)
                UVIndexView()
                    .aspectRatio(1, contentMode: .fill)
            }
        }
        .padding()
        .background(.blue)
    }
}
