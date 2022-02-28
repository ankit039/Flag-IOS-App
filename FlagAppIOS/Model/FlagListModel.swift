//
//  FlagListModel.swift
//  FlagAppIOS
//
//  Created by Ankit Raj on 25/02/22.
//

import Foundation

struct FlagList: Codable{
    let active: Int!
    let activePerOneMillion: Double!
    let cases: Int!
    let casesPerOneMillion: Int!
    let continent: String!
    let country: String!
    let countryInfo: ContryInfo
    let critical: Int!
    let criticalPerOneMillion: Double!
    let deaths: Int!
    let deathsPerOneMillion: Int!
    let oneCasePerPeople: Int!
    let oneDeathPerPeople: Int!
    let oneTestPerPeople: Int!
    let population: Int!
    let recovered: Int!
    let recoveredPerOneMillion: Double!
    let tests: Int!
    let testsPerOneMillion: Int!
    let todayCases: Int!
    let todayDeaths: Int!
    let todayRecovered: Int!
    let updated: Int64!
}

struct ContryInfo: Codable{
    let _id: Int!
    let flag: String!
    let iso2: String!
    let iso3: String!
    let lat: Float64!
    let long: Float64!
}
