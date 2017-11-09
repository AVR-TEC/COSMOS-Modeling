# Useful Commands to Manage Video and Images
Some commands that can be usefull to convert video and images for exhibition or post-processing

## Extract Frames from a Video
```
ffmpeg -i Video.mp4 Pictures%d.jpg
```
## Generate Video from frames
```
ffmpeg -framerate 25 -i Pictures%d.jpg -c:v libx264 Video.mp4
```
## Converto to Images to .gif
```
convert -delay 20 -loop 0 *.jpg GIF.gif
```
## Rename files with Incremental numbering
Iterative method to rename all files to in a folder with incremental numbering

```
ls | cat -n | while read n f; do mv "$f" "$n.extension"; done
```



