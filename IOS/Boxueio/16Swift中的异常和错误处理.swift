let vw = Car(fuel: 2)

switch vw.start() {
case let .success(message):
    print(message)
case let .failure(error):
    if let carError = error as? CarError,
        carError == .outOfFuel {
        print("Cannot start due to out of fuel")
    }
    else {
        print(error.localizedDescription)
    }
}

extern NSString *carSensorErrorDomain;

NS_ENUM(NSInteger, CarSensorError) {
    overHeat = 100
};

@interface Sensor: NSObject {
}

+ (BOOL)checkTemperature: (NSError **)error;
@end

// In Sensor.m
NSString *carSensorErrorDomain = @"CarSensorErrorDomain";

@implementation Sensor {
}

+ (BOOL)checkTemperature: (NSError **)error {
    double temp = 10 + arc4random_uniform(120);
    
    if ((error != NULL) && (temp >= 100)) {
        NSDictionary *userInfo = @{
            NSLocalizedDescriptionKey: NSLocalizedString(
                @"The radiator is over heat", nil),
        };
        
        *error = [NSError errorWithDomain: carSensorErrorDomain
                                     code: overHeat
                                 userInfo: userInfo];
        return NO;
    }
    else if (temp >= 100) {
        return NO;
    }
    
    return YES;
}
@end

do {
    try vw.selfCheck()
} catch let error as NSError 
    where error.code == CarSensorError.overHeat.rawValue {
    // CarSensorErrorDomain
    print(error.domain)
    // The radiator is over heat
    print(error.userInfo["NSLocalizedDescription"] ?? "")
}

// In Sensor.m
NSObject* startACar() {
    Car *car = [[Car alloc] initWithFuel:5];
    
    NSError *err = nil;
    [car startAndReturnError: &err];
    
    if (err != nil) {
        NSLog(@"Error code: %ld", (long)err.code);
        NSLog(@"Error domain: %@", err.domain);
        
        return nil;
    }
    
    return car;
}

extension CarError: CustomNSError {
    static let errorDomain = "CarErrorDomain"
    
    var errorCode: Int {
        switch self {
        case .outOfFuel:
            return -100
        }
    }
    
    var errorUserInfo: [String: Any] {
        switch self {
        case .outOfFuel:
            return [
                "LocalizedDescription":
                "U r running out of fuel"
            ]
        }
    }
}

func start() throws -> String {
    guard fuelInLitre > 5 else {
        throw CarError.outOfFuel(no: no, fuelInLitre: fuelInLitre)
    }
    
    return "Ready to go"
}

func selfCheck() throws -> Bool {
    _ = try start()
    
    return true
}

var vwGroup: [Car] = []

(1...1000).forEach {
    let amount = Double(arc4random_uniform(70))
    vwGroup.append(Car(fuelInLitre: amount, no: "Car-\($0)"))
}

extension Sequence {
    func checkAll(by rule:
        (Iterator.Element) -> Bool) -> Bool {
        
        for element in self {
            guard rule(element) else { return false }
        }
        
        return true
    }
}

func checkAll(by rule:
    (Iterator.Element) throws -> Bool) -> Bool {
    
    for element in self {
        // Still error here
        guard try rule(element) else { return false }
    }
    
    return true
}

func osUpdate(postUpdate: @escaping (Result<Int>) -> Void) {
    DispatchQueue.global().async {
        // Some update staff
        let checksum = 400
        
        if checksum != 200 {
            postUpdate(.failure(CarError.updateFailed))
        }
        else {
            postUpdate(.success(checksum))
        }
    }
}

vwGroup[0].osUpdate(postUpdate: {
    switch $0 {
    case let .success(checksum):
        print("Update success: \(checksum)")
    case let .failure(error):
        print(error.localizedDescription)
    }
})

func start() throws -> String {
    guard fuel > 5 else {
        throw CarError.outOfFuel(no: no, fuel: fuel)
    }
    
    defer { Car.startCounter += 1 }

    return "Ready to go"
}

enum CarError: Error {
    case outOfFuel(no: String, fuel: Double)
    case updateFailed
    case integrationError
}

func downLoadPackage() -> Result<String> {
        return .failure(CarError.updateFailed)
    }
    
func checkIntegration(of path: String) -> Result<Int> {
    return .failure(CarError.integrationError)
}

func osUpdate(postUpdate: @escaping (Result<Int>) -> Void) {
    DispatchQueue.global().async {
        // 1. Download package
        switch self.downLoadPackage() {
        case let .success(filePath):
            // 2. Check integration
            switch self.checkIntegration(of: filePath) {
            case let .success(checksum):
                // 3. Do you want to continue from here?
                // ...
            case let .failure(e):
                postUpdate(.failure(e))
            }
        case let .failure(e):
            postUpdate(.failure(e))
        }
    }
}

extension Result {
    func flatMap<U>(transform: (T) -> Result<U>) -> Result<U> {
        switch self {
        case let .success(v):
            return transform(v)
        case let .failure(e):
            return .failure(e)
        }
    }
}

func osUpdate(postUpdate: @escaping (Result<Int>) -> Void) {
    DispatchQueue.global().async {
        let result = self.downLoadPackage()
            .flatMap {
                self.checkIntegration(of: $0)
            }
            // Chain other processes here
        
        postUpdate(result)
    }
}

Car(fuel: 10, no: "1").osUpdate(postUpdate: {
    switch $0 {
    case let .success(checksum):
        print("Update success: \(checksum)")
    case let .failure(e):
         if let e = e as? CarError {
            switch e {
            case .integrationError:
                print("Checksum error")
            default:
                break
            }
        }
        
        print("Update failed")
    }
})

