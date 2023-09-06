guard let sceneView = self.view as? ARSKView else {
    return
}
var translation = matrix_identity_float4x4
translation.columns.3.z = -0.2
let transform = simd_mul(currentFrame.camera.transform, translation)

let anchor = ARAnchor(transform: transform)
sceneView.session.add(anchor: anchor)

func view(_ view: ARSKView,
    nodeFor anchor: ARAnchor) -> SKNode? {

    let labelNode = SKLabelNode(text: "👿")
    labelNode.horizontalAlignmentMode = .center
    labelNode.verticalAlignmentMode = .center

    return labelNode;
}
let configuration = ARWorldTrackingSessionConfiguration()

class Scene: SKScene {
    let remainingDoraNode = SKLabelNode()

    var doraCreated = 0
    var doraRemains = 0 {
        didSet {
            remainingDoraNode.text =
                "\(doraRemains) Doras left in your room"
        }
    }
}

remainingDoraNode.fontSize = 25
remainingDoraNode.fontName = "BradleyHandITCTT-Bold"
remainingDoraNode.color = .white
remainingDoraNode.position =
    CGPoint(x: 0, y: view.frame.midY - 50)

addChild(remainingDoraNode)

doraRemains = 0

if let dora = hittedDora.first {
    // 1. Fadeout Doraemon
    let scaleOut = SKAction.scale(by: 2, duration: 0.2)
    let fadeOut = SKAction.fadeOut(withDuration: 0.2)
    let group = SKAction.group([scaleOut, fadeOut])
    let sequence = SKAction.sequence([group, SKAction.removeFromParent()])

    dora.run(sequence)

    doraRemains -= 1
}

from sklearn.linear_model import LinearRegression
import pandas as pd
import coremltools
class CBWD:
    NONE = 1
    NW = 2
    SW = 3
    NE = 4
    SE = 5

def wd_converter(direction):
    if direction == "NW":
        return CBWD.NW
    elif direction == "SW":
        return CBWD.SW
    elif direction == "NE":
        return CBWD.NE
    elif direction == "SE":
        return CBWD.SE
    else:
        return CBWD.NONE

records = pd.read_csv("pm_data.csv")

for row in range(records.shape[0]):
    wd = wd_converter(records['cbwd'][row])
    records.set_value(row, 'cbwd', wd)

model = LinearRegression()
model.fit(records[["year", "month", "day",
    "hour", "DEWP", "TEMP", "cbwd", "Iws",
    "Is", "Ir"]], records["pm2.5"])
coreml_model = coremltools.converters.sklearn.convert(
    model, ["year", "month", "day", "hour",
    "DEWP", "TEMP", "cbwd", "Iws", "Is",
    "Ir"], "pm2.5")

coreml_model.author = "Mars"
coreml_model.license = "BSD"
coreml_model.short_description = "Predict the air condition of Beijing."

coreml_model.save("pm_data.mlmodel")

m =  coremltools.models.MLModel('pm_data.mlmodel')

predictions = m.predict({
    'year': 2017, 'month': 1, 'day': 1, 'hour': 10,
    "DEWP": -10, "TEMP": 7, "PRES": 1000,
    "cbwd": CBWD.NW,
    "Iws": 1.79, "Is": 0, "Ir": 0
    })
print(predictions)

extension ViewController {
    enum PhotoSource {
        case camera, photoLibrary
    }

    func takePhoto(from source: PhotoSource) {
        let imagePicker = UIImagePickerController()

        imagePicker.sourceType = (source == .camera ? .camera : .photoLibrary)
        imagePicker.delegate = self
        imagePicker.allowsEditing = true

        present(imagePicker, animated: true, completion: nil)
    }
}

extension ViewController {
    func resize(image: UIImage, to newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)

        let size = CGRect(x: 0, y: 0,
            width: newSize.width, height: newSize.height)
        image.draw(in: size)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return newImage
    }
}

@IBAction func grabAPicture(_ sender: Any) {
    let actionSheet = UIAlertController(title: nil,
        message: nil, preferredStyle: .actionSheet)

    let cameraAction = UIAlertAction(title: "Take a photo",
        style: .default, handler: {
            _ in
            self.takePhoto(from: .camera)
        })
    let libraryAction = UIAlertAction(title: "Choose from Photos",
        style: .default, handler: {
            _ in
            self.takePhoto(from: .photoLibrary)
        })
    let cancelAction = UIAlertAction(title: "Cancel",
        style: .cancel, handler: nil)

    actionSheet.addAction(cameraAction)
    actionSheet.addAction(libraryAction)
    actionSheet.addAction(cancelAction)

    present(actionSheet, animated: true, completion: nil)
}

class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var photoSelected: UIImageView!
    @IBOutlet weak var probability: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    /// ...
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(
        _ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)

        if let image =
            info[UIImagePickerControllerEditedImage] as? UIImage {
            photoSelected.image = image
            let fixSize = CGSize(width: 224, height: 224)

            if let newImage = resize(image: image, to: fixSize) {
                guess(image: newImage)
            }
        }
    }
}

let request = VNCoreMLRequest(model: model) {
    (request, error) in
    guard let results = request.results as? [VNClassificationObservation],
        let firstResult = results.first else {
        fatalError("Cannot fetch result from VNCoreMLRequest...")
    }

    DispatchQueue.main.async {
        self.descriptionLabel.text = firstResult.identifier
        self.probability.text = "\(firstResult.confidence * 100)"
    }
}

let handler = VNImageRequestHandler(ciImage: ciImage)
DispatchQueue.global(qos: .userInteractive).async {
    try? handler.perform([request])
}

class FontsViewController: UITableViewController {
    let fontNames = UIFont.familyNames.sorted()
    /// ...
}

class FontsViewController: UITableViewController {
    /// ...

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return fontNames.count
    }

    override func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "FontStyleCell", for: indexPath)

        let fontName = fontNames[indexPath.row]
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: 18)

        return cell
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var colorSelector: UICollectionView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var previewCollection: UICollectionView!

}

class ViewController: UIViewController {
    /// ...
    var colors = [UIColor]()

    func generateWebSafeColors() {
        let colorIndex: [CGFloat] =
            [0, 51/255, 102/255, 153/255, 204/255, 1]

        for i in colorIndex {
            for j in colorIndex {
                for k in colorIndex {
                    colors.append(
                        UIColor(red: i, green: j, blue: k, alpha: 1))
                }
            }
        }
    }
}

override func viewDidLoad() {
    super.viewDidLoad()
    generateWebSafeColors()
}

extension ViewController:
    UICollectionViewDataSource,
    UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ColorCell", for: indexPath)

        cell.backgroundColor = colors[indexPath.row]
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 6

        return cell
    }
}

class ViewController: UIViewController {
    /// ...
    var titleText = "Click here to set your title"
    var titleFontName = "Helvetica Neue"
    var titleColor = UIColor.white

    /// ...
}

func drawPoster() {
    let drawRect = CGRect(
        x: 0, y: 0, width: 1600, height: 1200)
    let titleRect = CGRect(
        x: 200, y: 200, width: 1200, height: 200)
    let titleFont = UIFont(name: titleFontName, size: 90)
        ?? UIFont.systemFont(ofSize: 90)

    let centered = NSMutableParagraphStyle()
    centered.alignment = .center

    let titleAttributes: [NSAttributedStringKey: Any] = [
        .foregroundColor: titleColor,
        .font: titleFont,
        .paragraphStyle: centered
    ]

    let renderer =
        UIGraphicsImageRenderer(size: drawRect.size)

    poster.image = renderer.image {
        UIColor.gray.set()
        $0.fill(drawRect)

        // render bg image
        posterBg?.draw(at: CGPoint(x: 0, y: 0))

        // render title
        titleText.draw(in: titleRect, withAttributes: titleAttributes)
    }
}

class PreviewCell: UICollectionViewCell {
    @IBOutlet weak var preview: UIImageView!
}

func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        if collectionView == colorSelector {
            return colors.count
        }
        else {
            let previewFrame = CGRect(
                    x: 0, y: 0,
                    width: collectionView.bounds.size.width,
                    height: collectionView.bounds.size.height)
            let promptLabel = UILabel(frame: previewFrame)

            promptLabel.text = "Drag your poster here"
            promptLabel.textColor = UIColor.gray
            promptLabel.textAlignment = .center

            collectionView.backgroundView  = promptLabel

            return 0
        }

    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == colorSelector {
            /// ...
        }
        else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "PreviewStyle",
                for: indexPath) as! PreviewCell

            return cell
        }
    }

extension ViewController: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView,
        itemsForBeginning session: UIDragSession,
        at indexPath: IndexPath) -> [UIDragItem] {

        let color = colors[indexPath.item]
        let provider = NSItemProvider(object: color)
        let item = UIDragItem(itemProvider: provider)

        return [item]
    }
}

extension ViewController: UIDropInteractionDelegate {
    func dropInteraction(_ interaction: UIDropInteraction,
        sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
}

override func viewDidLoad() {
    /// ...

    poster.isUserInteractionEnabled = true
    let dropInteraction = UIDropInteraction(delegate: self)
    poster.addInteraction(dropInteraction)
}

func dropInteraction(_ interaction: UIDropInteraction,
                    performDrop session: UIDropSession) {
    let location = session.location(in: poster)
}

func dropInteraction(_ interaction: UIDropInteraction,
                    performDrop session: UIDropSession) {
    let location = session.location(in: poster)

    session.loadObjects(ofClass: UIColor.self, completion: {
        guard let color = $0.first as? UIColor else { return }

        if location.y < self.poster.bounds.midY {
            self.titleColor = color
            self.drawPoster()
        }
    })
}

extension FontStylesViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView,
                   itemsForBeginning session: UIDragSession,
                   at indexPath: IndexPath) -> [UIDragItem] {

        let string = fontNames[indexPath.row]
        guard let data = string.data(using: .utf8) else {
            return []
        }
    }
}

import MobileCoreServices

extension FontsViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView,
        itemsForBeginning session: UIDragSession,
        at indexPath: IndexPath) -> [UIDragItem] {

        let string = fonts[indexPath.row]
        guard let data = string.data(using: .utf8) else {
            return []
        }

        let itemProvider = NSItemProvider(
            item: data as NSData,
            typeIdentifier: kUTTypePlainText as String)
    }
}

extension FontsViewController: UITableViewDragDelegate {
    func tableView(_ tableView: UITableView,
        itemsForBeginning session: UIDragSession,
        at indexPath: IndexPath) -> [UIDragItem] {

        let string = fonts[indexPath.row]
        guard let data = string.data(using: .utf8) else {
            return []
        }

        let itemProvider = NSItemProvider(
            item: data as NSData,
            typeIdentifier: kUTTypePlainText as String)

        return [UIDragItem(itemProvider: itemProvider)]
    }
}

override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dragDelegate = self
}

func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
    let location = session.location(in: poster)

    if session.hasItemsConforming(
        toTypeIdentifiers: [kUTTypePlainText as String]) {
        session.loadObjects(ofClass: NSString.self, completion: {
            guard let fontName = $0.first as? NSString else { return }

            if location.y < self.poster.bounds.midY {
                self.titleFontName = fontName as String
                self.drawPoster()
            }
        })
    }
    else {
        session.loadObjects(ofClass: UIColor.self, completion: {
            guard let color = $0.first as? UIColor else { return }

            if location.y < self.poster.bounds.midY {
                self.titleColor = color
                self.drawPoster()
            }
        })
    }
}

func dropInteraction(_ interaction: UIDropInteraction,
                         performDrop session: UIDropSession) {
    let location = session.location(in: poster)

    if session.hasItemsConforming(
        /// Load fonts
    }
    else if session.hasItemsConforming(
        toTypeIdentifiers: [kUTTypeImage as String]) {
        session.loadObjects(ofClass: UIImage.self,
            completion: {
            guard let draggedImage = $0.first as? UIImage else {
                return
            }

            self.posterBg = draggedImage
            self.drawPoster()
        })
    }
    else {
        /// Load colors
    }
}

extension ViewController: UIDragInteractionDelegate {
    func dragInteraction(_ interaction: UIDragInteraction,
        itemsForBeginning session: UIDragSession) -> [UIDragItem] {
        guard let image = poster.image else { return [] }

        let provider = NSItemProvider(object: image)
        let item = UIDragItem(itemProvider: provider)

        return [item]
    }
}

override func viewDidLoad() {

    let dragInteraction = UIDragInteraction(delegate: self)
    poster.addInteraction(dragInteraction)
}

class ViewController: UIViewController {
    var posterPreviews = [UIImage]()
}

override func viewDidLoad() {
    previewCollection.dropDelegate = self
}

extension ViewController: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView,
        performDropWith coordinator: UICollectionViewDropCoordinator) {
        if collectionView == previewCollection {
            coordinator.session.loadObjects(ofClass: UIImage.self, completion: {
                guard let draggedImage = $0.first as? UIImage else { return }

                self.posterPreviews.append(draggedImage)
                self.previewCollection.reloadData()
            })
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        // return count here
        if collectionView == colorSelector {
            return colors.count
        }
        else {
            if posterPreviews.isEmpty {
                /// Previous prompt code
            }
            else {
                return posterPreviews.count
            }
        }

    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == colorSelector {
            /// Previous color cell creation
        }
        else {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "PreviewCell", for: indexPath) as! PreviewCell
            cell.preview.image = posterPreviews[indexPath.row]
            return cell
        }

    }
}

