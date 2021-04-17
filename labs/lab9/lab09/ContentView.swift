//
//  ContentView.swift
//  lab09
//
//  Created by Shyam Kumar on 11/8/20.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @ObservedObject var rq: RequestData
    var body: some View {
        switch rq.state {
        case .idle:
            Text("Loading...")
                .padding()
                .onAppear(perform: {
                    rq.requestFundingInfo()
                })
        //TODO:- Allow two additional parameters to be detected in the below case statement (to grab debtsOwed and cashOnHand data)
        case .loaded(let totalContributionData):
            NavigationView {
                ScrollView {
                    VStack {
                        BarChartView(data: ChartData(values: totalContributionData), title: "Campaign Contributions", legend: "in millions", form: ChartForm.medium
                        )
                        .padding()
                        
                        //TODO:- Create two additional BarChartViews inside this VStack; one displaying the debtsOwed by candidates and another displaying the cashOnHand
                    }
                    .frame(width: UIScreen.main.bounds.width)
                    .navigationBarTitle(Text("2020 Finances"))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rq: RequestData())
    }
}
