func drive(_ car: Car) {
    if !car.selfCheck() {
        car.startEngine()
        car.shiftUp()
        car.go()
    }
}

class Car {
    func selfCheck() -> Bool {
        return true
    }
    func startEngine() {}
    func shiftUp() {}
    func go() {}
    
    func lightUp() {}
    func horn() {}
    func lock() {}
    // ...
}

protocol Drivable {
    func selfCheck() -> Bool
    func startEngine()
    func shiftUp()
    func go()
}

func drive<T: Drivable>(_ car: T) {
    if !car.selfCheck() {
        car.startEngine()
        car.shiftUp()
        car.go()
    }
}

class Roadster: Drivable {
    func selfCheck() -> Bool {
        return true
    }
    func startEngine() {}
    func shiftUp() {}
    func go() {}
}

class SUV: Drivable {
    func selfCheck() -> Bool {
        return true
    }
    func startEngine() {}
    func shiftUp() {}
    func go() {}
}

drive(Roadster())
drive(SUV())

func %%(lhs: Double, rhs: Double) -> Double {
    print("Double opt.")
    return lhs.truncatingRemainder(dividingBy: rhs)
}

func %%(lhs: Float, rhs: Float) -> Float {
    print("Float opt.")
    return lhs.truncatingRemainder(dividingBy: rhs)
}

func %%<T: Integer>(lhs: T, rhs: T) -> T {
    print("Generic opt.")
    return lhs % rhs
}

func find<T: Collection>(
    value: T.Iterator.Element,
    in coll: T) -> Bool
    where T.Iterator.Element: Equatable {
        print("Equatable find")
        
        var pos = coll.makeIterator()
        var tmp = pos.next()
        
        while let n = tmp {
            if (n == value) {
                return true
            }
            
            tmp = pos.next()
        }
        
        return false
}

func find<T: Collection>(
    value: T.Iterator.Element,
    in coll: T) -> Bool
    where T.Iterator.Element: Hashable {
        print("Hashable find")
        return Set(coll).contains(value)
}

enum Level: Int {
    case beginner = 1, intermediate, advanced
}

class Episode {
    typealias EpisodeInfo = [String: String]
    
    var level: Level
    var title: String
    var urls: EpisodeInfo
    
    init(level: Level, title: String, urls: EpisodeInfo) {
        self.level = level
        self.title = title
        self.urls = urls
    }

    convenience init?(response: [String: Any]) {
        guard let levelValue = response["level"] as? Int,
            let level = Level(rawValue: levelValue),
            let title = response["title"] as? String,
            let urls = response["urls"] as? EpisodeInfo
        else {
            return nil
        }
        
        self.init(level: level, title: title, urls: urls)
    }

}

func getEpisodes() {
    // Phase 1: Network request
    let episodesData = try? Data(contentsOf: episodesUrl)

    let jsonRoot = episodesData.flatMap {
        try? JSONSerialization.jsonObject(with: $0)
    }

    // Phase 2: Parse the response
    var episodes: [Episode]? = nil

    if let jsonRoot = (jsonRoot as? JSONObj),
       let episodeInfo = (jsonRoot["episodes"] as? [JSONObj]) {
        episodes = episodeInfo.map {
            Episode(response: $0)
        }
        .filter { $0 != nil }
        .map { $0! }
    }
    // Phase 3: Business logic
    callback(episodes)
}

// =====
func getResource<T>(at path: URL,
                    parse: (Any) -> T?,
                    callback: (T?) -> Void) {
    // Phase 1: Network request
    let resourceData = try? Data(contentsOf: path)

    let jsonRoot = resourceData.flatMap {
        try? JSONSerialization.jsonObject(with: $0, options: [])
    }

    callback(jsonRoot.flatMap(parse))
}

func parseEpisodes(jsonRoot: Any) -> [Episode]? {
    var episodes: [Episode]? = nil

    if let jsonRoot = (jsonRoot as? JSONObj),
       let episodeInfo = jsonRoot["episodes"] as? [JSONObj] {
        episodes = episodeInfo.map {
                Episode(response: $0)
            }
            .filter { $0 != nil }
            .map { $0! }
    }

    return episodes
}

func getEpisodes() {
    getResource(at: URL("https://api.boxue.io/v1/episodes")!, 
        parse: parseEpisodes,  
        callback: { print($0 ?? "") })
}

struct Resource<T> {
    let path: URL
    let parser: (Any) -> T?
}

extension Resource {
    func syncLoad(callback: (T?) -> Void) {
        let resourceData = try? Data(contentsOf: path)

        let jsonRoot = resourceData.flatMap {
            try? JSONSerialization.jsonObject(with: $0, options: [])
        }

        callback(jsonRoot.flatMap(parse))
    }
}

let episodeResource: Resource<[Episode]> =
    Resource(
        path: URL("https://api.boxue.io/v1/episodes")!, 
        parser: parseEpisodes)

episodeResource.syncLoad(
    callback: { print($0 ?? "") })

extension Resource {
    func asyncLoad(
        callback: @escaping (T?) -> Void) {
        let session = URLSession.shared

        session.dataTask(with: path) { 
            resourceData, _, _ in
            let jsonRoot = resourceData.flatMap {
                try? JSONSerialization.jsonObject(with: $0)
            }

            callback(jsonRoot.flatMap(self.parse))
        }.resume()
    }
}

