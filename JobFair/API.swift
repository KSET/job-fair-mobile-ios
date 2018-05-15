//  This file was automatically generated and should not be edited.

import Apollo

public final class BoothsQuery: GraphQLQuery {
  public static let operationString =
    "query Booths {\n  booths {\n    __typename\n    id\n    geolocation\n    company {\n      __typename\n      ...CompanyDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(CompanyDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("booths", type: .list(.object(Booth.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(booths: [Booth?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "booths": booths.flatMap { (value: [Booth?]) -> [Snapshot?] in value.map { (value: Booth?) -> Snapshot? in value.flatMap { (value: Booth) -> Snapshot in value.snapshot } } }])
    }

    /// Returns all Booths
    public var booths: [Booth?]? {
      get {
        return (snapshot["booths"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Booth?] in value.map { (value: Snapshot?) -> Booth? in value.flatMap { (value: Snapshot) -> Booth in Booth(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Booth?]) -> [Snapshot?] in value.map { (value: Booth?) -> Snapshot? in value.flatMap { (value: Booth) -> Snapshot in value.snapshot } } }, forKey: "booths")
      }
    }

    public struct Booth: GraphQLSelectionSet {
      public static let possibleTypes = ["Booth"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("geolocation", type: .scalar(String.self)),
        GraphQLField("company", type: .object(Company.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, geolocation: String? = nil, company: Company? = nil) {
        self.init(snapshot: ["__typename": "Booth", "id": id, "geolocation": geolocation, "company": company.flatMap { (value: Company) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var geolocation: String? {
        get {
          return snapshot["geolocation"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "geolocation")
        }
      }

      public var company: Company? {
        get {
          return (snapshot["company"] as? Snapshot).flatMap { Company(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "company")
        }
      }

      public struct Company: GraphQLSelectionSet {
        public static let possibleTypes = ["Company"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("homepage_url", type: .scalar(String.self)),
          GraphQLField("short_description", type: .scalar(String.self)),
          GraphQLField("industry", type: .object(Industry.selections)),
          GraphQLField("logo", type: .object(Logo.selections)),
          GraphQLField("presentation", type: .object(Presentation.selections)),
          GraphQLField("workshop", type: .object(Workshop.selections)),
          GraphQLField("cocktail", type: .object(Cocktail.selections)),
          GraphQLField("booth", type: .object(Booth.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, name: String? = nil, homepageUrl: String? = nil, shortDescription: String? = nil, industry: Industry? = nil, logo: Logo? = nil, presentation: Presentation? = nil, workshop: Workshop? = nil, cocktail: Cocktail? = nil, booth: Booth? = nil) {
          self.init(snapshot: ["__typename": "Company", "id": id, "name": name, "homepage_url": homepageUrl, "short_description": shortDescription, "industry": industry.flatMap { (value: Industry) -> Snapshot in value.snapshot }, "logo": logo.flatMap { (value: Logo) -> Snapshot in value.snapshot }, "presentation": presentation.flatMap { (value: Presentation) -> Snapshot in value.snapshot }, "workshop": workshop.flatMap { (value: Workshop) -> Snapshot in value.snapshot }, "cocktail": cocktail.flatMap { (value: Cocktail) -> Snapshot in value.snapshot }, "booth": booth.flatMap { (value: Booth) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var homepageUrl: String? {
          get {
            return snapshot["homepage_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "homepage_url")
          }
        }

        public var shortDescription: String? {
          get {
            return snapshot["short_description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "short_description")
          }
        }

        public var industry: Industry? {
          get {
            return (snapshot["industry"] as? Snapshot).flatMap { Industry(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "industry")
          }
        }

        public var logo: Logo? {
          get {
            return (snapshot["logo"] as? Snapshot).flatMap { Logo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "logo")
          }
        }

        public var presentation: Presentation? {
          get {
            return (snapshot["presentation"] as? Snapshot).flatMap { Presentation(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "presentation")
          }
        }

        public var workshop: Workshop? {
          get {
            return (snapshot["workshop"] as? Snapshot).flatMap { Workshop(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "workshop")
          }
        }

        public var cocktail: Cocktail? {
          get {
            return (snapshot["cocktail"] as? Snapshot).flatMap { Cocktail(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "cocktail")
          }
        }

        public var booth: Booth? {
          get {
            return (snapshot["booth"] as? Snapshot).flatMap { Booth(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "booth")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var companyDetails: CompanyDetails {
            get {
              return CompanyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Industry: GraphQLSelectionSet {
          public static let possibleTypes = ["Industry"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, name: String? = nil) {
            self.init(snapshot: ["__typename": "Industry", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"] as? GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct Logo: GraphQLSelectionSet {
          public static let possibleTypes = ["Image"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("medium", type: .object(Medium.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(medium: Medium? = nil) {
            self.init(snapshot: ["__typename": "Image", "medium": medium.flatMap { (value: Medium) -> Snapshot in value.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var medium: Medium? {
            get {
              return (snapshot["medium"] as? Snapshot).flatMap { Medium(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "medium")
            }
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes = ["ImageVariant"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .scalar(String.self)),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(url: String? = nil) {
              self.init(snapshot: ["__typename": "ImageVariant", "url": url])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }
          }
        }

        public struct Presentation: GraphQLSelectionSet {
          public static let possibleTypes = ["Presentation"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("occures_at", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(title: String? = nil, occuresAt: String? = nil) {
            self.init(snapshot: ["__typename": "Presentation", "title": title, "occures_at": occuresAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var title: String? {
            get {
              return snapshot["title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var occuresAt: String? {
            get {
              return snapshot["occures_at"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "occures_at")
            }
          }
        }

        public struct Workshop: GraphQLSelectionSet {
          public static let possibleTypes = ["Workshop"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("occures_at", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String? = nil, occuresAt: String? = nil) {
            self.init(snapshot: ["__typename": "Workshop", "name": name, "occures_at": occuresAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var occuresAt: String? {
            get {
              return snapshot["occures_at"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "occures_at")
            }
          }
        }

        public struct Cocktail: GraphQLSelectionSet {
          public static let possibleTypes = ["Cocktail"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String? = nil) {
            self.init(snapshot: ["__typename": "Cocktail", "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct Booth: GraphQLSelectionSet {
          public static let possibleTypes = ["Booth"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("location", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, location: String? = nil) {
            self.init(snapshot: ["__typename": "Booth", "id": id, "location": location])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"] as? GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var location: String? {
            get {
              return snapshot["location"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "location")
            }
          }
        }
      }
    }
  }
}

public final class CompaniesQuery: GraphQLQuery {
  public static let operationString =
    "query Companies {\n  companies {\n    __typename\n    ...CompanyDetails\n  }\n}"

  public static var requestString: String { return operationString.appending(CompanyDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("companies", type: .list(.object(Company.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(companies: [Company?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "companies": companies.flatMap { (value: [Company?]) -> [Snapshot?] in value.map { (value: Company?) -> Snapshot? in value.flatMap { (value: Company) -> Snapshot in value.snapshot } } }])
    }

    /// Returns all Companies
    public var companies: [Company?]? {
      get {
        return (snapshot["companies"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Company?] in value.map { (value: Snapshot?) -> Company? in value.flatMap { (value: Snapshot) -> Company in Company(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Company?]) -> [Snapshot?] in value.map { (value: Company?) -> Snapshot? in value.flatMap { (value: Company) -> Snapshot in value.snapshot } } }, forKey: "companies")
      }
    }

    public struct Company: GraphQLSelectionSet {
      public static let possibleTypes = ["Company"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("homepage_url", type: .scalar(String.self)),
        GraphQLField("short_description", type: .scalar(String.self)),
        GraphQLField("industry", type: .object(Industry.selections)),
        GraphQLField("logo", type: .object(Logo.selections)),
        GraphQLField("presentation", type: .object(Presentation.selections)),
        GraphQLField("workshop", type: .object(Workshop.selections)),
        GraphQLField("cocktail", type: .object(Cocktail.selections)),
        GraphQLField("booth", type: .object(Booth.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, name: String? = nil, homepageUrl: String? = nil, shortDescription: String? = nil, industry: Industry? = nil, logo: Logo? = nil, presentation: Presentation? = nil, workshop: Workshop? = nil, cocktail: Cocktail? = nil, booth: Booth? = nil) {
        self.init(snapshot: ["__typename": "Company", "id": id, "name": name, "homepage_url": homepageUrl, "short_description": shortDescription, "industry": industry.flatMap { (value: Industry) -> Snapshot in value.snapshot }, "logo": logo.flatMap { (value: Logo) -> Snapshot in value.snapshot }, "presentation": presentation.flatMap { (value: Presentation) -> Snapshot in value.snapshot }, "workshop": workshop.flatMap { (value: Workshop) -> Snapshot in value.snapshot }, "cocktail": cocktail.flatMap { (value: Cocktail) -> Snapshot in value.snapshot }, "booth": booth.flatMap { (value: Booth) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var homepageUrl: String? {
        get {
          return snapshot["homepage_url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "homepage_url")
        }
      }

      public var shortDescription: String? {
        get {
          return snapshot["short_description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "short_description")
        }
      }

      public var industry: Industry? {
        get {
          return (snapshot["industry"] as? Snapshot).flatMap { Industry(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "industry")
        }
      }

      public var logo: Logo? {
        get {
          return (snapshot["logo"] as? Snapshot).flatMap { Logo(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "logo")
        }
      }

      public var presentation: Presentation? {
        get {
          return (snapshot["presentation"] as? Snapshot).flatMap { Presentation(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "presentation")
        }
      }

      public var workshop: Workshop? {
        get {
          return (snapshot["workshop"] as? Snapshot).flatMap { Workshop(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "workshop")
        }
      }

      public var cocktail: Cocktail? {
        get {
          return (snapshot["cocktail"] as? Snapshot).flatMap { Cocktail(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "cocktail")
        }
      }

      public var booth: Booth? {
        get {
          return (snapshot["booth"] as? Snapshot).flatMap { Booth(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "booth")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(snapshot: snapshot)
        }
        set {
          snapshot += newValue.snapshot
        }
      }

      public struct Fragments {
        public var snapshot: Snapshot

        public var companyDetails: CompanyDetails {
          get {
            return CompanyDetails(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }
      }

      public struct Industry: GraphQLSelectionSet {
        public static let possibleTypes = ["Industry"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, name: String? = nil) {
          self.init(snapshot: ["__typename": "Industry", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct Logo: GraphQLSelectionSet {
        public static let possibleTypes = ["Image"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("medium", type: .object(Medium.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(medium: Medium? = nil) {
          self.init(snapshot: ["__typename": "Image", "medium": medium.flatMap { (value: Medium) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var medium: Medium? {
          get {
            return (snapshot["medium"] as? Snapshot).flatMap { Medium(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "medium")
          }
        }

        public struct Medium: GraphQLSelectionSet {
          public static let possibleTypes = ["ImageVariant"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(url: String? = nil) {
            self.init(snapshot: ["__typename": "ImageVariant", "url": url])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }
        }
      }

      public struct Presentation: GraphQLSelectionSet {
        public static let possibleTypes = ["Presentation"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .scalar(String.self)),
          GraphQLField("occures_at", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(title: String? = nil, occuresAt: String? = nil) {
          self.init(snapshot: ["__typename": "Presentation", "title": title, "occures_at": occuresAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var title: String? {
          get {
            return snapshot["title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "title")
          }
        }

        public var occuresAt: String? {
          get {
            return snapshot["occures_at"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "occures_at")
          }
        }
      }

      public struct Workshop: GraphQLSelectionSet {
        public static let possibleTypes = ["Workshop"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("occures_at", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String? = nil, occuresAt: String? = nil) {
          self.init(snapshot: ["__typename": "Workshop", "name": name, "occures_at": occuresAt])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var occuresAt: String? {
          get {
            return snapshot["occures_at"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "occures_at")
          }
        }
      }

      public struct Cocktail: GraphQLSelectionSet {
        public static let possibleTypes = ["Cocktail"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(name: String? = nil) {
          self.init(snapshot: ["__typename": "Cocktail", "name": name])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct Booth: GraphQLSelectionSet {
        public static let possibleTypes = ["Booth"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("location", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, location: String? = nil) {
          self.init(snapshot: ["__typename": "Booth", "id": id, "location": location])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var location: String? {
          get {
            return snapshot["location"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "location")
          }
        }
      }
    }
  }
}

public final class IndustriesQuery: GraphQLQuery {
  public static let operationString =
    "query Industries {\n  industries {\n    __typename\n    id\n    name\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("industries", type: .list(.object(Industry.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(industries: [Industry?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "industries": industries.flatMap { (value: [Industry?]) -> [Snapshot?] in value.map { (value: Industry?) -> Snapshot? in value.flatMap { (value: Industry) -> Snapshot in value.snapshot } } }])
    }

    /// Returns all Industries
    public var industries: [Industry?]? {
      get {
        return (snapshot["industries"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Industry?] in value.map { (value: Snapshot?) -> Industry? in value.flatMap { (value: Snapshot) -> Industry in Industry(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Industry?]) -> [Snapshot?] in value.map { (value: Industry?) -> Snapshot? in value.flatMap { (value: Industry) -> Snapshot in value.snapshot } } }, forKey: "industries")
      }
    }

    public struct Industry: GraphQLSelectionSet {
      public static let possibleTypes = ["Industry"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("name", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, name: String? = nil) {
        self.init(snapshot: ["__typename": "Industry", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class PresentationsQuery: GraphQLQuery {
  public static let operationString =
    "query Presentations {\n  presentations {\n    __typename\n    id\n    occures_at\n    finishes_at\n    location\n    description\n    presenter_bio\n    title\n    presenter_photo {\n      __typename\n      medium {\n        __typename\n        url\n      }\n    }\n    company {\n      __typename\n      ...CompanyDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(CompanyDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("presentations", type: .list(.object(Presentation.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(presentations: [Presentation?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "presentations": presentations.flatMap { (value: [Presentation?]) -> [Snapshot?] in value.map { (value: Presentation?) -> Snapshot? in value.flatMap { (value: Presentation) -> Snapshot in value.snapshot } } }])
    }

    /// Returns all Presentations
    public var presentations: [Presentation?]? {
      get {
        return (snapshot["presentations"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Presentation?] in value.map { (value: Snapshot?) -> Presentation? in value.flatMap { (value: Snapshot) -> Presentation in Presentation(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Presentation?]) -> [Snapshot?] in value.map { (value: Presentation?) -> Snapshot? in value.flatMap { (value: Presentation) -> Snapshot in value.snapshot } } }, forKey: "presentations")
      }
    }

    public struct Presentation: GraphQLSelectionSet {
      public static let possibleTypes = ["Presentation"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("occures_at", type: .scalar(String.self)),
        GraphQLField("finishes_at", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("presenter_bio", type: .scalar(String.self)),
        GraphQLField("title", type: .scalar(String.self)),
        GraphQLField("presenter_photo", type: .object(PresenterPhoto.selections)),
        GraphQLField("company", type: .object(Company.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, occuresAt: String? = nil, finishesAt: String? = nil, location: String? = nil, description: String? = nil, presenterBio: String? = nil, title: String? = nil, presenterPhoto: PresenterPhoto? = nil, company: Company? = nil) {
        self.init(snapshot: ["__typename": "Presentation", "id": id, "occures_at": occuresAt, "finishes_at": finishesAt, "location": location, "description": description, "presenter_bio": presenterBio, "title": title, "presenter_photo": presenterPhoto.flatMap { (value: PresenterPhoto) -> Snapshot in value.snapshot }, "company": company.flatMap { (value: Company) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var occuresAt: String? {
        get {
          return snapshot["occures_at"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "occures_at")
        }
      }

      public var finishesAt: String? {
        get {
          return snapshot["finishes_at"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "finishes_at")
        }
      }

      public var location: String? {
        get {
          return snapshot["location"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var presenterBio: String? {
        get {
          return snapshot["presenter_bio"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "presenter_bio")
        }
      }

      public var title: String? {
        get {
          return snapshot["title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "title")
        }
      }

      public var presenterPhoto: PresenterPhoto? {
        get {
          return (snapshot["presenter_photo"] as? Snapshot).flatMap { PresenterPhoto(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "presenter_photo")
        }
      }

      public var company: Company? {
        get {
          return (snapshot["company"] as? Snapshot).flatMap { Company(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "company")
        }
      }

      public struct PresenterPhoto: GraphQLSelectionSet {
        public static let possibleTypes = ["Image"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("medium", type: .object(Medium.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(medium: Medium? = nil) {
          self.init(snapshot: ["__typename": "Image", "medium": medium.flatMap { (value: Medium) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var medium: Medium? {
          get {
            return (snapshot["medium"] as? Snapshot).flatMap { Medium(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "medium")
          }
        }

        public struct Medium: GraphQLSelectionSet {
          public static let possibleTypes = ["ImageVariant"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("url", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(url: String? = nil) {
            self.init(snapshot: ["__typename": "ImageVariant", "url": url])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var url: String? {
            get {
              return snapshot["url"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "url")
            }
          }
        }
      }

      public struct Company: GraphQLSelectionSet {
        public static let possibleTypes = ["Company"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("homepage_url", type: .scalar(String.self)),
          GraphQLField("short_description", type: .scalar(String.self)),
          GraphQLField("industry", type: .object(Industry.selections)),
          GraphQLField("logo", type: .object(Logo.selections)),
          GraphQLField("presentation", type: .object(Presentation.selections)),
          GraphQLField("workshop", type: .object(Workshop.selections)),
          GraphQLField("cocktail", type: .object(Cocktail.selections)),
          GraphQLField("booth", type: .object(Booth.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, name: String? = nil, homepageUrl: String? = nil, shortDescription: String? = nil, industry: Industry? = nil, logo: Logo? = nil, presentation: Presentation? = nil, workshop: Workshop? = nil, cocktail: Cocktail? = nil, booth: Booth? = nil) {
          self.init(snapshot: ["__typename": "Company", "id": id, "name": name, "homepage_url": homepageUrl, "short_description": shortDescription, "industry": industry.flatMap { (value: Industry) -> Snapshot in value.snapshot }, "logo": logo.flatMap { (value: Logo) -> Snapshot in value.snapshot }, "presentation": presentation.flatMap { (value: Presentation) -> Snapshot in value.snapshot }, "workshop": workshop.flatMap { (value: Workshop) -> Snapshot in value.snapshot }, "cocktail": cocktail.flatMap { (value: Cocktail) -> Snapshot in value.snapshot }, "booth": booth.flatMap { (value: Booth) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var homepageUrl: String? {
          get {
            return snapshot["homepage_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "homepage_url")
          }
        }

        public var shortDescription: String? {
          get {
            return snapshot["short_description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "short_description")
          }
        }

        public var industry: Industry? {
          get {
            return (snapshot["industry"] as? Snapshot).flatMap { Industry(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "industry")
          }
        }

        public var logo: Logo? {
          get {
            return (snapshot["logo"] as? Snapshot).flatMap { Logo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "logo")
          }
        }

        public var presentation: Presentation? {
          get {
            return (snapshot["presentation"] as? Snapshot).flatMap { Presentation(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "presentation")
          }
        }

        public var workshop: Workshop? {
          get {
            return (snapshot["workshop"] as? Snapshot).flatMap { Workshop(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "workshop")
          }
        }

        public var cocktail: Cocktail? {
          get {
            return (snapshot["cocktail"] as? Snapshot).flatMap { Cocktail(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "cocktail")
          }
        }

        public var booth: Booth? {
          get {
            return (snapshot["booth"] as? Snapshot).flatMap { Booth(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "booth")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var companyDetails: CompanyDetails {
            get {
              return CompanyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Industry: GraphQLSelectionSet {
          public static let possibleTypes = ["Industry"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, name: String? = nil) {
            self.init(snapshot: ["__typename": "Industry", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"] as? GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct Logo: GraphQLSelectionSet {
          public static let possibleTypes = ["Image"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("medium", type: .object(Medium.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(medium: Medium? = nil) {
            self.init(snapshot: ["__typename": "Image", "medium": medium.flatMap { (value: Medium) -> Snapshot in value.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var medium: Medium? {
            get {
              return (snapshot["medium"] as? Snapshot).flatMap { Medium(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "medium")
            }
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes = ["ImageVariant"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .scalar(String.self)),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(url: String? = nil) {
              self.init(snapshot: ["__typename": "ImageVariant", "url": url])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }
          }
        }

        public struct Presentation: GraphQLSelectionSet {
          public static let possibleTypes = ["Presentation"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("occures_at", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(title: String? = nil, occuresAt: String? = nil) {
            self.init(snapshot: ["__typename": "Presentation", "title": title, "occures_at": occuresAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var title: String? {
            get {
              return snapshot["title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var occuresAt: String? {
            get {
              return snapshot["occures_at"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "occures_at")
            }
          }
        }

        public struct Workshop: GraphQLSelectionSet {
          public static let possibleTypes = ["Workshop"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("occures_at", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String? = nil, occuresAt: String? = nil) {
            self.init(snapshot: ["__typename": "Workshop", "name": name, "occures_at": occuresAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var occuresAt: String? {
            get {
              return snapshot["occures_at"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "occures_at")
            }
          }
        }

        public struct Cocktail: GraphQLSelectionSet {
          public static let possibleTypes = ["Cocktail"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String? = nil) {
            self.init(snapshot: ["__typename": "Cocktail", "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct Booth: GraphQLSelectionSet {
          public static let possibleTypes = ["Booth"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("location", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, location: String? = nil) {
            self.init(snapshot: ["__typename": "Booth", "id": id, "location": location])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"] as? GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var location: String? {
            get {
              return snapshot["location"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "location")
            }
          }
        }
      }
    }
  }
}

public final class WorkshopsQuery: GraphQLQuery {
  public static let operationString =
    "query Workshops {\n  workshops {\n    __typename\n    id\n    occures_at\n    finishes_at\n    location\n    name\n    description\n    company {\n      __typename\n      ...CompanyDetails\n    }\n  }\n}"

  public static var requestString: String { return operationString.appending(CompanyDetails.fragmentString) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("workshops", type: .list(.object(Workshop.selections))),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(workshops: [Workshop?]? = nil) {
      self.init(snapshot: ["__typename": "Query", "workshops": workshops.flatMap { (value: [Workshop?]) -> [Snapshot?] in value.map { (value: Workshop?) -> Snapshot? in value.flatMap { (value: Workshop) -> Snapshot in value.snapshot } } }])
    }

    /// Returns all Industry
    public var workshops: [Workshop?]? {
      get {
        return (snapshot["workshops"] as? [Snapshot?]).flatMap { (value: [Snapshot?]) -> [Workshop?] in value.map { (value: Snapshot?) -> Workshop? in value.flatMap { (value: Snapshot) -> Workshop in Workshop(snapshot: value) } } }
      }
      set {
        snapshot.updateValue(newValue.flatMap { (value: [Workshop?]) -> [Snapshot?] in value.map { (value: Workshop?) -> Snapshot? in value.flatMap { (value: Workshop) -> Snapshot in value.snapshot } } }, forKey: "workshops")
      }
    }

    public struct Workshop: GraphQLSelectionSet {
      public static let possibleTypes = ["Workshop"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
        GraphQLField("occures_at", type: .scalar(String.self)),
        GraphQLField("finishes_at", type: .scalar(String.self)),
        GraphQLField("location", type: .scalar(String.self)),
        GraphQLField("name", type: .scalar(String.self)),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("company", type: .object(Company.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID? = nil, occuresAt: String? = nil, finishesAt: String? = nil, location: String? = nil, name: String? = nil, description: String? = nil, company: Company? = nil) {
        self.init(snapshot: ["__typename": "Workshop", "id": id, "occures_at": occuresAt, "finishes_at": finishesAt, "location": location, "name": name, "description": description, "company": company.flatMap { (value: Company) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return snapshot["id"] as? GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var occuresAt: String? {
        get {
          return snapshot["occures_at"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "occures_at")
        }
      }

      public var finishesAt: String? {
        get {
          return snapshot["finishes_at"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "finishes_at")
        }
      }

      public var location: String? {
        get {
          return snapshot["location"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "location")
        }
      }

      public var name: String? {
        get {
          return snapshot["name"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "name")
        }
      }

      public var description: String? {
        get {
          return snapshot["description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "description")
        }
      }

      public var company: Company? {
        get {
          return (snapshot["company"] as? Snapshot).flatMap { Company(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "company")
        }
      }

      public struct Company: GraphQLSelectionSet {
        public static let possibleTypes = ["Company"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("homepage_url", type: .scalar(String.self)),
          GraphQLField("short_description", type: .scalar(String.self)),
          GraphQLField("industry", type: .object(Industry.selections)),
          GraphQLField("logo", type: .object(Logo.selections)),
          GraphQLField("presentation", type: .object(Presentation.selections)),
          GraphQLField("workshop", type: .object(Workshop.selections)),
          GraphQLField("cocktail", type: .object(Cocktail.selections)),
          GraphQLField("booth", type: .object(Booth.selections)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID? = nil, name: String? = nil, homepageUrl: String? = nil, shortDescription: String? = nil, industry: Industry? = nil, logo: Logo? = nil, presentation: Presentation? = nil, workshop: Workshop? = nil, cocktail: Cocktail? = nil, booth: Booth? = nil) {
          self.init(snapshot: ["__typename": "Company", "id": id, "name": name, "homepage_url": homepageUrl, "short_description": shortDescription, "industry": industry.flatMap { (value: Industry) -> Snapshot in value.snapshot }, "logo": logo.flatMap { (value: Logo) -> Snapshot in value.snapshot }, "presentation": presentation.flatMap { (value: Presentation) -> Snapshot in value.snapshot }, "workshop": workshop.flatMap { (value: Workshop) -> Snapshot in value.snapshot }, "cocktail": cocktail.flatMap { (value: Cocktail) -> Snapshot in value.snapshot }, "booth": booth.flatMap { (value: Booth) -> Snapshot in value.snapshot }])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID? {
          get {
            return snapshot["id"] as? GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String? {
          get {
            return snapshot["name"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "name")
          }
        }

        public var homepageUrl: String? {
          get {
            return snapshot["homepage_url"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "homepage_url")
          }
        }

        public var shortDescription: String? {
          get {
            return snapshot["short_description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "short_description")
          }
        }

        public var industry: Industry? {
          get {
            return (snapshot["industry"] as? Snapshot).flatMap { Industry(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "industry")
          }
        }

        public var logo: Logo? {
          get {
            return (snapshot["logo"] as? Snapshot).flatMap { Logo(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "logo")
          }
        }

        public var presentation: Presentation? {
          get {
            return (snapshot["presentation"] as? Snapshot).flatMap { Presentation(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "presentation")
          }
        }

        public var workshop: Workshop? {
          get {
            return (snapshot["workshop"] as? Snapshot).flatMap { Workshop(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "workshop")
          }
        }

        public var cocktail: Cocktail? {
          get {
            return (snapshot["cocktail"] as? Snapshot).flatMap { Cocktail(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "cocktail")
          }
        }

        public var booth: Booth? {
          get {
            return (snapshot["booth"] as? Snapshot).flatMap { Booth(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "booth")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(snapshot: snapshot)
          }
          set {
            snapshot += newValue.snapshot
          }
        }

        public struct Fragments {
          public var snapshot: Snapshot

          public var companyDetails: CompanyDetails {
            get {
              return CompanyDetails(snapshot: snapshot)
            }
            set {
              snapshot += newValue.snapshot
            }
          }
        }

        public struct Industry: GraphQLSelectionSet {
          public static let possibleTypes = ["Industry"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, name: String? = nil) {
            self.init(snapshot: ["__typename": "Industry", "id": id, "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"] as? GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct Logo: GraphQLSelectionSet {
          public static let possibleTypes = ["Image"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("medium", type: .object(Medium.selections)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(medium: Medium? = nil) {
            self.init(snapshot: ["__typename": "Image", "medium": medium.flatMap { (value: Medium) -> Snapshot in value.snapshot }])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var medium: Medium? {
            get {
              return (snapshot["medium"] as? Snapshot).flatMap { Medium(snapshot: $0) }
            }
            set {
              snapshot.updateValue(newValue?.snapshot, forKey: "medium")
            }
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes = ["ImageVariant"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .scalar(String.self)),
            ]

            public var snapshot: Snapshot

            public init(snapshot: Snapshot) {
              self.snapshot = snapshot
            }

            public init(url: String? = nil) {
              self.init(snapshot: ["__typename": "ImageVariant", "url": url])
            }

            public var __typename: String {
              get {
                return snapshot["__typename"]! as! String
              }
              set {
                snapshot.updateValue(newValue, forKey: "__typename")
              }
            }

            public var url: String? {
              get {
                return snapshot["url"] as? String
              }
              set {
                snapshot.updateValue(newValue, forKey: "url")
              }
            }
          }
        }

        public struct Presentation: GraphQLSelectionSet {
          public static let possibleTypes = ["Presentation"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .scalar(String.self)),
            GraphQLField("occures_at", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(title: String? = nil, occuresAt: String? = nil) {
            self.init(snapshot: ["__typename": "Presentation", "title": title, "occures_at": occuresAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var title: String? {
            get {
              return snapshot["title"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "title")
            }
          }

          public var occuresAt: String? {
            get {
              return snapshot["occures_at"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "occures_at")
            }
          }
        }

        public struct Workshop: GraphQLSelectionSet {
          public static let possibleTypes = ["Workshop"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("occures_at", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String? = nil, occuresAt: String? = nil) {
            self.init(snapshot: ["__typename": "Workshop", "name": name, "occures_at": occuresAt])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }

          public var occuresAt: String? {
            get {
              return snapshot["occures_at"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "occures_at")
            }
          }
        }

        public struct Cocktail: GraphQLSelectionSet {
          public static let possibleTypes = ["Cocktail"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(name: String? = nil) {
            self.init(snapshot: ["__typename": "Cocktail", "name": name])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var name: String? {
            get {
              return snapshot["name"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "name")
            }
          }
        }

        public struct Booth: GraphQLSelectionSet {
          public static let possibleTypes = ["Booth"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("location", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(id: GraphQLID? = nil, location: String? = nil) {
            self.init(snapshot: ["__typename": "Booth", "id": id, "location": location])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID? {
            get {
              return snapshot["id"] as? GraphQLID
            }
            set {
              snapshot.updateValue(newValue, forKey: "id")
            }
          }

          public var location: String? {
            get {
              return snapshot["location"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "location")
            }
          }
        }
      }
    }
  }
}

public struct CompanyDetails: GraphQLFragment {
  public static let fragmentString =
    "fragment CompanyDetails on Company {\n  __typename\n  id\n  name\n  homepage_url\n  short_description\n  industry {\n    __typename\n    id\n    name\n  }\n  logo {\n    __typename\n    medium {\n      __typename\n      url\n    }\n  }\n  presentation {\n    __typename\n    title\n    occures_at\n  }\n  workshop {\n    __typename\n    name\n    occures_at\n  }\n  cocktail {\n    __typename\n    name\n  }\n  booth {\n    __typename\n    id\n    location\n  }\n}"

  public static let possibleTypes = ["Company"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .scalar(GraphQLID.self)),
    GraphQLField("name", type: .scalar(String.self)),
    GraphQLField("homepage_url", type: .scalar(String.self)),
    GraphQLField("short_description", type: .scalar(String.self)),
    GraphQLField("industry", type: .object(Industry.selections)),
    GraphQLField("logo", type: .object(Logo.selections)),
    GraphQLField("presentation", type: .object(Presentation.selections)),
    GraphQLField("workshop", type: .object(Workshop.selections)),
    GraphQLField("cocktail", type: .object(Cocktail.selections)),
    GraphQLField("booth", type: .object(Booth.selections)),
  ]

  public var snapshot: Snapshot

  public init(snapshot: Snapshot) {
    self.snapshot = snapshot
  }

  public init(id: GraphQLID? = nil, name: String? = nil, homepageUrl: String? = nil, shortDescription: String? = nil, industry: Industry? = nil, logo: Logo? = nil, presentation: Presentation? = nil, workshop: Workshop? = nil, cocktail: Cocktail? = nil, booth: Booth? = nil) {
    self.init(snapshot: ["__typename": "Company", "id": id, "name": name, "homepage_url": homepageUrl, "short_description": shortDescription, "industry": industry.flatMap { (value: Industry) -> Snapshot in value.snapshot }, "logo": logo.flatMap { (value: Logo) -> Snapshot in value.snapshot }, "presentation": presentation.flatMap { (value: Presentation) -> Snapshot in value.snapshot }, "workshop": workshop.flatMap { (value: Workshop) -> Snapshot in value.snapshot }, "cocktail": cocktail.flatMap { (value: Cocktail) -> Snapshot in value.snapshot }, "booth": booth.flatMap { (value: Booth) -> Snapshot in value.snapshot }])
  }

  public var __typename: String {
    get {
      return snapshot["__typename"]! as! String
    }
    set {
      snapshot.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID? {
    get {
      return snapshot["id"] as? GraphQLID
    }
    set {
      snapshot.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String? {
    get {
      return snapshot["name"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "name")
    }
  }

  public var homepageUrl: String? {
    get {
      return snapshot["homepage_url"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "homepage_url")
    }
  }

  public var shortDescription: String? {
    get {
      return snapshot["short_description"] as? String
    }
    set {
      snapshot.updateValue(newValue, forKey: "short_description")
    }
  }

  public var industry: Industry? {
    get {
      return (snapshot["industry"] as? Snapshot).flatMap { Industry(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "industry")
    }
  }

  public var logo: Logo? {
    get {
      return (snapshot["logo"] as? Snapshot).flatMap { Logo(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "logo")
    }
  }

  public var presentation: Presentation? {
    get {
      return (snapshot["presentation"] as? Snapshot).flatMap { Presentation(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "presentation")
    }
  }

  public var workshop: Workshop? {
    get {
      return (snapshot["workshop"] as? Snapshot).flatMap { Workshop(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "workshop")
    }
  }

  public var cocktail: Cocktail? {
    get {
      return (snapshot["cocktail"] as? Snapshot).flatMap { Cocktail(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "cocktail")
    }
  }

  public var booth: Booth? {
    get {
      return (snapshot["booth"] as? Snapshot).flatMap { Booth(snapshot: $0) }
    }
    set {
      snapshot.updateValue(newValue?.snapshot, forKey: "booth")
    }
  }

  public struct Industry: GraphQLSelectionSet {
    public static let possibleTypes = ["Industry"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .scalar(GraphQLID.self)),
      GraphQLField("name", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID? = nil, name: String? = nil) {
      self.init(snapshot: ["__typename": "Industry", "id": id, "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID? {
      get {
        return snapshot["id"] as? GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }
  }

  public struct Logo: GraphQLSelectionSet {
    public static let possibleTypes = ["Image"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("medium", type: .object(Medium.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(medium: Medium? = nil) {
      self.init(snapshot: ["__typename": "Image", "medium": medium.flatMap { (value: Medium) -> Snapshot in value.snapshot }])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var medium: Medium? {
      get {
        return (snapshot["medium"] as? Snapshot).flatMap { Medium(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "medium")
      }
    }

    public struct Medium: GraphQLSelectionSet {
      public static let possibleTypes = ["ImageVariant"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("url", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(url: String? = nil) {
        self.init(snapshot: ["__typename": "ImageVariant", "url": url])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var url: String? {
        get {
          return snapshot["url"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "url")
        }
      }
    }
  }

  public struct Presentation: GraphQLSelectionSet {
    public static let possibleTypes = ["Presentation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("title", type: .scalar(String.self)),
      GraphQLField("occures_at", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(title: String? = nil, occuresAt: String? = nil) {
      self.init(snapshot: ["__typename": "Presentation", "title": title, "occures_at": occuresAt])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var title: String? {
      get {
        return snapshot["title"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "title")
      }
    }

    public var occuresAt: String? {
      get {
        return snapshot["occures_at"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "occures_at")
      }
    }
  }

  public struct Workshop: GraphQLSelectionSet {
    public static let possibleTypes = ["Workshop"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .scalar(String.self)),
      GraphQLField("occures_at", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(name: String? = nil, occuresAt: String? = nil) {
      self.init(snapshot: ["__typename": "Workshop", "name": name, "occures_at": occuresAt])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }

    public var occuresAt: String? {
      get {
        return snapshot["occures_at"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "occures_at")
      }
    }
  }

  public struct Cocktail: GraphQLSelectionSet {
    public static let possibleTypes = ["Cocktail"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("name", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(name: String? = nil) {
      self.init(snapshot: ["__typename": "Cocktail", "name": name])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var name: String? {
      get {
        return snapshot["name"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "name")
      }
    }
  }

  public struct Booth: GraphQLSelectionSet {
    public static let possibleTypes = ["Booth"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .scalar(GraphQLID.self)),
      GraphQLField("location", type: .scalar(String.self)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(id: GraphQLID? = nil, location: String? = nil) {
      self.init(snapshot: ["__typename": "Booth", "id": id, "location": location])
    }

    public var __typename: String {
      get {
        return snapshot["__typename"]! as! String
      }
      set {
        snapshot.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID? {
      get {
        return snapshot["id"] as? GraphQLID
      }
      set {
        snapshot.updateValue(newValue, forKey: "id")
      }
    }

    public var location: String? {
      get {
        return snapshot["location"] as? String
      }
      set {
        snapshot.updateValue(newValue, forKey: "location")
      }
    }
  }
}