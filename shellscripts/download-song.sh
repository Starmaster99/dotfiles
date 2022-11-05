#!/usr/bin/env bash

# prerequisites: you installed yt-dlp and ffmpeg (arch)

# this handy shell script will extract audio from youtube videos using youtube-dl python script
# you can change `--output` directory to whatever you like
# usage example:
# ./download-song.sh https://www.youtube.com/watch?v=dQw4w9WgXcQ 

yt-dlp -x -f bestaudio --audio-format mp3 --prefer-ffmpeg --metadata-from-title "%(artist)s - %(title)s" \ 
 --embed-thumbnail --output '~/Downloads/songs/%(artist)s - %(title)s.%(ext)s' --add-metadata -i $1
