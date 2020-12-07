//
//  PersonaList.swift
//  PersonaList
//
//  Created by Ricardo Pacheco on 06/12/20.
//

import Foundation

// MARK: - PersonaListElement
public struct PersonaListElement: Codable {
    public let id: Int?
    public let level: Int?
    public let name: String?
    public let price: Int?
    public let race: Game?
    public let inherit: Game?
    public let game: Game?

    enum CodingKeys: String, CodingKey {
        case id
        case level
        case name
        case price
        case race
        case inherit
        case game
    }

    public init(id: Int?, level: Int?, name: String?, price: Int?, race: Game?, inherit: Game?, game: Game?) {
        self.id = id
        self.level = level
        self.name = name
        self.price = price
        self.race = race
        self.inherit = inherit
        self.game = game
    }
}

// MARK: PersonaListElement convenience initializers and mutators

public extension PersonaListElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PersonaListElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        level: Int?? = nil,
        name: String?? = nil,
        price: Int?? = nil,
        race: Game?? = nil,
        inherit: Game?? = nil,
        game: Game?? = nil
    ) -> PersonaListElement {
        return PersonaListElement(
            id: id ?? self.id,
            level: level ?? self.level,
            name: name ?? self.name,
            price: price ?? self.price,
            race: race ?? self.race,
            inherit: inherit ?? self.inherit,
            game: game ?? self.game
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Game
public struct Game: Codable {
    public let name: String?

    enum CodingKeys: String, CodingKey {
        case name
    }

    public init(name: String?) {
        self.name = name
    }
}

// MARK: Game convenience initializers and mutators

public extension Game {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Game.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String?? = nil
    ) -> Game {
        return Game(
            name: name ?? self.name
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

public typealias PersonaList = [PersonaListElement]

public extension Array where Element == PersonaList.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PersonaList.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
