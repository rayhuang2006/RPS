//
//  ContentView.swift
//  RPS
//
//  Created by Ray Huang on 2024/11/27.
//

import SwiftUI

struct ContentView: View {
    @State private var spacing: CGFloat = 20.0
    
    var body: some View {
        VStack {
            Spacer()
            
            Button(action: {
                // 頭像
            }) {
                Circle()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray)
                    .shadow(radius: 10)
            }
            .padding(.bottom, spacing - 20)
            
            Button(action: {
                // 玩家名稱
            }) {
                Text("玩家名稱")
                    .font(.title2)
                    .padding()
                    .frame(width: 160, height: 25)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .padding(.bottom, spacing + 50)
            
            Button(action: {
                // 抽卡系統
            }) {
                Text("抽卡系統")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .frame(width: 310, height: 230)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            .padding(.bottom, spacing)
            
            HStack {
                Button(action: {
                    // 線上對戰
                }) {
                    Text("線上對戰")
                        .font(.title2)
                        .padding()
                        .frame(width: 150, height: 130)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                .padding(.horizontal)
                
                Button(action: {
                    // 與機器人對戰
                }) {
                    Text("與機器人對戰")
                        .font(.title2)
                        .padding()
                        .frame(width: 150, height: 130)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
                .padding(.horizontal)
            }
            .padding(.bottom, spacing + 50)
            
            Spacer()
            
            ZStack {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(radius: 10)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        // 背包
                    }) {
                        Image(systemName: "backpack")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {
                        // 任務版
                    }) {
                        Image(systemName: "list.bullet")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {
                        // 個人資料以及好友
                    }) {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {
                        // 設定
                    }) {
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
            }
            .padding(.bottom, spacing)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

