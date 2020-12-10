//
//  PersonaId.swift
//  PersonaId
//
//  Created by Ricardo Pacheco on 06/12/20.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let personaId = try PersonaId(json)

import Foundation

// MARK: - PersonaId
public struct PersonaId: Codable {
    public let id: Int?
    public let level: Int?
    public let name: String?
    public let price: Int?
    public let race: Game?
    public let inherit: Game?
    public let game: Game?
    public let resistance: Resistance?
    public let fusiones: [Fusione]?

    enum CodingKeys: String, CodingKey {
        case id
        case level
        case name
        case price
        case race
        case inherit
        case game
        case resistance
        case fusiones
    }

    public init(id: Int?, level: Int?, name: String?, price: Int?, race: Game?, inherit: Game?, game: Game?, resistance: Resistance?, fusiones: [Fusione]?) {
        self.id = id
        self.level = level
        self.name = name
        self.price = price
        self.race = race
        self.inherit = inherit
        self.game = game
        self.resistance = resistance
        self.fusiones = fusiones
    }
}

// MARK: PersonaId convenience initializers and mutators

public extension PersonaId {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PersonaId.self, from: data)
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
        game: Game?? = nil,
        resistance: Resistance?? = nil,
        fusiones: [Fusione]?? = nil
    ) -> PersonaId {
        return PersonaId(
            id: id ?? self.id,
            level: level ?? self.level,
            name: name ?? self.name,
            price: price ?? self.price,
            race: race ?? self.race,
            inherit: inherit ?? self.inherit,
            game: game ?? self.game,
            resistance: resistance ?? self.resistance,
            fusiones: fusiones ?? self.fusiones
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Fusione
public struct Fusione: Codable {
    public let persona1: Persona?
    public let persona2: Persona?

    enum CodingKeys: String, CodingKey {
        case persona1
        case persona2
    }

    public init(persona1: Persona?, persona2: Persona?) {
        self.persona1 = persona1
        self.persona2 = persona2
    }
}

// MARK: Fusione convenience initializers and mutators

public extension Fusione {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Fusione.self, from: data)
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
        persona1: Persona?? = nil,
        persona2: Persona?? = nil
    ) -> Fusione {
        return Fusione(
            persona1: persona1 ?? self.persona1,
            persona2: persona2 ?? self.persona2
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Persona
public struct Persona: Codable {
    public let id: Int?
    public let nombre: String?

    enum CodingKeys: String, CodingKey {
        case id
        case nombre
    }

    public init(id: Int?, nombre: String?) {
        self.id = id
        self.nombre = nombre
    }
}

// MARK: Persona convenience initializers and mutators

public extension Persona {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Persona.self, from: data)
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
        nombre: String?? = nil
    ) -> Persona {
        return Persona(
            id: id ?? self.id,
            nombre: nombre ?? self.nombre
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

// MARK: - Resistance
public struct Resistance: Codable {
    public let phys: String?
    public let gun: String?
    public let fire: String?
    public let ice: String?
    public let elec: String?
    public let wind: String?
    public let psy: String?
    public let nuke: String?
    public let bless: String?
    public let curse: String?

    enum CodingKeys: String, CodingKey {
        case phys
        case gun
        case fire
        case ice
        case elec
        case wind
        case psy
        case nuke
        case bless
        case curse
    }

    public init(phys: String?, gun: String?, fire: String?, ice: String?, elec: String?, wind: String?, psy: String?, nuke: String?, bless: String?, curse: String?) {
        self.phys = phys
        self.gun = gun
        self.fire = fire
        self.ice = ice
        self.elec = elec
        self.wind = wind
        self.psy = psy
        self.nuke = nuke
        self.bless = bless
        self.curse = curse
    }
}

// MARK: Resistance convenience initializers and mutators

public extension Resistance {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Resistance.self, from: data)
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
        phys: String?? = nil,
        gun: String?? = nil,
        fire: String?? = nil,
        ice: String?? = nil,
        elec: String?? = nil,
        wind: String?? = nil,
        psy: String?? = nil,
        nuke: String?? = nil,
        bless: String?? = nil,
        curse: String?? = nil
    ) -> Resistance {
        return Resistance(
            phys: phys ?? self.phys,
            gun: gun ?? self.gun,
            fire: fire ?? self.fire,
            ice: ice ?? self.ice,
            elec: elec ?? self.elec,
            wind: wind ?? self.wind,
            psy: psy ?? self.psy,
            nuke: nuke ?? self.nuke,
            bless: bless ?? self.bless,
            curse: curse ?? self.curse
        )
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

