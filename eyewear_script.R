# Eyewear particles script - analysis

## General Comments
# I think I have set up the landmarks correctly
# For the comments, I basically did an outline of the shape around the eye and nose area.
# I used FIJI for it
#
# I am using the images in Edit1_Enhanced, where I turned up the hue/saturation of the images to \
# differentiate a bit more
#
# For selecting the RGB value, I used a color picker in Photoshop to select a color, since selectRGB() doesn't work
# I suspect that that the RGB value is causing the program to not work, since there is not enough variation between
# the subject and the paint. I can't seem to solve it.
#
# I have included the code output from the console in output.txt
# Thanks
## 

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
RGB <- c(211, 111, 0) # paint color -- possible issue here?

## issue with sampleRGB(), doesn't work, gives error message, color intensity too high, any ideas?
# image <- raster::stack("C:/Users/steve/Documents/eyewearanalysis/images/Edit1_Enhanced/LabA3.png")
# RGB <- sampleRGB(image, resampleFactor = 1)

###########
# MAJOR ISSUE
# Returns blank, nothing
# Have tried many colOffset values, not sure why it doesn't work
###########
target <- imageList['LabA3'] # doesn't work, returns error message
rasterList_lanRGB <- patLanRGB(imageList, landmarkList, RGB, transformRef = 'LabA3', resampleFactor = 1, 
                               colOffset = 0.01, crop = TRUE, res = 300, adjustCoords = TRUE, plot = 'stack')
# possibly extraction is too narrow, not enough color variation? 
# Any ideas on solution would be appreciated