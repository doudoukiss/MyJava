let cInt: CInt = 10
let cChar: CChar = 49
typealias CInt = Int32
const int global_ten;
const int global_ten = 10;

typedef NSString * TrafficLightColor NS_STRING_ENUM;

TrafficLightColor const TrafficLightColorRed;
TrafficLightColor const TrafficLightColorYellow;
TrafficLightColor const TrafficLightColorGreen;

TrafficLightColor const TrafficLightColorRed = @"Red";
TrafficLightColor const TrafficLightColorYellow = @"Yellow";
TrafficLightColor const TrafficLightColorGreen = @"Green";

struct TrafficLightColor: RawRepresentable {
    typealias RawValue = String

    init(rawValue: RawValue)
    var rawValue: RawValue { get }

    static var red: TrafficLightColor { get }
    static var yellow: TrafficLightColor { get }
    static var green: TrafficLightColor { get }
}

let redColor: TrafficLightColor = .red
let redColorRawValue = redColor.rawValue

typedef int Shape NS_EXTENSIBLE_STRING_ENUM;

Shape const ShapeCircle;
Shape const ShapeTriangle;
Shape const ShapeSquare;

Shape const ShapeCircle = 1;
Shape const ShapeTriangle = 2;
Shape const ShapeSquare = 3;

extension Shape {
    static var ellipse: Shape {
        return Shape(4)
    }
}

extension TrafficLightColor {
    static var blue: TrafficLightColor {
        return TrafficLightColor(rawValue: "Blue")
    }
}

int add(int m, int n);

int add(int m, int n) {
    return m + n;
}

func add(_ m: Int32, _ n: Int32) -> Int32 {
    return m + n
}

int sum(int count, ...);
int vsum(int count, va_list numbers);

int sum(int count, ...) {
    va_list ap;
    int s = 0;

    va_start(ap, count);
    vsum(count, ap);
    va_end(ap);

    return s;
}

int vsum(int count, va_list numbers) {
    int s = 0;
    int i = 0;

    for (; i < count; ++i) {
        s += va_arg(numbers, int);
    }

    return s;
}

func vsum(count: Int32, numbers: CVaListPointer) -> Int32

let vaListPointer = getVaList([1, 2, 3, 4, 5, 6])
let sum = vsum(6, vaListPointer)

let sum = withVaList([1, 2, 3, 4, 5, 6]) {
    vaListPointer in
    vsum(6, vaListPointer)
}

var intPtr = UnsafeMutablePointer<Int>.allocate(capacity: 10)
intPtr.initialize(to: 0, count: 10)

// Add memory access operations here.

intPtr.deinitialize()
intPtr.deallocate(capacity: 10)

class Foo {
    var m: Int = 0
}

var fooPtr = UnsafeMutablePointer<Foo>.allocate(capacity: 10)

/// You app may crash at any step below
fooPtr[0] = Foo()
fooPtr[1] = Foo()
fooPtr[2] = Foo()

fooPtr.deinitialize()
fooPtr.deallocate(capacity: 10)

extension UnsafeMutablePointer
    where Pointee: CustomStringConvertible {
    func dump(count: Int) -> Void {
        var info: String = ""

        for i in 0..<count {
            info += self[i].description + " "
        }

        print(info)
    }
}

head.dump(count: 10)

for i in 1...10 {
    intPtr[i - 1] = i
}

head.dump(count: 10)

for i in 1...10 {
    (intPtr + (i - 1)).pointee = i
}

for i in 1...10 {
    intPtr += 1
    intPtr.predecessor().pointee = i
}

var head = UnsafeMutablePointer<Int>.allocate(capacity: 10)
var buffer = UnsafeMutableBufferPointer(start: head, count: 10)

buffer.isEmpty 
buffer.count

buffer.max(by: >)
buffer.min(by: <)

let m = buffer[0]
let n = buffer[0..<5]

buffer.sort(by: >)
let sorted = buffer.sorted(by: >)

buffer.reverse()
let reversed = buffer.reversed()

let reversedArray = [Int](reversed)

var iter = buffer.makeIterator()

while let value = iter.next() {
    print("Iter: \(value)")
}

let doubleArray = iter.map { $0 * 2 }
let evenArray = iter.filter { $0 % 2 == 0 }
let sum = iter.reduce(0) { $0 + $1 }
let doubleArray = buffer.map { $0 * 2 }
let evenArray = buffer.filter { $0 % 2 == 0 }
let sum = buffer.reduce(0) { $0 + $1 }

let intPtr = UnsafeMutablePointer<Int32>.allocate(capacity: 1)
intPtr.initialize(to: 0x12345678)

intPtr.withMemoryRebound(to: Int8.self, capacity: 1) {
    (ptr: UnsafeMutablePointer<Int8>) -> Void in

    print(ptr[0])
    print(ptr[1])
    print(ptr[2])
    print(ptr[3])
}

var helloWorld = "Hello world"

helloWorld.withCString {
    (cPtr: UnsafePointer<Int8>) -> Void in
    debugPrint(cPtr.debugDescription)
}

let asciiOfA = UInt8(ascii: "A")
let charA = Character(UnicodeScalar(65))
let stringA = String(UnicodeScalar(65))

do {
    let socket = try Socket(
        socketFilePath: "/tmp/swift_sock_demo",
        type: .passive)
}
catch {
    print(error.localizedDescription)
    exit(EXIT_FAILURE)
}

enum SocketException: Error {
    case cannotCreateSocketFile
    case socketPathTooLong
    case socketFileAlreadyExists
    case cannotBindSocketAddress
    case cannotListenOnTheSocketAddress
    case cannotAcceptConnection
    case cannotConnectToSocket
}

enum SocketType {
    case active
    case passive
}

class Socket {
    var socketFd: CInt = -1
    var sockAddrUn: sockaddr_un = sockaddr_un()

    init(socketFilePath: String, type: SocketType) throws {
    }
}

init(socketFilePath: String, type: SocketType) throws {
    #if os(Linux)
        socketFd = Glibc.socket(AF_UNIX, SOCK_STREAM, 0)
    #else
        socketFd = Darwin.socket(AF_UNIX, SOCK_STREAM, 0)
    #endif

    if socketFd == -1 {
        throw SocketException.cannotCreateSocketFile
    }

    if (type == .passive) &&
        (remove(socketFilePath) == -1) &&
        (errno != ENOENT) {
        throw SocketException.socketFileAlreadyExists
    }

    try initSockAddr(filePath: socketFilePath)
}

func initSockAddr(filePath: String) throws {
    sockAddrUn.sun_family = (sa_family_t)(AF_UNIX)

    let pathLength = filePath.unicodeScalars.count
    let sockBuffLength =
        Mirror(reflecting: sockAddrUn.sun_path).children.count

    if (pathLength + 1) > sockBuffLength {
        throw SocketException.socketPathTooLong
    }

    memcpy(&sockAddrUn.sun_path, filePath, pathLength)
}

do {
    let socket = try Socket(
        socketFilePath: "/tmp/swift_sock_demo")

    try socket.bind()
    try socket.listen(backlog: 10)
}
catch {
    print(error.localizedDescription)
}

func bind() throws {
    let rawPointer = UnsafeMutableRawPointer(&sockAddrUn)
    let generalSockAddr = rawPointer.bindMemory(
        to: sockaddr.self,
        capacity: MemoryLayout<sockaddr>.size)

    #if os(Linux)
        let bindResult = Glibc.bind(socketFd, generalSockAddr,
             socklen_t(MemoryLayout<sockaddr_un>.size))
    #else
        let bindResult = Darwin.bind(socketFd, generalSockAddr,
             socklen_t(MemoryLayout<sockaddr_un>.size))
    #endif


    if bindResult == -1 {
        throw SocketException.cannotBindSocketAddress
    }
}

func listen(backlog: CInt) throws {
    #if os(Linux)
        let result = Glibc.listen(socketFd, backlog)
    #else
        let result = Darwin.listen(socketFd, backlog)
    #endif
    guard result != -1 else {
        throw SocketException.cannotListenOnTheSocketAddress
    }
}

do {
    let socket = try Socket(socketFilePath: "/tmp/swift_sock_demo")
    try socket.bind()
    try socket.listen(backlog: 10)

    try socket.accept {
        (fd: CInt) in
        // Handle connection request here
    }
}
catch {
    print(error.localizedDescription)
}

func accept(action: (CInt) -> Void) throws {
    while true {
        #if os(Linux)
            let connFd = Glibc.accept(socketFd, nil, nil)
        #else
            let connFd = Darwin.accept(socketFd, nil, nil)
        #endif

        if connFd == -1 {
            throw SocketException.cannotAcceptConnection
        }

        action(connFd)
    }
}

try socket.accept {
    var buffer: [CChar] = Array<CChar>(repeating: 0, count: 256)
    var numRead = read($0, &buffer, 256)

    while numRead > 0 {
        if write(STDOUT_FILENO, &buffer, numRead) != numRead {
            fatalError("Partial write...")
        }

        numRead = read($0, &buffer, 256)
    }

    if numRead == -1 {
        fatalError("Read file failed")
    }

    if close($0) == -1 {
        fatalError("Cannot close the connection socket file")
    }
}

func connect(action: (CInt) -> Void) throws {
    let rawPointer = UnsafeMutableRawPointer(&sockAddrUn)
    let generalSockAddr = rawPointer.bindMemory(
        to: sockaddr.self,
        capacity: MemoryLayout<sockaddr>.size)

    #if os(Linux)
        let isConnected = Glibc.connect(socketFd,
            generalSockAddr,
            socklen_t(MemoryLayout<sockaddr_un>.size))
    #else
        let isConnected = Darwin.connect(socketFd,
            generalSockAddr,
            socklen_t(MemoryLayout<sockaddr_un>.size))
    #endif

    if isConnected == -1 {
        throw SocketException.cannotConnectToSocket
    }

    action(socketFd)
}

try socket.connect {
    var buffer: [CChar] = Array<CChar>(repeating: 0, count: 256)
    var numRead = read(STDIN_FILENO, &buffer, 256)

    while numRead > 0 {
        if write($0, &buffer, numRead) != numRead {
            fatalError("Partial write")
        }

        numRead = read(STDIN_FILENO, &buffer, 256)
    }

    if numRead == -1 {
        fatalError("Cannot read from stdin")
    }

    exit(EXIT_SUCCESS)
}

