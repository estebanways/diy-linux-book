#! /bin/sh

# Script to stabilize videos in two steps
# Author: Esteban Herrera
# The commands may vary, according to the editor objectives (For more options see Project notes.txt).
# "2>&1 | tee -a /path/to/logfile.log" This means: run command and redirect the stderr stream (2) to stdout (1). That will be passed
# to the pipe with the tee application. Use the -a option to append (>>) and show the output in the shell.

# Pending: 
# Create for cycle that says "working on clip: xxxyyy" or something. I can base this modification
# with this file: Stabilizing, transcoding and melt — what's the best way_ _ Kdenlive.pdf

EXIFTOOL="/usr/bin/exiftool"
MELT="/usr/bin/melt"
FFPROBE="/usr/bin/ffprobe"

# Use this command to massively write clip information to a log file:
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002968-c.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002968-b.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002968.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002964.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002964-b.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002839-b.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002839.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002860.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002861.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002865.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002901-b.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002901.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002907.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002911.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002914-b.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002914.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002917-b.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002917.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002919.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002924.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002925.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002929.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002932.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002937.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002942.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002943.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002948.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002949.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002950.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002954.mp4 2>&1 | tee -a logfile.log
$EXIFTOOL -s3 -rotation -imagewidth -imageheight -avgbitrate 1002958.mp4 2>&1 | tee -a logfile.log

# Pass 1. Stabilize videos image:
echo "Queue initialized... wait for the program to finish"
$MELT  1002968-c.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002968-c.mlt all=1 2>&1 | tee -a logfile.log
$MELT  1002968-b.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002968-b.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002968.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002968.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002964.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002964.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002964-b.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002964-b.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002839-b.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002839-b.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002839.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002839.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002860.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002860.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002861.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002861.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002865.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002865.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002901-b.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002901-b.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002901.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002901.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002907.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002907.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002911.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002911.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002914-b.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002914-b.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002914.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002914.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002917-b.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002917-b.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002917.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002917.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002919.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002919.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002924.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002924.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002925.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002925.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002929.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002929.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002932.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002932.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002937.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002937.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002942.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002942.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002943.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002943.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002948.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002948.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002949.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002949.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002950.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002950.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002954.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002954.mlt all=1 2>&1 | tee -a logfile.log
$MELT 1002958.mp4 -filter videostab2 shakiness=8 smoothing=20 -consumer xml:1002958.mlt all=1 2>&1 | tee -a logfile.log

# Pass 2. Encode the final videos:
# I set FPS in a profile as a parameter, but you can use profiles as properties, for example:
# f=mov mlt_profile=atsc_1080p_2997 vb=145M vcodec=dnxhd acodec=pcm_s16le ar=48000k ac=2.
# The command is:
$MELT -profile atsc_1080p_30 -verbose 1002968-c.mlt -audio-track 1002968-c.mp4 -consumer avformat:1002968-c-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002968-b.mlt -audio-track 1002968-b.mp4 -consumer avformat:1002968-b-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002968.mlt -audio-track 1002968.mp4 -consumer avformat:1002968-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002964.mlt -audio-track 1002964.mp4 -consumer avformat:1002964-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002964-b.mlt -audio-track 1002964-b.mp4 -consumer avformat:1002964-b-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002839-b.mlt -audio-track 1002839-b.mp4 -consumer avformat:1002839-b-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002839.mlt -audio-track 1002839.mp4 -consumer avformat:1002839-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002860.mlt -audio-track 1002860.mp4 -consumer avformat:1002860-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002861.mlt -audio-track 1002861.mp4 -consumer avformat:1002861-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002865.mlt -audio-track 1002865.mp4 -consumer avformat:1002865-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002901-b.mlt -audio-track 1002901-b.mp4 -consumer avformat:1002901-b-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002901.mlt -audio-track 1002901.mp4 -consumer avformat:1002901-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002907.mlt -audio-track 1002907.mp4 -consumer avformat:1002907-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002911.mlt -audio-track 1002911.mp4 -consumer avformat:1002911-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002914-b.mlt -audio-track 1002914-b.mp4 -consumer avformat:1002914-b-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002914.mlt -audio-track 1002914.mp4 -consumer avformat:1002914-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002917-b.mlt -audio-track 1002917-b.mp4 -consumer avformat:1002917-b-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002917.mlt -audio-track 1002917.mp4 -consumer avformat:1002917-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002919.mlt -audio-track 1002919.mp4 -consumer avformat:1002919-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002924.mlt -audio-track 1002924.mp4 -consumer avformat:1002924-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002925.mlt -audio-track 1002925.mp4 -consumer avformat:1002925-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002929.mlt -audio-track 1002929.mp4 -consumer avformat:1002929-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002932.mlt -audio-track 1002932.mp4 -consumer avformat:1002932-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002937.mlt -audio-track 1002937.mp4 -consumer avformat:1002937-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002942.mlt -audio-track 1002942.mp4 -consumer avformat:1002942-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002943.mlt -audio-track 1002943.mp4 -consumer avformat:1002943-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002948.mlt -audio-track 1002948.mp4 -consumer avformat:1002948-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002949.mlt -audio-track 1002949.mp4 -consumer avformat:1002949-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002950.mlt -audio-track 1002950.mp4 -consumer avformat:1002950-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002954.mlt -audio-track 1002954.mp4 -consumer avformat:1002954-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log
$MELT -profile atsc_1080p_30 -verbose 1002958.mlt -audio-track 1002958.mp4 -consumer avformat:1002958-stab.mp4 properties=lossless/H.264 progressive=1 threads=2 real_time=-1 s=1920x1080 2>&1 | tee -a logfile.log

# This is not a pass but vefiries that the files are ready to continue the edition.
$FFPROBE 1002839-b.mp4
$FFPROBE 1002839.mp4
$FFPROBE 1002860.mp4
$FFPROBE 1002861.mp4
$FFPROBE 1002865.mp4
$FFPROBE 1002901-b.mp4
$FFPROBE 1002901.mp4 
$FFPROBE 1002907.mp4   
$FFPROBE 1002911.mp4 
$FFPROBE 1002914-b.mp4  
$FFPROBE 1002914.mp4   
$FFPROBE 1002917-b.mp4  
$FFPROBE 1002917.mp4  
$FFPROBE 1002919.mp4  
$FFPROBE 1002924.mp4  
$FFPROBE 1002925.mp4  
$FFPROBE 1002929.mp4  
$FFPROBE 1002932.mp4  
$FFPROBE 1002937.mp4  
$FFPROBE 1002942.mp4 
$FFPROBE 1002943.mp4 
$FFPROBE 1002948.mp4  
$FFPROBE 1002949.mp4  
$FFPROBE 1002950.mp4 
$FFPROBE 1002954.mp4  
$FFPROBE 1002958.mp4
$FFPROBE 1002964-b.mp4
$FFPROBE 1002964.mp4
$FFPROBE 1002968-b.mp4
$FFPROBE 1002968.mp4
echo "Ready for the next step..."
exit 1


