#----------------------------------------------------------- 
# Script to batch extract audio from mp4 files with ffmpeg:
#-----------------------------------------------------------
# Author: Esteban Herrera

# STATUS: Modifiable 
#
# Notes:
#
# Reference commands:
# ls *.mp4
# 
# for i in *.jpg; do echo "Processing $i"; exiftool -geotag= "$i"; done
# ffmpeg -i video.mp4 -b:a 192K -vn music.mp3
# for vid in *.mp4; do avconv -i "$vid" "${vid%.mp4}.mp3"; done
#
# WARNING: If the process doesn't work verify if the file has any protection, as is possible with youtube.com mp4 files.

# Cycle command version:
#
#for vid in *.mp4; do ffmpeg -i "$vid" -b:a 320K -vn "${vid%.mp4}.mp3"; done
#
# Short two command version:
#
#ffmpeg -i "origin.mp4" -b:a 320K -vn "destiny.mp3" ; ffmpeg -i "origin2.mp4" -b:a 320K -vn "destiny2.mp3"
#
# Long many commands version:
#
#ffmpeg -i "Anthony Pappa - Resolution CD1.mp4" -b:a 320K -vn "Anthony Pappa - Resolution CD1.mp3" ; ffmpeg -i "Anthony Pappa - Resolution CD2.mp4" -b:a 320K -vn "Anthony Pappa - Resolution CD2.mp3" ; ffmpeg -i "Aphex Twin - Selected Ambient Works 85-92.mp4" -b:a 320K -vn "Aphex Twin - Selected Ambient Works 85-92.mp3" ; ffmpeg -i "Armin van Buuren live at Ultra Music Festival Miami 2017 (A State Of Trance Stage).mp4" -b:a 320K -vn "Armin van Buuren live at Ultra Music Festival Miami 2017 (A State Of Trance Stage).mp3" ; ffmpeg -i "Dave Ralph - Tranceport II (CD1 - Departures) [1999].mp4" -b:a 320K -vn "Dave Ralph - Tranceport II (CD1 - Departures) [1999].mp3" ; ffmpeg -i "Dave Ralph - Tranceport II (CD2 - Arrivals) [1999].mp4" -b:a 320K -vn "Dave Ralph - Tranceport II (CD2 - Arrivals) [1999].mp3" ; ffmpeg -i "Enigma - playlist "THE SINGLES 1990 • 2017".mp4" -b:a 320K -vn "Enigma - playlist "THE SINGLES 1990 • 2017".mp3" ; ffmpeg -i "John Digweed - GU 019 Los Angeles CD1.mp4" -b:a 320K -vn "John Digweed - GU 019 Los Angeles CD1.mp3" ; ffmpeg -i "Oldschool Remember Techno-Trance Classics Vinyl Mix 1995-1999.mp4" -b:a 320K -vn "Oldschool Remember Techno-Trance Classics Vinyl Mix 1995-1999.mp3" ; ffmpeg -i "Paul Oakenfold - Tranceport (full album).mp4" -b:a 320K -vn "Paul Oakenfold - Tranceport (full album).mp3" ; ffmpeg -i "Sandra Collins - Transport 3.mp4" -b:a 320K -vn "Sandra Collins - Transport 3.mp3" ; ffmpeg -i "Sasha -- Global Underground 013- Ibiza (CD1).mp4" -b:a 320K -vn "Sasha -- Global Underground 013- Ibiza (CD1).mp3" ; ffmpeg -i "Satoshi Tomiie – Global Underground - Nubreed 006 CD1.mp4" -b:a 320K -vn "Satoshi Tomiie – Global Underground - Nubreed 006 CD1.mp3" ; ffmpeg -i "Special Amazing Mix 2018 - Best Of Deep House Sessions Music 2018 Chill Out Mix By Drop G.mp4" -b:a 320K -vn "Special Amazing Mix 2018 - Best Of Deep House Sessions Music 2018 Chill Out Mix By Drop G.mp3" ; ffmpeg -i "Sun Project - Guitar Trax 1996-2001 (S.U.N. Project Records) [Full Album].mp4" -b:a 320K -vn "Sun Project - Guitar Trax 1996-2001 (S.U.N. Project Records) [Full Album].mp3" ; ffmpeg -i "Sun Project - Wicked (S.U.N. Project Records) [Full Album].mp4" -b:a 320K -vn "Sun Project - Wicked (S.U.N. Project Records) [Full Album].mp3" ; ffmpeg -i "The Best of Paul van Dyk (1994 - 2017 Mix).mp4" -b:a 320K -vn "The Best of Paul van Dyk (1994 - 2017 Mix).mp3" ; ffmpeg -i "The Best Of Tiësto (DJ Mix By Jean Dip Zers).mp4" -b:a 320K -vn "The Best Of Tiësto (DJ Mix By Jean Dip Zers).mp3" ; ffmpeg -i "Tiesto's Top 30 Trance Classics (2.5hour MegaMix).mp4" -b:a 320K -vn "Tiesto's Top 30 Trance Classics (2.5hour MegaMix).mp3" ; ffmpeg -i "[Trance] Best of Female Vocal Trance (March 2016).mp4" -b:a 320K -vn "[Trance] Best of Female Vocal Trance (March 2016).mp3" ; ffmpeg -i "Vangelis - The Most 30 Beautiful Songs - Compilation  - Vangelis Playlist Full Album 2017.mp4" -b:a 320K -vn "Vangelis - The Most 30 Beautiful Songs - Compilation  - Vangelis Playlist Full Album 2017.mp3" ; ffmpeg -i "Vangelis the most 30 beautiful songs compilation YouTube.mp4" -b:a 320K -vn "Vangelis the most 30 beautiful songs compilation YouTube.mp3"



