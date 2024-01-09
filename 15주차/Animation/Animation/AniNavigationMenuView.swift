//
//  AniNavigationMenuView.swift
//  Animation
//
//  Created by kwon ji won on 12/20/23.
//

import SwiftUI

struct AniNavigationMenuView: View {
    
    var body: some View {
        
        NavigationMenu()
    }
}

struct NavigationMenu: View {
    
    @Namespace private var menuItemTrasnsition
    
    @State var selectedIndex = 0
    
    let menuItems = ["Travel", "Nature", "Architecture"]
    
    var body: some View {
        HStack {
            Spacer()
            
            ForEach(menuItems.indices, id: \.self) { index in
                
                if index == selectedIndex {
                    Text(menuItems[index])
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Capsule().foregroundColor(.purple))
                        .foregroundStyle(.white)
                    // 메뉴 항목이 선택될 때마다 보기 변경에 애니매이션 변경
                    // ID와 네임 스페이스는 동일한 전환의 일부인 뷰를 식별하는데 사용
                        .matchedGeometryEffect(id: "menuItem", in: menuItemTrasnsition)
                } else {
                    Text(menuItems[index])
                        .padding(.horizontal)
                        .padding(.vertical, 4)
                        .background(Capsule().foregroundColor(Color(uiColor: UIColor.systemGray5)))
                        .foregroundStyle(.black)
                        .onTapGesture {
                            selectedIndex = index
                        }
                }
                Spacer()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        //천천히 나타났다 천천히 사라짐
        // 뷰 애니메이션을 활성화하고, animation 수정자를 HStack 뷰에 연결
        .animation(.easeInOut, value: selectedIndex)
    }
}

#Preview {
    AniNavigationMenuView()
}
