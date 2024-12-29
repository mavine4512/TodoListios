//
//  HeaderView.swift
//  ToDoListIos
//
//  Created by Mavine Naaman on 15/11/2024.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    let offset: Double
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }.padding(.top, 30)
        }
        .frame( width: UIScreen.main.bounds.width * 3,
                height: 180
        )
        .offset(y:CGFloat(offset))
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView( title: "Title",
                    subtitle: "Subtitle",
                    angle: 15,
                    background: .blue,
                    offset: -150
        )
    }
}
