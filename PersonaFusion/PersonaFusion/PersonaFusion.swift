// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let personaFusion = try PersonaFusion(json)

import Foundation

// MARK: - PersonaFusionElement
public struct PersonaFusionElement: Codable {
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

// MARK: PersonaFusionElement convenience initializers and mutators

public extension PersonaFusionElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PersonaFusionElement.self, from: data)
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
    ) -> PersonaFusionElement {
        return PersonaFusionElement(
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

public typealias PersonaFusion = [PersonaFusionElement]

public extension Array where Element == PersonaFusion.Element {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(PersonaFusion.self, from: data)
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
