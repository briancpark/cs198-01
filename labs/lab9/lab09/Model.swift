//
//  Model.swift
//  lab09
//
//  Created by Shyam Kumar on 11/8/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class RequestData: ObservableObject {
    
    enum State {
        case idle
        //TODO:- Edit the below statement to allow two additional arrays of type [(String, Double)] to be passed through
        case loaded([(String, Double)]) //Parameters for case statement: This data is passed through to the ContentView through the switch statement that checks whether the API call has finished
    }
    
    @Published var state = State.idle //On launch, our state is idle. ContentView will call requestFundingInfo() to get the data necessary to generate the view.
    
    var aggregateValues: [String] = ["All Candidates", "Democrats", "Republicans"]
    
    func requestFundingInfo() {
        let url = "https://api.open.fec.gov/v1/presidential/financial_summary/?api_key=Fswtu4YDKLfxJEeEYjpc9JvLibuGc0h0LtPJX6Zq&election_year=2020"
        var totalContributionData: [(String, Double)] = []
        var debtsOwedData: [(String, Double)] = []
        var cashOwedData: [(String, Double)] = []
        //MARK:- API Call
        AF.request(url).responseJSON { response in //When the JSON data is retrieved, the block of code below will be called. The JSON response will be inside the response variable
            do {
                let json = JSON(response.data as Any)
                for (_, subJson): (String, JSON) in json["results"] {
                    let name = subJson["candidate_last_name"].stringValue
                    let net_receipts = subJson["net_receipts"].doubleValue / 1000000
                    //TODO:- Index into subJson to find "debts_owed_by_committee" and "cash_on_hand_end"
                    //TODO:- Divide both values by 1000000 so our numbers are manageable
                    if !self.aggregateValues.contains(name) {
                        totalContributionData.append((name, net_receipts))
                        //TODO:- Append (name, value) to both debtsOwedData and cashOwedData
                        if totalContributionData.count == 10 {
                            break
                        }
                    }
                }
                //TODO:- Send debtsOwedData and cashOwedData through the .loaded call as well
                self.state = .loaded(totalContributionData)
            } catch let error as NSError {
                print(error)
            }
        }
    }
}
