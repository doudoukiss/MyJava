struct PointValue {
    var x: Int
    var y: Int
}

class PointRef {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

struct PointValue {
    // ...

    mutating func move(to: PointValue) {
        self.x = to.x
        self.y = to.y
    }
}

mutating func move(to: PointValue) {
    self = to
}

class PointRef {
    // ...
    func move(to: PointRef) {
        self = to // !! Compile time error !!
    }
}

class Point2D {
    var x: Double = 0
    var y: Double = 0
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }

    convenience init(at: (Double, Double)) {
        self.init(x: at.0, y: at.1)
    }

    convenience init?(at: (String, String)) {
        guard let x = Double(at.0),
            let y = Double(at.1) else { 
                return nil 
            }
        
        self.init(at: (x, y))
    }
}

class Point3D: Point2D {
    var z: Double
    
    init(x: Double = 0, y: Double = 0, z: Double = 0) {
        self.z = z
        super.init(x: x, y: y)
    }

    override init(x: Double, y: Double) {
        self.z = 0
        super.init(x: x, y: y)
    }

    override init?(xy: Double) {
        if xy <= 0 { return nil }
        
        self.z = xy
        super.init(x: xy, y: xy)
    }
}

// Designated init
let point22 = Point3D(xy: 2)
// Convenience init
let point33 = Point3D(at: (3, 3))
let point44 = Point3D(at: ("4", "4"))

class Point3D: Point2D {
    // ...
    init(x: Double = 0, y: Double = 0, z: Double = 0) {
        // Phase 1
        self.z = z
        super.init(x: x, y: y)
        
        // Phase 2
        self.initXYZ(x: x, y: y, z: z)
    }
}

class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Employee: Person {
    var staffNumber: Int

    init(name: String, staffNumber: Int) {
        self.staffNumber = staffNumber

        super.init(name: name)
    }
}

func printNumber(of employee: Employee) {
    print(employee.staffNumber)
}

printNumber(of: jeff)
printNumber(of: mars)

class Bird {

}

class FlyingBird: Bird {
    func fly() {}
}

class Penguin: Bird {

}

class Penguin: Bird {
    override func fly() {
        fatalError("Penguin cannot fly.")
    }
}

class Rectangle {
    var w: Double
    var h: Double

    init(w: Double, h: Double) {
        self.w = w
        self.h = h
    }
}

class Square: Rectangle {
    init(edge: Double) {
        super.init(w: edge, h: edge)
    }
}

func scaleWidth(of rect: Rectangle) {
    let oldHeight = rect.h
    rect.w *= 1.1

    assert(oldHeight == rect.h)
}

class FIFOQueue {
    var storage: NSMutableArray
    
    init(_ storage: NSMutableArray) {
        self.storage = storage
    }
}
extension FIFOQueue {
    var count: Int {
        return storage.count
    }
    
    func enqueue(element: Any) {
        self.storage.insert(element, at: 0)
    }
    
    func dequeue() -> Any? {
        let last = storage.lastObject
        self.storage.removeLastObject()
        
        return last
    }
}

class Square: Shape {
    override func draw(color: Color = .yellow) {
        print("A \(color) square.")
    }

}

class Circle: Shape {
    override func draw(color: Color = .green) {
        print("A \(color) circle.")
    }
}

class Square: Shape {
    override func draw(color: Color = .red) {
        print("A \(color) square.")
    }
}

class Shape {
    enum Color { case red, yellow, green }
    
    func doDraw(of color: Color) {
        print("A \(color) shape.")
    }
}

extension Shape {
    func draw(color: Color = .red) {
        doDraw(of: color)
    }
}

class Square: Shape {
    override func doDraw(of color: Color) {
        print("A \(color) square.")
    }

}

class Circle: Shape {
    override func doDraw(of color: Color) {
        print("A \(color) circle.")
    }
}

let s = Square()
let c = Circle()

s.draw()
c.draw()

class Role {
    fileprivate func doPower() -> Int {
        return 0
    }
}

extension Role {
    public func power() -> Int {
        // pre settings here
        let value = doPower()
        // post settings here
        return value
    }
}

class Player: Role {
    fileprivate func doPower() -> Int {
        return 100
    }
}

func defaultPower(role: Role) -> Int {
    return 0
}

class Role {
    typealias PowerFn = (Role) -> Int

    var powerFn: PowerFn

    init(powerFn: @escaping PowerFn = defaultPower) {
        self.powerFn = powerFn
    }
}

extension Role {
    func power() -> Int {
        return powerFn(self)
    }
}

enum Level {
    case simple, normal, hard

    func rolePower(role: Role) -> Int {
        switch self {
            case .simple:
                return 300
            case .normal:
                return 200
            case .hard:
                return 100
        }
    }
}

let level = Level.simple
p1.powerFn = Level.rolePower(level)

class Power {
    func calc(role: Role) -> Int {
        return 100
    }
}

class Role {
    var powerFn: Power

    init(powerFn: Power) {
        self.powerFn = powerFn
    }
}

extension Role {
    func power() -> Int {
        return powerFn.calc(role: self)
    }
}

class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized.")
    }
    
    deinit {
        print("\(name) is being deinitialized.")
    }
}

var ref1: Person? = Person(name: "Mars")
var ref2: Person? = ref1
ref1 = nil
ref2 = nil

class Person {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized.")
    }
    
    deinit {
        print("\(name) is being deinitialized.")
    }
}

class Apartment {
    let unit: String
    var tenant: Person?
    
    init(unit: String) {
        self.unit = unit
        print("Apartment \(unit) is being initialized.")
    }
    
    deinit {
        print("Apartment \(unit) is being deinitialized.")
    }
}

var mars: Person? = Person(name: "Mars")
var unit11: Apartment? = Apartment(unit: "11")
mars?.apartment = unit11
unit11?.tenant = mars

class Person {
    let name: String
    var apartment: Apartment?
    var car: Car?
    // ...
}

class Car {
    var owner: Person
    
    init(owner: Person) {
        self.owner = owner
        print("Car is being initialized.")
    }
    
    deinit {
        print("Car is being deinitialized.")
    }
}
var mars: Person? = Person(name: "Mars")
var car11 = Car(owner: mars!)
mars?.car = car11
if true {
    var mars: Person? = Person(name: "Mars")
    var car11 = Car(owner: mars!)

    mars?.car = car11
    mars = nil
}

class Role {
    var name: String
    var action: () -> Void = { }

    init(_ name: String = "Foo") {
        self.name = name
        print("\(self) init")
    }

    deinit {
        print("\(self) deinit")
    }
}

extension Role: CustomStringConvertible {
    var description: String {
        return "<Role: \(name)>"
    }
}

if true {
    var boss = Role("boss")
    let fn = {
        print("\(boss) takes this action.")
    }
    boss.action = fn
}

class Role {
    lazy var action: () -> Void = {
        print("\(self) takes action.")
    }
}
if true {
    var boss = Role("boss")
    boss.action()
}

if true {
    var boss = Role("boss")
    let fn = { [unowned boss] in
        print("\(boss) takes action.")
    }

    boss.action = fn
}

if true {
    var boss = Role("boss")
    let fn = { [unowned boss] in
        print("\(boss) takes action.")
    }

    boss = Role("hidden boss")
    boss.action = fn

    boss.action()
}

class Role {
    // ...
    func levelUp() {
        let globalQueue = DispatchQueue.global()

        globalQueue.async {
            print("Before: \(self) level up")
            usleep(1000)
            print("After: \(self) level up")
        }
    }
}

var player: Role? = Role("P1")
player?.levelUp()

usleep(500)

print("Player set to nil")
player = nil

dispatchMain()

globalQueue.async { [weak self] in
    withExtendedLifetime(self) {
        print("Before: \(self!) level up")
        usleep(1000)
        print("After: \(self!) level up")
    }
}

extension Optional {
    func withExtendedLifetime(_ body: (Wrapped) -> Void) {
        if let value = self {
            body(value)
        }
    }
}

# Modules
Compiler tree

let package = Package(
    name: "Compiler",
    targets: [
        Target(name: "Application", dependencies: ["Compiler"])
    ]
)

class Compiler {}
import Compiler
let lang = Compiler()

open class Compiler {
    public init() { 
        print("Compiler initiated") 
    }
}

open class Compiler {
    var sourceFiles: [String]
    
    public init(_ sourceFiles: [String]) {
        self.sourceFiles = sourceFiles
        print("Compiler initiated")
    }
}

class MyCompiler: Compiler {
    public override init(_ sourceFiles: [String]) {
        super.init(sourceFiles)
        print("MyCompiler initiated")
    }
}

open class Compiler {
    // ...

    func build() {
        sourceFiles.forEach {
            // Phase 1
            compile(filePath: $0)
            // Phase 2
            assemble(filePath: $0)
        }

        // Phase 3
        link()
    }

    func compile(filePath: String) { }

    func assemble(filePath: String) { }

    func link() { }
}

open class Compiler {
    // ...

    public func build() {
        // ...
    }

    open func compile(filePath: String) { }

    open func assemble(filePath: String) { }

    open link() { }
}

open class Compiler {
    // ...
    public func build() {
        sourceFiles.forEach {
            // Phase 1
            compile(filePath: $0)
            Log.info("\($0) compile finished")
            
            // Phase 2
            assemble(filePath: $0)
            Log.info("\($0) assemble finished")
        }

        // Phase 3
        link()
        Log.info("Link finished")
    }
}

struct MyStruct {
    func myMethod1() {
        let number = 10
    }
}

let myStruct = MyStruct()
myStruct.myMethod1()

disassemble --line
lldb  di -l   
di -s 0x100001ae0

class Base {
    func method1() {}
}

class Subclass: Base {
    override func method1() {}
    func method2() {}
}

let b = Base()
b.method1()

let s = Subclass()
s.method1()

protocol MyProtocol {
}

extension MyProtocol {
    func method3() { print("MyProtocol.method3") }
}

class Base: MyProtocol {
    func method1() {}
    func method3() { print("Base.method3") }
}

let b = Base()
let p: MyProtocol = b

b.method3()
p.method3()

class Base: MyProtocol {
    func method4() { print("Base.method4") }
}

class Subclass: Base {
    override func method4() { print("Subclass.method4") }
}

class Base: NSObject {
    func method5() { print("Base.method5") }
}

class Subclass: Base {
}

extension Subclass {
    override func method5() { print("Subclass.method5") }
}

let base: Base = Subclass()
base.method5()

