#!/usr/bin/env Rscript

##------------------------------------------------------------------------------
## CREATE FILENAME
##------------------------------------------------------------------------------

## current time in format that doesn't break anything:
curtime <- format(Sys.time(), "%Y-%m-%d_%H:%M:%S")

## file name based on current time:
fname <- sprintf("~/rpi_camera_uploader/photos/garage_%s.jpg", curtime)

##------------------------------------------------------------------------------
## TAKE PICTURE
##------------------------------------------------------------------------------

## Create command to take picture, then take picture
cmd1 <- paste0("raspistill ",
               "-rot 90 ",    ## rotate 0/90/180/270 degrees
               "-o ",  fname) ## output to filename
system(cmd1)

##------------------------------------------------------------------------------
## UPLOAD TO DROPBOX
## Dropbox API source: https://pimylifeup.com/raspberry-pi-dropbox/
##------------------------------------------------------------------------------
cmd2 <- sprintf("~/Dropbox-Uploader/dropbox_uploader.sh upload %s /Photos",
                fname)
system(cmd2)

