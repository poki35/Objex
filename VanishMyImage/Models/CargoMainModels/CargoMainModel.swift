//
//  CargoMainModel.swift
//  VanishMyImage
//
//  Created by Kirill Ponomarenko on 20.10.24.
//

import SwiftUI
import Foundation

struct Cargo: Identifiable {
    let id = UUID()
    let companyName: String
    let distance: String
    let startPoint: String
    let endPoint: String
    let weight: String
    let price: String
    let imageName: String
}

//// MARK: - WelcomeElement
//struct WelcomeElement: Codable {
//    let loadMeta: LoadMeta
//    let contactId1, contactId2: Int
//    let note, firstDate, lastDate: String
//    let dateType, periodicityID: Int
//    let orderNumber: String
//    let krugoreis: Bool
//    let loading: Loading
//    let extraPoints: [ExtraPoint]
//    let unloading: Loading
//    let cargo: Cargo
//    let transport: Transport
//    let payment: Payment
//    let inviteSettings: InviteSettings
//    let priorityView: PriorityView
//    let stealth: Stealth
//    let loadFiles: [LoadFile]
//    let deal: Deal
//    let boards: [Board]
//    let unloadFirstDate, unloadLastDate, archiveDate, archiveReason: String
//    let truePrice, trueCurrencyID, responseCount, offerCount: Int
//    let canBeDeleted, hasPermissionsToLoad, canBeEdited, canBeRenewed: Bool
//    let canBeRestored: Bool
//    let editRestriction, deleteRestriction, restoreRestriction: Int
//    let renewRestriction, id, loadNumber, updatedAt: String
//    let addedAt: String
//    let distance, platonRoadsLength, tollRoadsLength: Int
//    let travelTime: String
//    let zimnik, ferries: Bool
//    let firmID, auctionID: String
//
//    enum CodingKeys: String, CodingKey {
//        case loadMeta = "LoadMeta"
//        case contactId1 = "ContactId1"
//        case contactId2 = "ContactId2"
//        case note = "Note"
//        case firstDate = "FirstDate"
//        case lastDate = "LastDate"
//        case dateType = "DateType"
//        case periodicityID = "PeriodicityId"
//        case orderNumber = "OrderNumber"
//        case krugoreis = "Krugoreis"
//        case loading = "Loading"
//        case extraPoints = "ExtraPoints"
//        case unloading = "Unloading"
//        case cargo = "Cargo"
//        case transport = "Transport"
//        case payment = "Payment"
//        case inviteSettings = "InviteSettings"
//        case priorityView = "PriorityView"
//        case stealth = "Stealth"
//        case loadFiles = "LoadFiles"
//        case deal = "Deal"
//        case boards = "Boards"
//        case unloadFirstDate = "UnloadFirstDate"
//        case unloadLastDate = "UnloadLastDate"
//        case archiveDate = "ArchiveDate"
//        case archiveReason = "ArchiveReason"
//        case truePrice = "TruePrice"
//        case trueCurrencyID = "TrueCurrencyId"
//        case responseCount = "ResponseCount"
//        case offerCount = "OfferCount"
//        case canBeDeleted = "CanBeDeleted"
//        case hasPermissionsToLoad = "HasPermissionsToLoad"
//        case canBeEdited = "CanBeEdited"
//        case canBeRenewed = "CanBeRenewed"
//        case canBeRestored = "CanBeRestored"
//        case editRestriction = "EditRestriction"
//        case deleteRestriction = "DeleteRestriction"
//        case restoreRestriction = "RestoreRestriction"
//        case renewRestriction = "RenewRestriction"
//        case id = "Id"
//        case loadNumber = "LoadNumber"
//        case updatedAt = "UpdatedAt"
//        case addedAt = "AddedAt"
//        case distance = "Distance"
//        case platonRoadsLength = "PlatonRoadsLength"
//        case tollRoadsLength = "TollRoadsLength"
//        case travelTime = "TravelTime"
//        case zimnik = "Zimnik"
//        case ferries = "Ferries"
//        case firmID = "FirmId"
//        case auctionID = "AuctionId"
//    }
//}
//
//// MARK: - Board
//struct Board: Codable {
//    let boardID, publicationTime: String
//    let isReservationEnabled: Bool
//    let publicationOption: Int
//    let isPublished, isCommonBoard: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case boardID = "BoardId"
//        case publicationTime = "PublicationTime"
//        case isReservationEnabled = "IsReservationEnabled"
//        case publicationOption = "PublicationOption"
//        case isPublished = "IsPublished"
//        case isCommonBoard = "IsCommonBoard"
//    }
//}
//
//// MARK: - Cargo
//struct Cargo: Codable {
//    let weight, volume: Double
//    let adr, cargoTypeID: Int
//    let cargoType: String
//    let packType, palletCount, beltCount, dogruzType: Int
//    let sborGruz: Bool
//    let size: Size
//
//    enum CodingKeys: String, CodingKey {
//        case weight = "Weight"
//        case volume = "Volume"
//        case adr = "ADR"
//        case cargoTypeID = "CargoTypeId"
//        case cargoType = "CargoType"
//        case packType = "PackType"
//        case palletCount = "PalletCount"
//        case beltCount = "BeltCount"
//        case dogruzType = "DogruzType"
//        case sborGruz = "SborGruz"
//        case size = "Size"
//    }
//}
//
//// MARK: - Size
//struct Size: Codable {
//    let length, width, height, diameter: Double
//    let lengthHighlight, widthHighlight, heightHighlight: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case length = "Length"
//        case width = "Width"
//        case height = "Height"
//        case diameter = "Diameter"
//        case lengthHighlight = "LengthHighlight"
//        case widthHighlight = "WidthHighlight"
//        case heightHighlight = "HeightHighlight"
//    }
//}
//
//// MARK: - Deal
//struct Deal: Codable {
//    let auction: Auction
//
//    enum CodingKeys: String, CodingKey {
//        case auction = "Auction"
//    }
//}
//
//// MARK: - Auction
//struct Auction: Codable {
//    let startRate: Double
//    let currency: Int
//    let step: Double
//    let paymentType: Int
//    let acceptSecondPayType: Bool
//    let startDate, endDate, endDateBoundary: String
//    let nds, timeToProvideDocuments: Double
//    let autoRenew: Bool
//    let renewTime, maxRenewTime: Int
//    let raiseBid: Bool
//    let maxRate: Double
//    let raiseBidInterval, responseInMinutes, duration: Int
//    let startSinceFirstBet: Bool
//    let auctionRestartParameters: AuctionRestartParameters
//    let acceptCounterOffersOnlyBeforeFirstBet: Bool
//    let winnerCriterion: Int
//    let auctionID, loadID, activeDealID: String
//    let state: Int
//    let finished: Bool
//    let winDate: String
//    let auctionRates: [AuctionRate]
//
//    enum CodingKeys: String, CodingKey {
//        case startRate = "StartRate"
//        case currency = "Currency"
//        case step = "Step"
//        case paymentType = "PaymentType"
//        case acceptSecondPayType = "AcceptSecondPayType"
//        case startDate = "StartDate"
//        case endDate = "EndDate"
//        case endDateBoundary = "EndDateBoundary"
//        case nds = "Nds"
//        case timeToProvideDocuments = "TimeToProvideDocuments"
//        case autoRenew = "AutoRenew"
//        case renewTime = "RenewTime"
//        case maxRenewTime = "MaxRenewTime"
//        case raiseBid = "RaiseBid"
//        case maxRate = "MaxRate"
//        case raiseBidInterval = "RaiseBidInterval"
//        case responseInMinutes = "ResponseInMinutes"
//        case duration = "Duration"
//        case startSinceFirstBet = "StartSinceFirstBet"
//        case auctionRestartParameters = "AuctionRestartParameters"
//        case acceptCounterOffersOnlyBeforeFirstBet = "AcceptCounterOffersOnlyBeforeFirstBet"
//        case winnerCriterion = "WinnerCriterion"
//        case auctionID = "AuctionId"
//        case loadID = "LoadId"
//        case activeDealID = "ActiveDealId"
//        case state = "State"
//        case finished = "Finished"
//        case winDate = "WinDate"
//        case auctionRates = "AuctionRates"
//    }
//}
//
//// MARK: - AuctionRate
//struct AuctionRate: Codable {
//    let auctionRateID, addedAt: String
//    let rateFirm: RateFirm
//    let rate: Double
//    let state: Int
//    let loadingDate: String
//    let firmID, contactID: Int
//
//    enum CodingKeys: String, CodingKey {
//        case auctionRateID = "AuctionRateId"
//        case addedAt = "AddedAt"
//        case rateFirm = "RateFirm"
//        case rate = "Rate"
//        case state = "State"
//        case loadingDate = "LoadingDate"
//        case firmID = "FirmId"
//        case contactID = "ContactId"
//    }
//}
//
//// MARK: - RateFirm
//struct RateFirm: Codable {
//    let score: Double
//    let status: Int
//    let name, contactName, atiID: String
//
//    enum CodingKeys: String, CodingKey {
//        case score = "Score"
//        case status = "Status"
//        case name = "Name"
//        case contactName = "ContactName"
//        case atiID = "AtiId"
//    }
//}
//
//// MARK: - AuctionRestartParameters
//struct AuctionRestartParameters: Codable {
//    let auctionFinishAction, initRestartCount, initChangeWinnerCount, durationAfterRestart: Int
//
//    enum CodingKeys: String, CodingKey {
//        case auctionFinishAction = "AuctionFinishAction"
//        case initRestartCount = "InitRestartCount"
//        case initChangeWinnerCount = "InitChangeWinnerCount"
//        case durationAfterRestart = "DurationAfterRestart"
//    }
//}
//
//// MARK: - ExtraPoint
//struct ExtraPoint: Codable {
//    let cityID, pointType: Int
//    let latitude, longitude: Double
//    let street: String
//    let ordinalID: Int
//    let isRoundTheClock: Bool
//    let loadingDateStart, loadingDateEnd: String
//    let loadingTimeStart, loadingTimeEnd: JSONNull?
//    let loadingCargos: [LoadingCargo]
//    let unloadingCargos: [UnloadingCargo]
//
//    enum CodingKeys: String, CodingKey {
//        case cityID = "CityId"
//        case pointType = "PointType"
//        case latitude = "Latitude"
//        case longitude = "Longitude"
//        case street = "Street"
//        case ordinalID = "OrdinalId"
//        case isRoundTheClock = "IsRoundTheClock"
//        case loadingDateStart = "LoadingDateStart"
//        case loadingDateEnd = "LoadingDateEnd"
//        case loadingTimeStart = "LoadingTimeStart"
//        case loadingTimeEnd = "LoadingTimeEnd"
//        case loadingCargos = "LoadingCargos"
//        case unloadingCargos = "UnloadingCargos"
//    }
//}
//
//// MARK: - LoadingCargo
//struct LoadingCargo: Codable {
//    let cargoID, nameID: Int
//    let name: String
//    let packagingType, packagingQuantity: Int
//    let weight, volume: Double
//    let sizes: Size
//
//    enum CodingKeys: String, CodingKey {
//        case cargoID = "CargoId"
//        case nameID = "NameId"
//        case name = "Name"
//        case packagingType = "PackagingType"
//        case packagingQuantity = "PackagingQuantity"
//        case weight = "Weight"
//        case volume = "Volume"
//        case sizes = "Sizes"
//    }
//}
//
//// MARK: - UnloadingCargo
//struct UnloadingCargo: Codable {
//    let cargoID: Int
//    let weight, volume: Double
//    let packagingQuantity: Int
//    let isDefinedByTtn: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case cargoID = "CargoId"
//        case weight = "Weight"
//        case volume = "Volume"
//        case packagingQuantity = "PackagingQuantity"
//        case isDefinedByTtn = "IsDefinedByTtn"
//    }
//}
//
//// MARK: - InviteSettings
//struct InviteSettings: Codable {
//    let inviteDelayInSeconds, inviteDurationInSeconds: Int
//
//    enum CodingKeys: String, CodingKey {
//        case inviteDelayInSeconds = "InviteDelayInSeconds"
//        case inviteDurationInSeconds = "InviteDurationInSeconds"
//    }
//}
//
//// MARK: - LoadFile
//struct LoadFile: Codable {
//    let id: String
//    let fileType, attributes: Int
//    let name, link: String
//    let size: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id = "Id"
//        case fileType = "FileType"
//        case attributes = "Attributes"
//        case name = "Name"
//        case link = "Link"
//        case size = "Size"
//    }
//}
//
//// MARK: - LoadMeta
//struct LoadMeta: Codable {
//    let loadMetaID, metaData: String
//
//    enum CodingKeys: String, CodingKey {
//        case loadMetaID = "LoadMetaId"
//        case metaData = "MetaData"
//    }
//}
//
//// MARK: - Loading
//struct Loading: Codable {
//    let cityID: Int
//    let latitude, longitude: Double
//    let street, timeStart, timeEnd: String
//    let isRoundTheClock: Bool
//    let largeCities: [Int]
//    let loadingCargos: [LoadingCargo]
//
//    enum CodingKeys: String, CodingKey {
//        case cityID = "CityId"
//        case latitude = "Latitude"
//        case longitude = "Longitude"
//        case street = "Street"
//        case timeStart = "TimeStart"
//        case timeEnd = "TimeEnd"
//        case isRoundTheClock = "IsRoundTheClock"
//        case largeCities = "LargeCities"
//        case loadingCargos = "LoadingCargos"
//    }
//}
//
//// MARK: - Payment
//struct Payment: Codable {
//    let currencyID, moneyType: Int
//    let rateSum, sumWithNDS, sumWithoutNDS: Double
//    let prepayPercent: Int
//    let prepayPercentEnabled: Bool
//    let payDays: Int
//    let payDaysEnabled, fixedRate, torg, directContract: Bool
//    let inFuel, onUnloading, hideResponses: Bool
//    let acceptPaymentTypes: Int
//
//    enum CodingKeys: String, CodingKey {
//        case currencyID = "CurrencyId"
//        case moneyType = "MoneyType"
//        case rateSum = "RateSum"
//        case sumWithNDS = "SumWithNDS"
//        case sumWithoutNDS = "SumWithoutNDS"
//        case prepayPercent = "PrepayPercent"
//        case prepayPercentEnabled = "PrepayPercentEnabled"
//        case payDays = "PayDays"
//        case payDaysEnabled = "PayDaysEnabled"
//        case fixedRate = "FixedRate"
//        case torg = "Torg"
//        case directContract = "DirectContract"
//        case inFuel = "InFuel"
//        case onUnloading = "OnUnloading"
//        case hideResponses = "HideResponses"
//        case acceptPaymentTypes = "AcceptPaymentTypes"
//    }
//}
//
//// MARK: - PriorityView
//struct PriorityView: Codable {
//    let dailyLimit: Double
//    let isForPayedOnly: Bool
//    let orderLimit, viewRate, moneySpentPerDay, moneySpentPerOrder: Double
//
//    enum CodingKeys: String, CodingKey {
//        case dailyLimit = "DailyLimit"
//        case isForPayedOnly = "IsForPayedOnly"
//        case orderLimit = "OrderLimit"
//        case viewRate = "ViewRate"
//        case moneySpentPerDay = "MoneySpentPerDay"
//        case moneySpentPerOrder = "MoneySpentPerOrder"
//    }
//}
//
//// MARK: - Stealth
//struct Stealth: Codable {
//    let listIDToHide, firmRegDateToHide: String
//    let scoreToHide: Double
//
//    enum CodingKeys: String, CodingKey {
//        case listIDToHide = "ListIdToHide"
//        case firmRegDateToHide = "FirmRegDateToHide"
//        case scoreToHide = "ScoreToHide"
//    }
//}
//
//// MARK: - Transport
//struct Transport: Codable {
//    let carType, loadingType: Int
//    let loadingLogicalOperator: String
//    let unloadingType: Int
//    let unloadingLogicalOperator: String
//    let trucksQuantity, temperatureFrom, temperatureTo: Int
//    let stsepka, pnevmohod, koniki, tir: Bool
//    let cmr, t1, sanPassport, isTracking: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case carType = "CarType"
//        case loadingType = "LoadingType"
//        case loadingLogicalOperator = "LoadingLogicalOperator"
//        case unloadingType = "UnloadingType"
//        case unloadingLogicalOperator = "UnloadingLogicalOperator"
//        case trucksQuantity = "TrucksQuantity"
//        case temperatureFrom = "TemperatureFrom"
//        case temperatureTo = "TemperatureTo"
//        case stsepka = "Stsepka"
//        case pnevmohod = "Pnevmohod"
//        case koniki = "Koniki"
//        case tir = "TIR"
//        case cmr = "CMR"
//        case t1 = "T1"
//        case sanPassport = "SanPassport"
//        case isTracking = "IsTracking"
//    }
//}
