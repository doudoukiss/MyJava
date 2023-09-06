eval "$(curl -sL check.vapor.sh)"
brew install vapor/tap/vapor
vapor new HelloVapor --api --branch=beta

static func resolveParameter(_ parameter: String,
                          on container: Container)
    throws -> Future<Episode?> {

}

static func resolveParameter(_ parameter: String,
                      on container: Container)
    throws -> Future<Episode?> {
    return Future.map(on: container) {
        Episode(id: parameter)
    }
}

struct Episode: Content {
    var id: Int
    var desc: String

    init(id: Int, desc: String) {
        self.id = id
        self.desc = desc
    }

    init?(id: String) {
        if let eid = Int(id) {
            self.init(id: eid,
                desc: "Description of episode \(eid)")
        }
        else {
            return nil
        }
    }
}

router.get("episodes", Episode.parameter) {
    req -> Episode in
    return try req.parameters.next(Episode.self)
}

router.get("episodes", Episode.parameter) {
    req -> Future<Episode> in

    let episode = try req.parameters.next(Episode.self)

    return episode.map(to: Episode.self) {
        episode in
        guard let episode = episode else {
            throw Abort(.badRequest)
        }

        return episode
    }
}

episode.map(to: Episode.self) {
    episode in
    guard let episode = episode else {
        throw Abort(.badRequest)
    }

    return episode
}

func getEpisode(from req: Request) -> Future<Episode> {
    return req.future(
        Episode(id: 1, desc: "Just for demo.")
    )
}

func save(_ episode: Episode, for req: Request)
    -> Future<Response> {
    return episode.encode(status: .created, for: req)
}


router.post("episode") {
        req in
        return getEpisode(from: req)
            .flatMap(to: Response.self) {
                episode in
                return save(episode, for: req)
            }
    }

 router.post("episode") {
        req in

        return getEpisode(from: req)
            .flatMap(to: Response.self) {
                episode in
                return save(episode, for: req)
            }
            .transform(to: HTTPStatus.noContent)
    }

router.post("episodes") {
    req -> Future<HTTPStatus> in
    let episodes = [
        Episode(id: 1, desc: "Just for demo1."),
        Episode(id: 2, desc: "Just for demo2."),
        Episode(id: 3, desc: "Just for demo3.")
    ]

    var saved = [Future<Response>]()

    for episode in episodes {
        saved.append(save(episode, for: req))
    }

    return saved.flatten(on: req).transform(to: HTTPStatus.created)
}

router.post("upload") {
    req -> Future<Response> in
    let hardCoded = getEpisode(from: req)
    let decoded = try req.content.decode(Episode.self)

    return flatMap(to: [Episode].self, hardCoded, decoded) {
        ep1, ep2 in
        return req.future([ep1, ep2])
    }.encode(status: .created, for: req)
}

static func resolveParameter(
    _ parameter: String,
    on container: Container)
    throws -> Future<Episode?> {

        return Future.map(on: container) {
            let e = Episode(id: parameter)

            if e != nil { return e }

            throw Abort(HTTPResponseStatus.badRequest)
        }
    }

router.get("episodes", Episode.parameter) {
    req -> Future<Episode> in

    return try req.parameters.next(Episode.self)
        .map {
            return $0!
        }
        .catch { error in
            print("Exception: \(error)")
        }
}

return try req.parameters.next(Episode.self)
    .map {
        return $0!
    }
    .catchMap { error in
        print("Exception: \(error)")
        return Episode(id: 0, desc: "Unknown")
    }
    .always {
        print("Episode returned.")
    }

typealias Completion = (Result<[User]>) -> Void

func load(_ completion: @escaping Completion) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!

    let task = URLSession.shared.dataTask(with: url) {
        data, _, error in
        if let error = error {
            completion(.error(error))
        }
        else {
            do {
                let users = try JSONDecoder().decode(
                    [User].self, from: data!)
                completion(Result.value(users))
            }
            catch {
                completion(Result.error(error))
            }
        }
    }

    task.resume()
}

class Promise<ValueType>: Future<ValueType> {
    func resolve(with value: ValueType) {
        result = .value(value)
    }

    func reject(with error: Error) {
        result = .error(error)
    }
}

extension URLSession {
    func request(url: URL) -> Future<Data> {
        let promise = Promise<Data>()

        let task = dataTask(with: url) {
            data, _, error in
            if let error = error {
                promise.reject(with: error)
            }
            else {
                promise.resolve(with: data!)
            }
        }

        task.resume()
        return promise
    }
}

func load() -> Future<Data> {
    let url = URL(
        string: "https://jsonplaceholder.typicode.com/users")!
    return URLSession.shared.request(url: url)
}

load().register {
    result in
    switch result {
    case .value(let value):
        let users = try! JSONDecoder()
            .decode([User].self, from: value)
        print(users)
    case .error(let error):
        print(error)
    }
}

class Future<ValueType> {
    /// ...
    func map<NewValueType>(
        _ closure: @escaping (ValueType) throws -> NewValueType)
        rethrows -> Future<NewValueType> {}
}

func map<NewValueType>(
    _ closure: @escaping (ValueType) throws -> NewValueType)
    rethrows -> Future<NewValueType> {
    let promise = Promise<NewValueType>()

    register { r in
        switch r {
        case .value(let value):
            do {
                let newValue = try closure(value)
                promise.resolve(with: newValue)
            }
            catch {
                promise.reject(with: error)
            }
        case .error(let error):
            promise.reject(with: error)
        }
    }

    return promise
}

func load() -> Future<[User]> {
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!

    return URLSession.shared.request(url: url).map {
        data in
        try! JSONDecoder().decode([User].self, from: data)
    }
}

load().register {
    users in
    switch users {
    case .value(let users):
        print(users)
    case .error(let error):
        print(error)
    }
}

func transform<NewValueType>(to: NewValueType)
    -> Future<NewValueType> {
    return map { _ in to }
}

router.group("v1") {
    group in
    group.group("episodes", Int.parameter) {
        subgroup in
        subgroup.post("play") {
            req -> String in
            let id = try req.parameters.next(Int.self)
            return "Play episode \(id)"
        }

        subgroup.post("finish") {
            req -> String in
            let id = try req.parameters.next(Int.self)
            return "Finish episode \(id)"
        }
    }
}

let subgroup = group.grouped("episodes", Int.parameter)
subgroup.post("play") {
    req -> String in
    let id = try req.parameters.next(Int.self)
    return "Play episode \(id)"
}

subgroup.post("finish") {
    req -> String in
    let id = try req.parameters.next(Int.self)
    return "Finish episode \(id)"
}

final class BoxueRouteCollection: RouteCollection {}
func boot(router: Router) throws {
    let boxue = router.grouped("episode", Int.parameter)

    boxue.get("play") {
        req -> HTTPStatus in
        let id = try req.parameters.next(Int.self)
        print("play episode \(id)")

        return HTTPStatus.noContent
    }

    boxue.post("finish") {
        req -> HTTPStatus in
        let id = try req.parameters.next(Int.self)
        print("finish episode \(id)")

        return HTTPStatus.noContent
    }
}

public func routes(_ router: Router) throws {
    try router.register(collection: BoxueRouteCollection())
}

