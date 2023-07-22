sudo gem install cocoapods
pop init
pop install

import UIKit
import Alamofire
override func viewDidLoad() {
    super.viewDidLoad()
    Alamofire.request(.GET, "https://httpbin.org/ip")
}
public enum Method: String {
    case OPTIONS, GET, HEAD, POST, PUT, PATCH, DELETE, TRACE, CONNECT
}
override func viewDidLoad() {
    super.viewDidLoad()
    Alamofire.request(.GET, "https://httpbin.org/ip")
        .response { request, response, data, error in 
            print(request)
            print(response)
            print(data)
            print(error)
        }
}
public func response(
    queue queue: dispatch_queue_t? = nil,
    completionHandler: 
        (NSURLRequest?, 
         NSHTTPURLResponse?, 
         NSData?, 
         NSError?) -> Void)
    -> Self
{
    delegate.queue.addOperationWithBlock {
        dispatch_async(queue ?? dispatch_get_main_queue()) {
            completionHandler(self.request, 
                self.response, 
                self.delegate.data, 
                self.delegate.error)
        }
    }

    return self
}

Alamofire.request(.GET, "https://httpbin.org/get")
    .responseJSON(completionHandler: { response in
        print("JSON ================")
        
        switch response.result {
        case .Success(let json):
            let dict = json as! Dictionary
            let origin = dict["origin"] as! String
            let headers = dict["headers"] as! Dictionary
            
            print("origin: \(origin)")
            let ua = headers["User-Agent"]
            print("UA: \(ua)")
        case .Failure(let error):
            print("\(error)")
        }
    })

class AlamofireController extends Controller
{
    public function index(Request $request)
    {
        $data = $request->all();
        return response()->json($data);
    }
}

let getRequest = "https://apidemo.boxue.io/alamofire?XDEBUG_SESSION_START=PHPSTORM"

Alamofire.request(.GET, getRequest)
    .responseJSON(completionHandler: { response in
        switch response.result {
        case .Success(let json):
            print("JSON: ================")
        case .Failure(let error):
            print("\(error)")
        }
    })

Route::resource("alamofire", "AlamofireController");
let requestUrl = "https://apidemo.boxue.io/alamofire"

Alamofire.request(.GET, requestUrl)
let manager = Alamofire.Manager.sharedInstance
manager.request(.GET, requestUrl )

class ViewController: UIViewController {
    lazy var ephemeralManager: Manager = {
        // Get additional header
        var defHeaders = Alamofire.Manager.sharedInstance
                .session
                .configuration
                .HTTPAdditionalHeaders ?? [:]
        
        // Set configuration
        let conf = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        conf.HTTPAdditioinalHeaders = defHeaders
        
        // Generate manger
        return Alamofire.Manager(configuration: conf)
    }()

    //  ...
}

let requestUrl = "https://apidemo.boxue.io/alamofire?XDEBUG_SESSION_START=PHPSTORM"
let parameters = [ "foo": 1 ]

Alamofire.request(.GET, requestUrl, parameters: parameters)
    .responseJSON(completionHandler: { response in
        switch response.result {
        case .Success(let json):
            print("JSON: ================")
            print("\(json)")
        case .Failure(let error):
            print("\(error)")
        }
    })

let requestParameters = "&foo[]=1&foo[]=2&bar[x]=a&bar[y]=2"
requestUrl = requestUrl + requestParameters

requestUrl.stringByAddingPercentEncodingWithAllowedCharacters(
    NSCharacterSet.URLQueryAllowedCharacterSet()
)

let encodedUrl = 
    requestUrl.stringByAddingPercentEncodingWithAllowedCharacters(
        NSCharacterSet.URLQueryAllowedCharacterSet()
    )!

let requestUrl = "https://apidemo.boxue.io/alamofire?XDEBUG_SESSION_START=PHPSTORM"
let parameters = [
    "foo": [1, 2],
    "bar": [
        "x": "a",
        "y": 2
    ]
]

Alamofire.request(.POST, requestUrl, parameters: parameters, encoding: .JSON)

Route::group(['middleware' => ['api']], function () {
    Route::get('/alamofire', 'AlamofireController@index');

    Route::post('/alamofire', [
            'middleware' => 'auth.basic.once', 
            'uses' => 'AlamofireController@store']);
});

protected $routeMiddleware = [
    // omit for simplicity

    'auth.basic.once' => \App\Http\Middleware\AuthenticateOnceWithBasicAuth::class
];

public function store(Request $request)
{
    //
    $data = $request->all();

    return response()->json([
        'status' => 'successful',
        'data' => $data], 201);
}

let credentialData = 
    "\(user):\(pw)".dataUsingEncoding(NSUTF8StringEncoding)!
let base64Credentials = 
    credentialData.base64EncodedStringWithOptions([])
    
let headers = ["Authorization": "Basic \(base64Credentials)"]

Alamofire.request(.POST, 
    "https://apidemo.boxue.io/alamofire", 
    headers: headers)
    .responseJSON(completionHandler: { response in
        debugPrint(response)
    })

enum DownloadStatus {
    case NotStarted
    case Downloading
    case Suspended
    case Cancelled
}

class ViewController: UIViewController {
    var currStatus = DownloadStatus.NotStarted
}

extension ViewController {
    // Enable download button when UITextField is not ""
    @IBAction func valueChanged(sender: UITextField) {
        print("text field: \(sender.text)")
        
        if sender.text != "" {
            self.beginBtn.enabled = true
        }
        else {
            self.beginBtn.enabled = false
        }
    }

    // Button actions
    @IBAction func beginDownload(sender: AnyObject) {
        print("Begin downloading...")
        
        // TODO: Add begin downloading code here
        
        self.suspendOrResumeBtn.enabled = true;
        self.cancelBtn.enabled = true;
        self.currStatus = .Downloading
    }
    
    @IBAction func suspendOrResumeDownload(sender: AnyObject) {
        var btnTitle: String?
        
        switch self.currStatus {
        case .Downloading:
            print("Suspend downloading...")
            
            self.currStatus = .Suspended
            btnTitle = "Resume"
        case .Suspended:
            print("Resume downloading...")
            
            self.currStatus = .Downloading
            btnTitle = "Suspend"
        case .NotStarted, .Cancelled:
            break
        }
        
        self.suspendOrResumeBtn.setTitle(btnTitle, 
            forState: UIControlState.Normal)
    }
    
    @IBAction func cancelDownload(sender: AnyObject) {
        print("Cancel downloading...")
        
        switch self.currStatus {
        case .Downloading, .Suspended:
            self.currStatus = .Cancelled
            self.cancelBtn.enabled = false
            self.suspendOrResumeBtn.enabled = false
            self.suspendOrResumeBtn.setTitle("Suspend", 
                forState: UIControlState.Normal)
        default:
            break
        }
    }
}

required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    if !self.episodesDirUrl.checkResourceIsReachableAndReturnError(nil) {
        try! NSFileManager.defaultManager()
            .createDirectoryAtURL(self.episodesDirUrl,
                            withIntermediateDirectories: true,
                            attributes: nil)
    }
}

@IBAction func beginDownload(sender: AnyObject) {
    print("Begin downloading...")
    
    let dest: Request.DownloadFileDestination = { temporaryURL, response in
        print(temporaryURL)
        
        let pathComponent = response.suggestedFilename
        let episodeUrl = 
            self.episodesDirUrl.URLByAppendingPathComponent(pathComponent!)
        
        if episodeUrl.checkResourceIsReachableAndReturnError(nil) {
            print("Clear the previous existing file.")
            
            let fm = NSFileManager.defaultManager()
            
            try! fm.removeItemAtURL(episodeUrl)
        }

        return episodeUrl
    }

    if let resUrl = self.downloadUrl.text {
        Alamofire.download(.GET, resUrl, destination: dest)
    }
    
    self.suspendOrResumeBtn.enabled = true;
    self.cancelBtn.enabled = true;
    self.currStatus = .Downloading
}

if let resUrl = self.downloadUrl.text {
  Alamofire.download(.GET, resUrl, destination: dest)
    .progress { 
      bytesRead, 
      totalBytesRead, 
      totalBytesExpectedToRead in
        dispatch_async(dispatch_get_main_queue()) {
          let progress = 
          Float(totalBytesRead) / Float(totalBytesExpectedToRead)
          self.downloadProgress.progress = progress
        }
    }
    .response { request, response, data, error in
       if let error = error {
         print("Download error: \(error.localizedDescription)")
       }
       else {
       }
    }
}

extension ViewController {
  private func displayNetworkAlert(errorMessage: String,
    data: NSData? = nil,
    destination: Request.DownloadFileDestination? = nil) {
      let alert = UIAlertController(
        title: "Network error",
        message: errorMessage,
        preferredStyle: .Alert)
        
      if let data = data {
        alert.addAction(UIAlertAction(title: "Resume",
            style: UIAlertActionStyle.Default,
            handler: { _ in
              print("Resume downloading...")
        }))
            
        alert.addAction(UIAlertAction(title: "Cancel",
            style: UIAlertActionStyle.Cancel,
            handler: { _ in
              print("Cancel downloading...")
        }))
      }
      else {
        alert.addAction(UIAlertAction(title: "OK",
          style: UIAlertActionStyle.Default,
          handler: { _ in
            print("Cancel downloading...")
          }))
      }
        
      self.presentViewController(alert, 
        animated: true, completion: nil)
    }
}

@IBAction func suspendOrResumeDownload(sender: AnyObject) {
    var btnTitle: String?
    
    switch self.currStatus {
    case .Downloading:
        print("Suspend downloading...")
        
        // TODO: Add suspending code here
        self.currStatus = .Suspended
        btnTitle = "Resume"
        
        self.request!.suspend()
    case .Suspended:
        print("Resume downloading...")
        
        // TODO: Add resuming code here
        self.currStatus = .Downloading
        btnTitle = "Suspend"
        
        self.request!.resume()
    case .NotStarted, .Cancelled:
        break
    }
    
    self.suspendOrResumeBtn.setTitle(btnTitle, 
        forState: UIControlState.Normal)
}

@IBAction func cancelDownload(sender: AnyObject) {
    print("Cancel downloading...")
    
    switch self.currStatus {
    case .Downloading, .Suspended:
        // TODO: Add cancel code here
        
        self.request?.cancel()

        self.currStatus = .Cancelled
        self.cancelBtn.enabled = false
        self.suspendOrResumeBtn.enabled = false
        self.suspendOrResumeBtn.setTitle("Suspend", 
            forState: UIControlState.Normal)
    default:
        break
    }
}

class ViewController: UIViewController {
    var episodeUrl: NSURL?

  @IBOutlet weak var uploadBtn: UIButton!
}

let dest: Request.DownloadFileDestination = {
  temporaryUrl, response in

    self.episodeUrl = episodeUrl
    return episodeUrl
}

extension ViewController {
  @IBAction func uploadFile(sender: AnyObject) {
        guard self.episodeUrl != nil else {
            print("Does not have any downloaded file.")
            return
        }
        print("Uploading \(self.episodeUrl!)")
    }
}

@IBAction func uploadFile(sender: AnyObject) {
    guard self.episodeUrl != nil else {
        print("Does not have any downloaded file.")
        return
    }
    
    print("Uploading \(self.episodeUrl!)")
    
    Alamofire.upload(
        .POST,
        "https://apidemo.boxue.io/alamofire",
        multipartFormData: { multipartFormData in
            multipartFormData.appendBodyPart(
              fileURL: self.episodeUrl!, 
              name: "episode-demo")
        },
        encodingCompletion: nil
    )
}

class AlamofireController extends Controller
{
    public function store(Request $request)
    {
        if ($request->hasFile("episode-demo")) {
            $request->file('episode-demo')
              ->move(public_path().'/assets/episodes', 
                'episode-demo.mp4');
        }

        return response()->json([
                'status' => 'successful',
                'data' => 'Episodes uploaded successfully'
            ], 201);
    }
}

if ($request->hasFile("episode-demo")) {
    $request->file('episode-demo')
      ->move(public_path().'/assets/episodes', 
        'episode-demo.mp4');
}

public enum MultipartFormDataEncodingResult {
    case Success(request: Request, streamingFromDisk: Bool, streamFileURL: NSURL?)
    case Failure(ErrorType)
}

Alamofire.upload(
    .POST,
    "https://apidemo.boxue.io/alamofire",
    multipartFormData: { multipartFormData in
        multipartFormData.appendBodyPart(
          fileURL: self.episodeUrl!, 
          name: "episode-demo")
    },
    encodingCompletion: { encodingResult in
        switch encodingResult {
        case .Success(let upload, _, _):
            upload
                .progress { 
                  bytesWritten, 
                  totalBytesWritten, 
                  totalBytesExpectedToWrite in
                    print(totalBytesWritten)
                    
                    // This closure is NOT called on the main queue for performance
                    // reasons. To update your ui, dispatch to the main queue.
                    dispatch_async(dispatch_get_main_queue()) {
                        // Calculate the download percentage
                        let progress = 
                          Float(totalBytesWritten) / 
                          Float(totalBytesExpectedToWrite)
                        
                        self.downloadProgress.progress = progress
                    }
                }
                .responseJSON { response in
                  debugPrint(response)
              }
        case .Failure(let encodingError):
            print(encodingError)
        }
    }
)
