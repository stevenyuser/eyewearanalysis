# Eyewear particles script - analysis

# load patternize
library(patternize)

# List with samples
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

# align color patterns
RGB <- c(207, 90, 0) # red color

###########
# WHERE ISSUE ARISES
# Returns blank, nothing
###########
target <- imageList['LabA3']
rasterList_lanRGB <- patLanRGB(imageList, landmarkList, RGB, transformRef = target, resampleFactor = 1, 
                               colOffset = 0.01, crop = TRUE, res = 300, adjustCoords = TRUE, plot = 'stack')


