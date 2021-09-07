# load patternize
library(patternize)

# List with samples -- reduced list for testing
IDlist <- c('LabA3',
            'LabB3',
            'ReadingA2',
            'ReadingB3')

# landmark list
prepath <- 'landmarks/landmarks_jpg'
extension <- '_landmarks.txt'
landmarkList <- makeList(IDlist, 'landmark', prepath, extension)

# image list
prepath <- 'images/Edit1_Enhanced'
extension <- '.jpg'
imageList <- makeList(IDlist, 'image', prepath, extension)
 
# align color patterns
RGB <- c(208, 99, 0)

rasterList_lanRGB <- patLanRGB(imageList, landmarkList, RGB, transformRef = 'LabA3', resampleFactor = 1, 
                               colOffset = 0.01, crop = TRUE, res = 300, adjustCoords = TRUE, plot = 'stack')

# sum color patterns
summedRaster <- sumRaster(rasterList_lanRGB, IDlist, 'RGB')

outline <- read.table('cartoon/LabA3_outline.txt', header = F)
lines <- list.files(path = 'cartoon', pattern = 'LabA3_vein', full.names = T)

colfunc <- c("black","lightblue","blue","green", "yellow","red")
plotHeat(summedRaster = summedRaster, IDlist, plotCartoon = T, refShape = 'target', outline, lines, landmarkList, 
         cartoonID = 'LabA3', cartoonFill = T, cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster, IDlist, plotCartoon = F, refShape = 'target', outline = outline, 
          lines = lines, landList = landmarkList, 
          imageList = imageList, cartoonID = 'LabA3', cartoonFill = 'red', cartoonOrder = 'under', 
          colpalette = colfunc)

area <- patArea(rasterList_lanRGB, IDlist, refShape = 'target', type = 'RGB', outline = outline, imageList = 
                  imageList, cartoonID = 'LabA3')