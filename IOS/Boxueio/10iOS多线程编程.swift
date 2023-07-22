// Create a serial queue
let serialQueue1 = dispatch_queue_create("com.boxueio.images", DISPATCH_QUEUE_SERIAL)

dispatch_async(serialQueue1, {
    let img1 = 
        Downloader.downloadImageWithURL(self.imageUrls[0])
    dispatch_async(dispatch_get_main_queue(), {
        self.image1.image = img1
        self.image1.clipsToBounds = true
    })

    // ...
})

// Add task
let serialQueue1 = 
    dispatch_queue_create("com.boxueio.images", 
    DISPATCH_QUEUE_SERIAL)
dispatch_async(serialQueue1, {
    let img1 = 
        Downloader.downloadImageWithURL(self.imageUrls[0])

    dispatch_async(dispatch_get_main_queue(), {
        self.image1.image = img1
        self.image1.clipsToBounds = true
    })
    // ...
})

let serialQueue2 = 
    dispatch_queue_create("com.boxueio.images1", 
    DISPATCH_QUEUE_SERIAL)
dispatch_async(serialQueue2, {
    let img2 = 
        Downloader.downloadImageWithURL(self.imageUrls[1])
    dispatch_async(dispatch_get_main_queue(), {
        self.image2.image = img2
        self.image2.clipsToBounds = true
    })
    // ...
})

var currQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

dispatch_async(currQueue, {
    let img1 = Downloader.downloadImageWithURL(self.imageUrls[0])
    dispatch_async(dispatch_get_main_queue(), {
        self.image1.image = img1
        self.image1.clipsToBounds = true
    })
})

dispatch_async(currQueue, {
    let img2 = Downloader.downloadImageWithURL(self.imageUrls[1])
    dispatch_async(dispatch_get_main_queue(), {
        self.image2.image = img2
        self.image2.clipsToBounds = true
    })
})

dispatch_async(currQueue, {
    let img3 = Downloader.downloadImageWithURL(self.imageUrls[2])
    dispatch_async(dispatch_get_main_queue(), {
        self.image3.image = img3
        self.image3.clipsToBounds = true
    })
})

dispatch_async(currQueue, {
    let img4 = Downloader.downloadImageWithURL(self.imageUrls[3])
    dispatch_async(dispatch_get_main_queue(), {
        self.image4.image = img4
        self.image4.clipsToBounds = true
    })
})

let currQueue = dispatch_queue_create("com.boxueio.images", DISPATCH_QUEUE_CONCURRENT)

class ViewController: UIViewController {
    @IBAction func downloadImages(sender: UIButton) {
        var queue = NSOperationQueue()

        //  Create a NSBlockOperation object
        let op2 = NSBlockOperation(block: {
            let img2 = Downloader.downloadImageWithURL(self.imageUrls[1])
            
            NSOperationQueue.mainQueue().addOperationWithBlock({
                self.image2.image = img2
                self.image2.clipsToBounds = true
            })
        })
        
        //  Set finish callback
        op2.completionBlock = { print("image2 downloaded") }

        // Add to operation queue manually
        queue.addOperation(op2)
    }
    // ...
}