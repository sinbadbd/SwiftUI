// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coinsModel = try? newJSONDecoder().decode(CoinsModel.self, from: jsonData)

import Foundation

// MARK: - CoinsModel
struct CoinsModel: Decodable {
    let results: [Result]
    let page, totalResults: Int
    let dates: Dates
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case results, page
        case totalResults = "total_results"
        case dates
        case totalPages = "total_pages"
    }
}

// MARK: - Dates
struct Dates: Decodable {
    let maximum, minimum: String
}

// MARK: - Result
struct Result: Decodable {
    let voteCount, id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath: String
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview, releaseDate: String

    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}

enum OriginalLanguage: String, Decodable {
    case en = "en"
    case fr = "fr"
    case ja = "ja"
    case zh = "zh"
}













////
////  CoinsModel.swift
////  SwiftUI-Essentials
////
////  Created by Zahedul Alam on 30/7/19.
////  Copyright © 2019 devsloop. All rights reserved.
////
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let coinsModel = try? newJSONDecoder().decode(CoinsModel.self, from: jsonData)
//
//import Foundation
//
//// MARK: - CoinsModel
//struct CoinsModel: Decodable {
//    let raw: Raw
//    let display: Display
//
//    enum CodingKeys: String, CodingKey {
//        case raw = "RAW"
//        case display = "DISPLAY"
//    }
//}
//
//// MARK: - Display
//struct Display: Decodable {
//    let btc: DisplayBtc
//
//    enum CodingKeys: String, CodingKey {
//        case btc = "BTC"
//    }
//}
//
//// MARK: - DisplayBtc
//struct DisplayBtc: Decodable {
//    let usd: PurpleUSD
//
//    enum CodingKeys: String, CodingKey {
//        case usd = "USD"
//    }
//}
//
//// MARK: - PurpleUSD
//struct PurpleUSD: Decodable {
//    let fromsymbol, tosymbol, market, price: String
//    let lastupdate, lastvolume, lastvolumeto, lasttradeid: String
//    let volumeday, volumedayto, volume24Hour, volume24Hourto: String
//    let openday, highday, lowday, open24Hour: String
//    let high24Hour, low24Hour, lastmarket, volumehour: String
//    let volumehourto, openhour, highhour, lowhour: String
//    let toptiervolume24Hour, toptiervolume24Hourto, change24Hour, changepct24Hour: String
//    let changeday, changepctday, supply, mktcap: String
//    let totalvolume24H, totalvolume24Hto, totaltoptiervolume24H, totaltoptiervolume24Hto: String
//    let imageurl: String
//
//    enum CodingKeys: String, CodingKey {
//        case fromsymbol = "FROMSYMBOL"
//        case tosymbol = "TOSYMBOL"
//        case market = "MARKET"
//        case price = "PRICE"
//        case lastupdate = "LASTUPDATE"
//        case lastvolume = "LASTVOLUME"
//        case lastvolumeto = "LASTVOLUMETO"
//        case lasttradeid = "LASTTRADEID"
//        case volumeday = "VOLUMEDAY"
//        case volumedayto = "VOLUMEDAYTO"
//        case volume24Hour = "VOLUME24HOUR"
//        case volume24Hourto = "VOLUME24HOURTO"
//        case openday = "OPENDAY"
//        case highday = "HIGHDAY"
//        case lowday = "LOWDAY"
//        case open24Hour = "OPEN24HOUR"
//        case high24Hour = "HIGH24HOUR"
//        case low24Hour = "LOW24HOUR"
//        case lastmarket = "LASTMARKET"
//        case volumehour = "VOLUMEHOUR"
//        case volumehourto = "VOLUMEHOURTO"
//        case openhour = "OPENHOUR"
//        case highhour = "HIGHHOUR"
//        case lowhour = "LOWHOUR"
//        case toptiervolume24Hour = "TOPTIERVOLUME24HOUR"
//        case toptiervolume24Hourto = "TOPTIERVOLUME24HOURTO"
//        case change24Hour = "CHANGE24HOUR"
//        case changepct24Hour = "CHANGEPCT24HOUR"
//        case changeday = "CHANGEDAY"
//        case changepctday = "CHANGEPCTDAY"
//        case supply = "SUPPLY"
//        case mktcap = "MKTCAP"
//        case totalvolume24H = "TOTALVOLUME24H"
//        case totalvolume24Hto = "TOTALVOLUME24HTO"
//        case totaltoptiervolume24H = "TOTALTOPTIERVOLUME24H"
//        case totaltoptiervolume24Hto = "TOTALTOPTIERVOLUME24HTO"
//        case imageurl = "IMAGEURL"
//    }
//}
//
//// MARK: - Raw
//struct Raw: Decodable {
//    let btc: RawBtc
//
//    enum CodingKeys: String, CodingKey {
//        case btc = "BTC"
//    }
//}
//
//// MARK: - RawBtc
//struct RawBtc: Decodable {
//    let usd: FluffyUSD
//
//    enum CodingKeys: String, CodingKey {
//        case usd = "USD"
//    }
//}
//
//// MARK: - FluffyUSD
//struct FluffyUSD: Decodable {
//    let type, market, fromsymbol, tosymbol: String
//    let flags: String
//    let price: Double
//    let lastupdate: Int
//    let lastvolume, lastvolumeto: Double
//    let lasttradeid: String
//    let volumeday, volumedayto, volume24Hour, volume24Hourto: Double
//    let openday, highday, lowday, open24Hour: Double
//    let high24Hour, low24Hour: Double
//    let lastmarket: String
//    let volumehour, volumehourto, openhour, highhour: Double
//    let lowhour, toptiervolume24Hour, toptiervolume24Hourto, change24Hour: Double
//    let changepct24Hour, changeday, changepctday: Double
//    let supply: Int
//    let mktcap, totalvolume24H, totalvolume24Hto, totaltoptiervolume24H: Double
//    let totaltoptiervolume24Hto: Double
//    let imageurl: String
//
//    enum CodingKeys: String, CodingKey {
//        case type = "TYPE"
//        case market = "MARKET"
//        case fromsymbol = "FROMSYMBOL"
//        case tosymbol = "TOSYMBOL"
//        case flags = "FLAGS"
//        case price = "PRICE"
//        case lastupdate = "LASTUPDATE"
//        case lastvolume = "LASTVOLUME"
//        case lastvolumeto = "LASTVOLUMETO"
//        case lasttradeid = "LASTTRADEID"
//        case volumeday = "VOLUMEDAY"
//        case volumedayto = "VOLUMEDAYTO"
//        case volume24Hour = "VOLUME24HOUR"
//        case volume24Hourto = "VOLUME24HOURTO"
//        case openday = "OPENDAY"
//        case highday = "HIGHDAY"
//        case lowday = "LOWDAY"
//        case open24Hour = "OPEN24HOUR"
//        case high24Hour = "HIGH24HOUR"
//        case low24Hour = "LOW24HOUR"
//        case lastmarket = "LASTMARKET"
//        case volumehour = "VOLUMEHOUR"
//        case volumehourto = "VOLUMEHOURTO"
//        case openhour = "OPENHOUR"
//        case highhour = "HIGHHOUR"
//        case lowhour = "LOWHOUR"
//        case toptiervolume24Hour = "TOPTIERVOLUME24HOUR"
//        case toptiervolume24Hourto = "TOPTIERVOLUME24HOURTO"
//        case change24Hour = "CHANGE24HOUR"
//        case changepct24Hour = "CHANGEPCT24HOUR"
//        case changeday = "CHANGEDAY"
//        case changepctday = "CHANGEPCTDAY"
//        case supply = "SUPPLY"
//        case mktcap = "MKTCAP"
//        case totalvolume24H = "TOTALVOLUME24H"
//        case totalvolume24Hto = "TOTALVOLUME24HTO"
//        case totaltoptiervolume24H = "TOTALTOPTIERVOLUME24H"
//        case totaltoptiervolume24Hto = "TOTALTOPTIERVOLUME24HTO"
//        case imageurl = "IMAGEURL"
//    }
//}
