# Eyewear particles script - analysis

# load patternize
library(patternize)

# List with samples -- reduced list for testing
IDlist <- c('LabA3',
            'LabB3',
            'ReadingA2',
            'ReadingB3')

# landmark list
prepath <- 'landmarks'
extension <- '_landmarks.txt'
landmarkList <- makeList(IDlist, 'landmark', prepath, extension)

# image list
prepath <- 'images/Edit1_Enhanced'
extension <- '.png'
imageList <- makeList(IDlist, 'image', prepath, extension)

## Everything above here works fine I think
## I think the landmarks I made in imageJ are also correct? 

# align color patterns
RGB <- c(207, 90, 0) # paint color -- possible issue here?

## issue with sampleRGB(), doesn't work, gives error message, color intensity too high, any ideas?
# image <- raster::stack("C:/Users/steve/Documents/eyewearanalysis/images/Edit1_Enhanced/LabA3.png")
# RGB <- sampleRGB(image, resampleFactor = 1)

###########
# MAJOR ISSUE
# Returns blank, nothing
###########
target <- imageList['LabA3'] # doesn't work, returns error message
rasterList_lanRGB <- patLanRGB(imageList, landmarkList, RGB, transformRef = 'LabA3', resampleFactor = 1, 
                               colOffset = 0.01, crop = TRUE, res = 300, adjustCoords = TRUE, plot = 'stack')
# possibly extraction is too narrow, not enough color variation? 
# Any ideas on solution would be appreciated