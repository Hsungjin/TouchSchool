//
//  MainView.swift
//  TouchSchool
//
//  Created by 최동호 on 10/11/23.
//

import Foundation
import SwiftUI

struct MainView: View {
    @Binding var showMain: Bool
    
    var body: some View {
        NavigationView {
            ZStack{
                // 원래는 .frame(height: .infinity)를 사용하려했는데
                // Invalid frame dimension (negative or non-finite). -> 프레임 수치가 정확하지 않다.
                // GeometryReader를 사용해야 함.
                GeometryReader { proxy in
                    Image("blackboard_set")
                        .resizable()
                        .frame(width: proxy.size.width, height: proxy.size.height)
                }
                VStack{
                    titleImage()
                    HStack {
                        NavigationLink(destination: GameView(vm: GameViewModel())) {
                            Text("게임 시작")
                        }  .font(.largeTitle)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .padding(10)
                        
                        NavigationLink(destination: RankView()) {
                            Image("rankicon")
                                .resizable()
                                .frame(width: 20, height: 20)
                        }
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                        .padding(10)
                        
                    }
                    Button(action: {
                        self.showMain = false
                    }) {
                        Text("학교 선택")
                            .font(.system(size: 15))
                            .padding(3)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .background(Color.cyan)
                            .cornerRadius(30)
                            .padding(5)
                            .overlay(RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.cyan, lineWidth: 3)
                            )
                    }
                    .padding()
                }
            }
        }
    }
}

struct titleImage: View {
    var body: some View {
        Image("noname")
            .resizable()
            .aspectRatio(contentMode: .fit)
        //.frame(width: 300, height: 200)
    }
}
                                       
#Preview {
    MainView(showMain: SearchView().$showMain)
   
}