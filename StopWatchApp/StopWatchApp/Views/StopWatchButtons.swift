//
//  StopWatchButtons.swift
//  StopWatchApp
//
//  Created by Mounika Dara on 08/12/23.
//

import SwiftUI

struct StopWatchButtonsView: View {
    var buttonTitle: String
    var foregroundColor:Color
    var backgroundColor: Color
    var cornerRadius: CGFloat
   @Binding var stopWatchButtonShape: StopWatchButtonShapes
    var body: some View {
        switch stopWatchButtonShape{
        case .roundedBorderButton:
            Text(buttonTitle)
                .font(.system(size: UIScreen.main.bounds.height/44.8, weight: .regular, design: .default))
                .foregroundColor(backgroundColor)
                .frame(width: UIScreen.main.bounds.height/11.2,height: UIScreen.main.bounds.height/17.92)
                .background(Color.clear)
                .background(
                           RoundedRectangle(cornerRadius: 10)
                             .stroke(backgroundColor, lineWidth: 2)
                         )
        case .SquareFilledButton:
            Text(buttonTitle)
                .font(.system(size: UIScreen.main.bounds.height/44.8, weight: .regular, design: .default))
                .foregroundColor(foregroundColor)
                .frame(width: UIScreen.main.bounds.height/11.2,height: UIScreen.main.bounds.height/17.92)
                .background(backgroundColor)
        case .squareBorderButton:
            Text(buttonTitle)
                .font(.system(size: UIScreen.main.bounds.height/44.8, weight: .regular, design: .default))
                .foregroundColor(backgroundColor)
                .frame(width: UIScreen.main.bounds.height/11.2,height: UIScreen.main.bounds.height/17.92)
                .background(Color.clear)
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(backgroundColor, lineWidth: 2)
                )
                
        case .capsule:
            Text(buttonTitle)
                .font(.system(size: UIScreen.main.bounds.height/44.8, weight: .regular, design: .default))
                .foregroundColor(foregroundColor)
                .frame(width: UIScreen.main.bounds.height/11.2,height: UIScreen.main.bounds.height/17.92)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        case .circle:
            Text(buttonTitle)
                .font(.system(size: UIScreen.main.bounds.height/44.8, weight: .regular, design: .default))
                .foregroundColor(foregroundColor)
                .frame(width: UIScreen.main.bounds.height/11.2,height: UIScreen.main.bounds.height/11.2)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        case .roundedSquareFilledButton:
            Text(buttonTitle)
                .font(.system(size: UIScreen.main.bounds.height/44.8, weight: .regular, design: .default))
                .foregroundColor(foregroundColor)
                .frame(width: UIScreen.main.bounds.height/11.2,height: UIScreen.main.bounds.height/17.92)
                .background(backgroundColor)
                .cornerRadius(10)
                }
        
    }
}


//struct StopWatchButtonsView_Previews: PreviewProvider {
//    static var previews: some View {
//        StopWatchButtonsView(buttonTitle: "Pause", foregroundColor: .white, backgroundColor: lightGreenColor, cornerRadius: UIScreen.main.bounds.height/17.92, stopWatchButtonShape: .roundedSquareFilledButton)
//    }
//}
