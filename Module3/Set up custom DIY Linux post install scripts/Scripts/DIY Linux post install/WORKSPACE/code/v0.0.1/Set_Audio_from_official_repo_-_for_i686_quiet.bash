#!/bin/bash
# DIY Linux post install - Installs and sets up sets of applications to 
# improve a custom GNU/Linux
# Copyright (C) 2017  Esteban Herrera.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#
# WARNING: Before running this file, verify proper: Internet connection, sources in /etc/apt/ and /etc/apt/sources.list,
# command apt-get update has been run, operating system and version (Debian GNU/Linux 9 or later) and architecture (32bit)

# File name: Set_Audio_from_official_repo_-_for_i686.bash
# Description: Updates system from sources, installs, sets up, removes unnecessary dependency packages.
# Version: 0.1.0. Date: Friday, June 30, 2017
# Development: Esteban Herrera. E-mail: stv.herrera@gmail.com. Web site: http://liquidsmok.hopto.org

# DEBUGGING: 
#
# Use next commands to update the content of this file:
# To create every application list:
# $ sudo nano /etc/apt/sources.list
# $ sudo $UPDATE
# $ apt-cache search APPNAME APPNAME2
# $ apt-cache search APPNAME APPNAME2>APPNAME\ APPNAME2.txt
# If you want to create every App and Plugin txt content: 
# $ cd DIY...../
# $ *.txt > INSTALL-CONTENT.txt
#
# You can replace "$APPS install" with "$APPS install --assume-yes", as stated in the man page:
# $ man apt-get:
# -y, --yes, --assume-yes:
# Automatic yes to prompts; assume "yes" as answer to all prompts and run
# non-interactively. If an undesirable situation, such as changing a held package, trying
# to install a unauthenticated package or removing an essential package occurs then
# apt-get will abort. Configuration Item: APT::Get::Assume-Yes.
# Problem: We don't set up certain apps with interactive configuration screens showing up
# during installation, EG: Jack server in real time or Wireshark.
# Alternative:
# First fetch the DEB packages and install using dpkg, as follows:
# apt-get install -d or $APPS install -d
# cd /var/cache/apt/archives
# dpkg -i * 
# Problem: If you don't list the exact list will re-install or re-configure all the
# packages in the cache directory.
# 
# $ where is apt-get
#
# Running a shell script with -x option enables the display of commands
# and its arguments when they are executed. EG: # sh -x script.sh
#
# "2>&1 | tee -a /path/to/logfile.log": This means run command and redirect 
# the stderr stream (2) to stdout (1). That will be passed to the pipe with
# the tee application. Use the -a option to append (>>) and show the output in the shell.
#
# Check code 0 when the program finishes:
# Exit codes are useful to programs that call your program. If your program
# finishes with exit code 0 then that generally means your program "succeeded".
# An exit code of 1 generally means that it failed. Maybe the program tried to
# open a file that didn't exist or something. This would tell the calling program
# that it might not want to continue.

UPDATE="/usr/bin/apt-get"
APPS="/usr/bin/apt-get"

FILE=Set_Audio_from_official_repo_-_for_i686.bash

DATE=$(date)
TIME="TIMESTAMP:"
COLON=":"
TOTDATE=$TIME+$DATE+$COLON

function log_error {
        rc=$?; if [[ $rc != 0 ]]; then "--- SOMETHING WENT WRONG IN ACTION: $ACTION. RERUN OPTION TO COMPLETE ---. ERROR MESSAGE" exit $rc; fi 2>&1 | tee -a logfile.log
}

#
# Program start warning 
#
echo "$FILE initialized... wait for the program to finish or press CTRL + C" 2>&1 | tee -a logfile.log

#
# Update the system repository sources in /etc/apt/sources and /etc/apt/sources.list
#
echo $TOTDATE
ACTION="System sources updating"
echo "Action: "$ACTION": " 2>&1 | tee -a logfile.log
$UPDATE update 2>&1 | tee -a logfile.log
log_error;

#
# Subsets of applications and Plugins from A to Z
# Section of the sources set up in file /etc/apt/sources.list: main
#

#
# a2j
#
# a2jmidid - Daemon for exposing legacy ALSA MIDI in JACK MIDI systems
# laditools - Linux Audio Desktop Integration Tools
# python-laditools - Python module to control and monitor the LADI system
# zita-ajbridge - alsa to jack bridge
echo $TOTDATE
ACTION="a2j"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install a2jmidid laditools python-laditools zita-ajbridge 2>&1 | tee -a logfile.log
log_error;

#
# add64
#
# Unavailable
echo $TOTDATE
ACTION="add64"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

# 
# alsamixer
#
# alsa-utils - Utilities for configuring and using ALSA
# libasound2-plugin-equal - equalizer plugin for ALSA
# alsamixergui - graphical soundcard mixer for ALSA soundcard driver
# cairo-dock-alsamixer-plug-in - Alsamixer plug-in for Cairo-dock
# gmerlin - multiformat media player
# gnome-alsamixer - ALSA sound mixer for GNOME
# mopidy-alsamixer - Mopidy extension for extension for ALSA volume control
# mudita24 - ALSA GUI control tool for Envy24 (ice1712) soundcards
# qasconfig - ALSA configuration browser
# qashctl - mixer for ALSA's High level Control Interface
# qasmixer - ALSA mixer for the desktop
# qastools-common - QasTools common files
echo $TOTDATE
ACTION="alsamixer"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install alsa-utils libasound2-plugin-equal alsamixergui cairo-dock-alsamixer-plug-in gmerlin gnome-alsamixer mopidy-alsamixer mudita24 qasconfig qashctl qasmixer qastools-common 2>&1 | tee -a logfile.log
log_error;

#
# alsa modular synth
#
# ams - Realtime modular synthesizer for ALSA
# blepvco - LADSPA, minBLEP-based, hard-sync-capable oscillator plugins
# fomp - collection of LV2 audio plugins
# mcp-plugins - LADSPA plugins designed for Alsa Modular Synth
echo $TOTDATE
ACTION="alsa modular synth" 
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install ams blepvco fomp mcp-plugins 2>&1 | tee -a logfile.log
log_error;

#
# alsa
#
# a2jmidid - Daemon for exposing legacy ALSA MIDI in JACK MIDI systems
# aconnectgui - graphical ALSA sequencer connection manager
# aj-snapshot - make snapshots of JACK connections
# libasound2 - shared library for ALSA applications
# libasound2-data - Configuration files and profiles for ALSA drivers
# libasound2-dev - shared library for ALSA applications -- development files
# libasound2-doc - documentation for user-space ALSA application programming
# libasound2-plugin-smixer - smixer plugin for ALSA library
# alsa-oss - ALSA wrapper for OSS applications
# libasound2-plugins - ALSA library additional plugins
# alsa-tools - Console based ALSA utilities for specific hardware
# alsa-tools-gui - GUI based ALSA utilities for specific hardware
# ld10k1 - ALSA emu10k1/2 patch loader
# liblo10k1-0 - ALSA emu10k1/2 patch-loader library
# liblo10k1-dev - ALSA emu10k1/2 patch-loader library development files
# alsa-utils - Utilities for configuring and using ALSA
# libasound2-plugin-equal - equalizer plugin for ALSA
# alsamixergui - graphical soundcard mixer for ALSA soundcard driver
# alsaplayer-alsa - alsaplayer output module for ALSA
# alsaplayer-common - audio player (common files)
# alsaplayer-daemon - alsaplayer daemon
# alsaplayer-gtk - alsaplayer gtk interface
# alsaplayer-jack - alsaplayer output module for JACK
# alsaplayer-nas - alsaplayer output module for NAS
# alsaplayer-oss - alsaplayer output module for OSS
# alsaplayer-text - alsaplayer text interface
# alsaplayer-xosd - alsaplayer XOSD display module
# libalsaplayer-dev - alsaplayer plugin library (development files)
# libalsaplayer0 - alsaplayer plugin library
# ams - Realtime modular synthesizer for ALSA
# amsynth - two oscillator software synthesizer
# ardour - the digital audio workstation
# aseqjoy - Joystick to ALSA MIDI Sequencer Converter
# asterisk - Open Source Private Branch Exchange (PBX)
# audacious-plugins - Base plugins for audacious
# awesfx - utility programs for AWE32/64 and Emu10k1 driver
# balsa - e-mail client for GNOME
# balsa-dbg - e-mail client for GNOME - debugging symbols
# baresip - portable and modular SIP user-agent - metapackage
# baresip-core - portable and modular SIP user-agent - core parts
# baresip-ffmpeg - portable and modular SIP user-agent - FFmpeg codecs and formats
# baresip-gstreamer - portable and modular SIP user-agent - GStreamer pipelines
# baresip-gtk - portable and modular SIP user-agent - GTK+ front-end
# baresip-x11 - portable and modular SIP user-agent - X11 features
# blepvco - LADSPA, minBLEP-based, hard-sync-capable oscillator plugins
# cairo-dock-alsamixer-plug-in - Alsamixer plug-in for Cairo-dock
# libclalsadrv-dev - ALSA driver C++ access library (development files)
# libclalsadrv2 - ALSA driver C++ access library
# codecgraph - Generates graphviz graphs from HDA-Intel codec information
# multimedia-jack - JACK (Jack Audio Connection Kit) and ALSA related packages
# drumkv1 - old-school drum-kit sampler - standalone
# drumkv1-common - old-school drum-kit sampler - common files
# drumkv1-lv2 - old-school drum-kit sampler - lv2-plugin
# dssi-host-jack - Example of DSSI host
# libecereaudio0 - Ecere Audio
# libavdevice-dev - FFmpeg library for handling input and output devices - development files
# libavdevice57 - FFmpeg library for handling input and output devices - runtime files
# fische - stand-alone sound visualisation for Linux
# fomp - collection of LV2 audio plugins
# gmerlin - multiformat media player
# gnome-alsamixer - ALSA sound mixer for GNOME
# gom - Command line and interactive ncurses-based OSS audio mixer
# gstreamer1.0-alsa - GStreamer plugin for ALSA
# libghc-cryptonite-dev - cryptographic primitives
# libghc-cryptonite-doc - cryptographic primitives; documentation
# libghc-cryptonite-prof - cryptographic primitives; profiling libraries
# hydrogen - advanced drum machine/step sequencer
# jaaa - audio signal generator and spectrum analyser
# jack-keyboard - Virtual MIDI keyboard for JACK MIDI
# japa - JACK and ALSA Perceptual Analyser
# kmetronome - ALSA MIDI Metronome
# kmidimon - MIDI monitor using ALSA sequencer and KDE user interface
# kwave - sound editor for KDE
# libao-common - Cross Platform Audio Output Library (Common files)
# libao-dbg - Cross Platform Audio Output Library Debug Symbols
# libao-dev - Cross Platform Audio Output Library Development
# libao4 - Cross Platform Audio Output Library
# libcrypto++-dev - General purpose cryptographic library - C++ development
# libcrypto++-doc - General purpose cryptographic library - documentation
# libcrypto++-utils - General purpose cryptographic library - utilities and data files
# drumstick-tools - Qt4/C++ wrapper for ALSA Sequencer - utilities
# libdrumstick-dev - Qt4/C++ wrapper for ALSA Sequencer - development files
# libdrumstick0 - Qt4/C++ wrapper for ALSA Sequencer
# libdssialsacompat-dev - DSSI ALSA compatibility library (development files)
# libdssialsacompat0 - DSSI ALSA compatibility library for non-Linux platforms
# libgcrypt-mingw-w64-dev - LGPL Crypto library - Windows development
# libgcrypt20 - LGPL Crypto library - runtime library
# libgcrypt20-dev - LGPL Crypto library - development files
# libgcrypt20-doc - LGPL Crypto library - documentation
# libhinawa-dev - I/O library for IEEE 1394 asynchronous transactions (development file)
# libhinawa0 - I/O library for IEEE 1394 asynchronous transactions
# libmatemixer-common - Mixer library for MATE Desktop (common files)
# libmatemixer-dev - Mixer library for MATE Desktop (development files)
# libmatemixer-doc - Mixer library for MATE Desktop (documentation files)
# libmatemixer0 - Mixer library for MATE Desktop
# libmikmod-config - Portable sound library - development binaries
# libmikmod-dev - Portable sound library - development files
# libmikmod3 - Portable sound library
# libomxil-bellagio0-components-alsa - ALSA source/sink components for Bellagio OpenMAX IL
# libsdl1.2debian - Simple DirectMedia Layer
# libsdl2-2.0-0 - Simple DirectMedia Layer
# liquidsoap-plugin-alsa - audio streaming language -- ALSA plugin
# mate-media - MATE media utilities
# mcp-plugins - LADSPA plugins designed for Alsa Modular Synth
# mhwaveedit - Simple and fast GTK2 sound editor
# mididings - MIDI router and processor based on Python
# mididings-doc - mididings Documentation
# python-mididings - MIDI routing library for Python
# midisnoop - MIDI monitor and prober
# mkchromecast - Cast your Linux audio to your Google Cast devices
# mkchromecast-alsa - ALSA dependencies to cast with mkchromecast
# moc - ncurses based console audio player
# mopidy-alsamixer - Mopidy extension for extension for ALSA volume control
# mpg123 - MPEG layer 1/2/3 audio player
# mudita24 - ALSA GUI control tool for Envy24 (ice1712) soundcards
# nautilus-sendto - easily send files via email from within Nautilus
# nted - Musical score editor
# libalsa-ocaml - OCaml bindings for the ALSA library
# libalsa-ocaml-dev - OCaml bindings for the ALSA library
# libbjack-ocaml - OCaml blocking interface to jack audio connection kit
# libbjack-ocaml-dev - OCaml blocking interface to jack audio connection kit
# libopenal1 - Software implementation of the OpenAL audio API (shared library)
# oss-compat - Open Sound System (OSS) compatibility package
# osspd - OSS Proxy Daemon: Userland OSS emulation
# osspd-alsa - OSS Proxy Daemon: ALSA backend (experimental)
# osspd-pulseaudio - OSS Proxy Daemon: PulseAudio backend
# patchage - modular patch bay for Jack audio and Alsa Midi
# libpcaudio-dev - C API to different audio devices - development files
# libpcaudio0 - C API to different audio devices - shared library
# pd-mediasettings - programmatically modify the audio and MIDI settings from within Pd
# petri-foo - MIDI controllable audio sampler - successor of specimen
# phasex - Phase Harmonic Advanced Synthesis EXperiment
# phasex-dbg - Debugging symbols for PHASEX
# playitslowly - Plays back audio files at a different speed or pitch
# pmidi - command line midi player for ALSA
# pnmixer - Simple mixer application for system tray
# libpt2.10.11 - Portable Tools Library
# pulseaudio - PulseAudio sound server
# python-alsaaudio - Alsa bindings for Python
# python-pyalsa - Official ALSA Python binding library
# qasconfig - ALSA configuration browser
# qashctl - mixer for ALSA's High level Control Interface
# qasmixer - ALSA mixer for the desktop
# qastools-common - QasTools common files
# qmidiarp - MIDI arpeggiator for ALSA
# qmidinet - MIDI Network Gateway via UDP/IP Multicast
# qmmp - feature-rich audio player with support of many formats
# qtractor - MIDI/Audio multi-track sequencer application
# quisk - Software Defined Radio (SDR)
# randomsound - ALSA sound card related entropy gathering daemon
# librtaudio-dev - C++ library for realtime audio input/ouput (development files)
# librtaudio5a - C++ library for realtime audio input/ouput
# librtmidi-dev - C++ library for realtime MIDI input/ouput (development files)
# librtmidi3 - C++ library for realtime MIDI input/ouput
# showq - MIDI controllable audio player
# simplescreenrecorder - Feature-rich screen recorder for X11 and OpenGL
# libsnack-alsa - Sound extension to Tcl/Tk and Python/Tkinter - ALSA files
# tcl-snack - Sound extension to Tcl/Tk and Python/Tkinter - Tcl/Tk library
# snd-gtk-jack - Sound file editor (GTK+ user interface - JACK)
# snd-nox - Sound file editor (cmdline)
# sound-theme-freedesktop - freedesktop.org sound theme
# libsox-fmt-alsa - SoX alsa format I/O library
# libsox2 - SoX library of audio effects and processing
# sox - Swiss army knife of sound processing
# squeezelite - lightweight headless Squeezebox emulator - ALSA version
# stymulator - Curses based player and converter for the YM chiptune format
# timidity - Software sound renderer (MIDI sequencer, MOD player)
# tuxguitar-alsa - tuxguitar plugin for sound playback using ALSA
# libcw6 - Morse code tutor - shared library
# vkeybd - Virtual MIDI Keyboard
# vokoscreen - easy to use screencast creator
# volti - control audio volume from system tray/notification area
# volumecontrol.app - Audio mixer for GNUstep
# volumeicon-alsa - systray volume icon for alsa
# wildmidi - software MIDI player
# xmms2-plugin-alsa - XMMS2 - ALSA output
# zita-ajbridge - alsa to jack bridge
# libzita-alsa-pcmi-dev - Development files (headers) for libzita-alsa-pcmi library
# libzita-alsa-pcmi0 - C++ wrapper around the ALSA API
# zita-alsa-pcmi-utils - Two simple demo programs zita-alsa-pcmi library
echo $TOTDATE
ACTION="alsa"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install a2jmidid aconnectgui aj-snapshot libasound2 libasound2-data libasound2-dev libasound2-doc libasound2-plugin-smixer alsa-oss libasound2-plugins alsa-tools alsa-tools-gui ld10k1 liblo10k1-0 liblo10k1-dev alsa-utils libasound2-plugin-equal alsamixergui alsaplayer-alsa alsaplayer-common alsaplayer-daemon alsaplayer-gtk alsaplayer-jack alsaplayer-nas alsaplayer-oss alsaplayer-text alsaplayer-xosd libalsaplayer-dev libalsaplayer0 ams amsynth ardour aseqjoy asterisk audacious-plugins awesfx balsa balsa-dbg baresip baresip-core baresip-ffmpeg baresip-gstreamer baresip-gtk baresip-x11 blepvco cairo-dock-alsamixer-plug-in libclalsadrv-dev libclalsadrv2 codecgraph multimedia-jack drumkv1 drumkv1-common drumkv1-lv2 dssi-host-jack libecereaudio0 libavdevice-dev libavdevice57 fische fomp gmerlin gnome-alsamixer gom gstreamer1.0-alsa libghc-cryptonite-dev libghc-cryptonite-doc libghc-cryptonite-prof hydrogen jaaa jack-keyboard japa kmetronome kmidimon kwave libao-common libao-dbg libao-dev libao4 libcrypto++-dev libcrypto++-doc libcrypto++-utils drumstick-tools libdrumstick-dev libdrumstick0 libdssialsacompat-dev libdssialsacompat0 libgcrypt-mingw-w64-dev libgcrypt20 libgcrypt20-dev libgcrypt20-doc libhinawa-dev libhinawa0 libmatemixer-common libmatemixer-dev libmatemixer-doc libmatemixer0 libmikmod-config libmikmod-dev libmikmod3 libomxil-bellagio0-components-alsa libsdl1.2debian libsdl2-2.0-0 liquidsoap-plugin-alsa mate-media mcp-plugins mhwaveedit mididings mididings-doc python-mididings midisnoop mkchromecast mkchromecast-alsa moc mopidy-alsamixer mpg123 mudita24 nautilus-sendto nted libalsa-ocaml libalsa-ocaml-dev libbjack-ocaml libbjack-ocaml-dev libopenal1 oss-compat osspd osspd-alsa osspd-pulseaudio patchage libpcaudio-dev libpcaudio0 pd-mediasettings petri-foo phasex phasex-dbg playitslowly pmidi pnmixer libpt2.10.11 pulseaudio python-alsaaudio python-pyalsa qasconfig qashctl qasmixer qastools-common qmidiarp qmidinet qmmp qtractor quisk randomsound librtaudio-dev librtaudio5a librtmidi-dev librtmidi3 showq simplescreenrecorder libsnack-alsa tcl-snack snd-gtk-jack snd-nox sound-theme-freedesktop libsox-fmt-alsa libsox2 sox squeezelite stymulator timidity tuxguitar-alsa libcw6 vkeybd vokoscreen volti volumecontrol.app volumeicon-alsa wildmidi xmms2-plugin-alsa zita-ajbridge libzita-alsa-pcmi-dev libzita-alsa-pcmi0 zita-alsa-pcmi-utils 2>&1 | tee -a logfile.log
log_error;

#
# amsynth
#
# amsynth - two oscillator software synthesizer
echo $TOTDATE
ACTION="amsynth"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install amsynth 2>&1 | tee -a logfile.log
log_error;

#
# ardour
#
# amb-plugins - ambisonics LADSPA plugins
# ardour - the digital audio workstation
# ardour-altivec - transitional dummy package for (altivec-optimized) ardour
# ardour-data - digital audio workstation (data)
# ardour-i686 - transitional dummy package for (i686 optimized) ardour
# ardour-video-timeline - digital audio workstation - video timeline
# ardour3 - transitional dummy package for ardour
# calf-plugins - Calf Studiogear - audio effects and sound generators
# fil-plugins - parametric equalizer LADSPA plugin
# gjacktransport - access to the JACK's transport mechanism as touchable slider
# harvid - HTTP Ardour Video Server
# so-synth-lv2 - Set of synthesizers for the LV2 plugin format
# swh-lv2 - Steve Harris's SWH plugins ported to LV2
# tap-plugins - Tom's Audio Processing LADSPA plugins
# tap-plugins-doc - TAP-plugins documentation
# xjadeo - Video player with JACK sync
echo $TOTDATE
ACTION="ardour"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install amb-plugins ardour ardour-altivec ardour-data ardour-i686 ardour-video-timeline ardour3 calf-plugins fil-plugins gjacktransport harvid so-synth-lv2 swh-lv2 tap-plugins tap-plugins-doc xjadeo 2>&1 | tee -a logfile.log
log_error;

#
# aria maestosa
#
# Unavailable
echo $TOTDATE
ACTION="aria maestosa"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# arpage+zonage
#
# Unavailable
echo $TOTDATE
ACTION="arpage+zonage"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# arpeggiator
#
# qmidiarp - MIDI arpeggiator for ALSA
echo $TOTDATE
ACTION="arpeggiator"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install qmidiarp 2>&1 | tee -a logfile.log
log_error;

#
# arty fx
#
# Unavailable
echo $TOTDATE
ACTION="arty fx"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# audacity
#
# audacity - fast, cross-platform audio editor
# audacity-data - fast, cross-platform audio editor (data)
# debian-edu-doc-en - English documentation from the Debian Edu project
# debian-edu-doc-fr - French documentation from the Debian Edu project
# debian-edu-doc-nb - Bokmål documentation from the Debian Edu project
# debian-edu-doc-nl - Dutch documentation from the Debian Edu project
# forensics-extra-gui - Forensics Environment - extra GUI components (metapackage)
# silan - commandline tool to detect silence in audio-files
# vamp-plugin-sdk - audio analysis and feature extraction plugins (SDK)
echo $TOTDATE
ACTION="audacity"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install audacity audacity-data debian-edu-doc-en debian-edu-doc-fr debian-edu-doc-nb debian-edu-doc-nl forensics-extra-gui silan vamp-plugin-sdk 2>&1 | tee -a logfile.log
log_error;

#
# cadence
#
# Unavailable
echo $TOTDATE
ACTION="cadence"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# calf studio gear
#
# calf-plugins - Calf Studiogear - audio effects and sound generators
echo $TOTDATE
ACTION="calf studio gear"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log 
$APPS install calf-plugins 2>&1 | tee -a logfile.log
log_error;

#
# caps
#
# libasound2-plugin-equal - equalizer plugin for ALSA
# caps - C* Audio Plugin Suite
echo $TOTDATE
ACTION="caps"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install libasound2-plugin-equal caps 2>&1 | tee -a logfile.log
log_error;

#
# carla
#
# Unavailable
echo $TOTDATE
ACTION="carla"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# catia
#
# Unavailable
echo $TOTDATE
ACTION="catia"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# chord
#
# abcmidi - converter from ABC to MIDI format and back
# autotalent - pitch correction LADSPA plugin
# chordii - Text file (chordpro format) to music sheet converter
# gmorgan - MIDI rhythm station emulator software
# jfugue - Java API for music programming - transitional package
# libjfugue-java - Java API for music programming
# inputattach - utility to connect serial-attached peripherals to the input subsystem
# mma - Musical MIDI Accompaniment Generator
# musescore - Free music composition and notation software
# musescore-common - Free music composition and notation software (common files)
# elpa-projectile - project interaction library for Emacs
# solfege - Ear training software
# texlive-music - TeX Live: Music packages
echo $TOTDATE
ACTION="chord"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install abcmidi autotalent chordii gmorgan jfugue libjfugue-java inputattach mma musescore musescore-common elpa-projectile solfege texlive-music 2>&1 | tee -a logfile.log
log_error;

#
# claudia
#
# Unavailable
echo $TOTDATE
ACTION="claudia"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
# $APPS install 2>&1 | tee -a logfile.log

#
# clementine
#
# clementine - modern music player and library organizer
# gnome-shell-extension-mediaplayer - GNOME Shell extension to control media players
echo $TOTDATE
ACTION="clementine"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install clementine gnome-shell-extension-mediaplayer 2>&1 | tee -a logfile.log
log_error;

#
# csound
#
# cecilia - Sound synthesis and audio signal processing environment
# csladspa - LADSPA plugin for Csound
# csound - powerful and versatile sound synthesis software
# csound-data - data files used by the csound library
# csound-utils - miscellaneous utilities for the Csound system
# libcsnd-dev - development files for Csound -- C++ API
# libcsnd6-6.0v5 - C++ bindings for the Csound API
# libcsnd6-java - Java bindings for the Csound API
# libcsound64-6.0 - main library for Csound
# libcsound64-dev - development files for Csound
# libcsound64-doc - Csound API documentation
# libcsoundac-dev - development files for CsoundAC
# libcsoundac6.0v5 - Csound Algorithmic Composition library
# liblua5.1-luacsnd - Lua bindings for the Csound API
# pd-csound - Csound external for PureData
# python-csound - Python bindings for Csound
# python-csoundac - Python bindings for CsoundAC
# csound-doc - documentation for csound
# csoundqt - frontend for the csound sound processor
# csoundqt-examples - example scores for csoundqt
# nyquist - language for music composition and sound synthesis
# rosegarden - music editor and MIDI/audio sequencer
echo $TOTDATE
ACTION="csound"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install cecilia csladspa csound csound-data csound-utils libcsnd-dev libcsnd6-6.0v5 libcsnd6-java libcsound64-6.0 libcsound64-dev libcsound64-doc libcsoundac-dev libcsoundac6.0v5 liblua5.1-luacsnd pd-csound python-csound python-csoundac csound-doc csoundqt csoundqt-examples nyquist rosegarden 2>&1 | tee -a logfile.log
log_error;

#
# drmr
#
# Unavailable
echo $TOTDATE
ACTION="drmr"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
# $APPS install 2>&1 | tee -a logfile.log

#
# drumgizmo
#
# dgedit - drum kit editor for DrumGizmo
# drumgizmo - Audio sampler plugin and stand-alone app that simulates a real drum kit
echo $TOTDATE
ACTION="drumgizmo"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install dgedit drumgizmo 2>&1 | tee -a logfile.log
log_error;

#
# drumkv1
#
# drumkv1 - old-school drum-kit sampler - standalone
# drumkv1-common - old-school drum-kit sampler - common files
# drumkv1-lv2 - old-school drum-kit sampler - lv2-plugin
echo $TOTDATE
ACTION="drumkv1"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install drumkv1 drumkv1-common drumkv1-lv2 2>&1 | tee -a logfile.log
log_error;

#
# dssi
#
# dssi-dev - Header file for compiling DSSI plugins and hosts
# dssi-example-plugins - Examples of DSSI plugin
# dssi-host-jack - Example of DSSI host
# dssi-utils - Command-line utilities for sending commands to DSSI plugins
# fluidsynth-dssi - DSSI wrapper for the FluidSynth SoundFont-playing synthesizer
# ghostess - A graphical DSSI plugin host
# hexter - Yamaha DX7 modeling DSSI plugin
# libdssialsacompat-dev - DSSI ALSA compatibility library (development files)
# libdssialsacompat0 - DSSI ALSA compatibility library for non-Linux platforms
# liquidsoap-plugin-dssi - audio streaming language -- DSSI plugin
# ll-scope - an oscilloscope DSSI plugin
# naspro-bridges - collection of bridges to LV2
# nekobee - Simple single-oscillator DSSI plugin
# libdssi-ocaml - OCaml interface to DSSI plugins -- runtime files
# libdssi-ocaml-dev - OCaml interface to DSSI plugins -- developpement files
# whysynth - DSSI Soft Synth Interface
# wsynth-dssi - hack on Xsynth-DSSI to allow wavetable synthesis
# xsynth-dssi - classic-analog (VCOs-VCF-VCA) style software synthesizer
# zynaddsubfx-dssi - dssi plugin of zynaddsubfx
echo $TOTDATE
ACTION="dssi"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install dssi-dev dssi-example-plugins dssi-host-jack dssi-utils fluidsynth-dssi ghostess hexter libdssialsacompat-dev libdssialsacompat0 liquidsoap-plugin-dssi ll-scope naspro-bridges nekobee libdssi-ocaml libdssi-ocaml-dev whysynth wsynth-dssi xsynth-dssi zynaddsubfx-dssi 2>&1 | tee -a logfile.log
log_error;

#
# eq10q
#
# eq10q - LV2 plugins bundle
echo $TOTDATE
ACTION="eq10q"
echo "Subset: "$ACTION":" 
$APPS install eq10q 2>&1 | tee -a logfile.log
log_error;

#
# fabla
#
# Unavailable
echo $TOTDATE
ACTION="csound"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# ffmpeg
#
# python-audioread - Backend-agnostic audio decoding Python package
# python3-audioread - Backend-agnostic audio decoding Python 3 package
# libavifile-0.7-bin - toolkit for libavifile
# libavifile-0.7-common - toolkit for libavifile
# libavifile-0.7c2 - shared libraries for AVI read/writing
# baresip - portable and modular SIP user-agent - metapackage
# baresip-core - portable and modular SIP user-agent - core parts
# baresip-ffmpeg - portable and modular SIP user-agent - FFmpeg codecs and formats
# baresip-gstreamer - portable and modular SIP user-agent - GStreamer pipelines
# baresip-gtk - portable and modular SIP user-agent - GTK+ front-end
# baresip-x11 - portable and modular SIP user-agent - X11 features
# cmus-plugin-ffmpeg - lightweight ncurses audio player (FFmpeg plugin)
# ffmpeg - Tools for transcoding, streaming and playing of multimedia files
# ffmpeg-doc - Documentation of the FFmpeg multimedia framework
# libav-tools - Compatibility links for libav-tools (transitional package)
# libavcodec-dev - FFmpeg library with de/encoders for audio/video codecs - development files
# libavcodec-extra - FFmpeg library with extra codecs (metapackage)
# libavcodec-extra57 - FFmpeg library with additional de/encoders for audio/video codecs
# libavcodec57 - FFmpeg library with de/encoders for audio/video codecs - runtime files
# libavdevice-dev - FFmpeg library for handling input and output devices - development files
# libavdevice57 - FFmpeg library for handling input and output devices - runtime files
# libavfilter-dev - FFmpeg library containing media filters - development files
# libavfilter-extra - FFmpeg library with extra filters (metapackage)
# libavfilter-extra6 - FFmpeg library with extra media filters - runtime files
# libavfilter6 - FFmpeg library containing media filters - runtime files
# libavformat-dev - FFmpeg library with (de)muxers for multimedia containers - development files
# libavformat57 - FFmpeg library with (de)muxers for multimedia containers - runtime files
# libavresample-dev - FFmpeg compatibility library for resampling - development files
# libavresample3 - FFmpeg compatibility library for resampling - runtime files
# libavutil-dev - FFmpeg library with functions for simplifying programming - development files
# libavutil55 - FFmpeg library with functions for simplifying programming - runtime files
# libpostproc-dev - FFmpeg library for post processing - development files
# libpostproc54 - FFmpeg library for post processing - runtime files
# libswresample-dev - FFmpeg library for audio resampling, rematrixing etc. - development files
# libswresample2 - FFmpeg library for audio resampling, rematrixing etc. - runtime files
# libswscale-dev - FFmpeg library for image scaling and various conversions - development files
# libswscale4 - FFmpeg library for image scaling and various conversions - runtime files
# ffmpeg2theora - Theora video encoder using ffmpeg
# ffmpegthumbnailer - fast and lightweight video thumbnailer
# ffmpegthumbnailer-dbg - debugging information for ffmpegthumbnailer
# libffmpegthumbnailer-dev - development files for ffmpegthumbnailer
# libffmpegthumbnailer4v5 - shared library for ffmpegthumbnailer
# ffmpegthumbs - video thumbnail generator using ffmpeg
# ffmsindex - Command line tool to create ffms2 index files
# libffms2-4 - Cross platform ffmpeg wrapper library
# libffms2-dev - Development files for libffms2
# gmerlin-encoders-ffmpeg - ffmpeg encoders for Gmerlin
# harvid - HTTP Ardour Video Server
# imagination - DVD slide show maker
# imagination-common - DVD slide show maker - common files
# libk3b6-extracodecs - KDE CD/DVD burning application library - extra decoders
# kdenlive - non-linear video editor
# kdenlive-data - non-linear video editor (data files)
# kdenlive-dbg - non-linear video editor (debugging symbols)
# kmplayer - media player for KDE
# mkchromecast - Cast your Linux audio to your Google Cast devices
# moc-ffmpeg-plugin - ncurses based console audio player - ffmpeg plugin
# qmmp - feature-rich audio player with support of many formats
# silan - commandline tool to detect silence in audio-files
# squeezelite - lightweight headless Squeezebox emulator - ALSA version
# squeezelite-pa - lightweight headless Squeezebox emulator - PortAudio version
# tumbler-plugins-extra - D-Bus thumbnailing service (additional plugins)
# vokoscreen - easy to use screencast creator
# winff - graphical video and audio batch converter using ffmpeg or avconv
# winff-data - winff data files
# winff-doc - winff documentation
# winff-gtk2 - GTK+ variant of winff
# winff-qt - Qt variant of winff
# libxine2-ffmpeg - MPEG-related plugins for libxine2
echo $TOTDATE
ACTION="ffmpeg"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install python-audioread python3-audioread libavifile-0.7-bin libavifile-0.7-common libavifile-0.7c2 baresip baresip-core baresip-ffmpeg baresip-gstreamer baresip-gtk baresip-x11 cmus-plugin-ffmpeg ffmpeg ffmpeg-doc libav-tools libavcodec-dev libavcodec-extra libavcodec-extra57 libavcodec57 libavdevice-dev libavdevice57 libavfilter-dev libavfilter-extra libavfilter-extra6 libavfilter6 libavformat-dev libavformat57 libavresample-dev libavresample3 libavutil-dev libavutil55 libpostproc-dev libpostproc54 libswresample-dev libswresample2 libswscale-dev libswscale4 ffmpeg2theora ffmpegthumbnailer ffmpegthumbnailer-dbg libffmpegthumbnailer-dev libffmpegthumbnailer4v5 ffmpegthumbs ffmsindex libffms2-4 libffms2-dev gmerlin-encoders-ffmpeg harvid imagination imagination-common libk3b6-extracodecs kdenlive kdenlive-data kdenlive-dbg kmplayer mkchromecast moc-ffmpeg-plugin qmmp silan squeezelite squeezelite-pa tumbler-plugins-extra vokoscreen winff winff-data winff-doc winff-gtk2 winff-qt libxine2-ffmpeg 2>&1 | tee -a logfile.log
log_error;

#
# fluid-soundfont-gm
#
# fluid-soundfont-gm - Fluid (R3) General MIDI SoundFont (GM)
echo $TOTDATE
ACTION="fluid-soundfont-gm"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install fluid-soundfont-gm 2>&1 | tee -a logfile.log
log_error;

#
# fluidsynth
#
# fluid-soundfont-gm - Fluid (R3) General MIDI SoundFont (GM)
# fluid-soundfont-gs - Fluid (R3) General MIDI SoundFont (GS)
# fluidsynth - Real-time MIDI software synthesizer
# libfluidsynth-dev - Real-time MIDI software synthesizer (development files)
# libfluidsynth1 - Real-time MIDI software synthesizer (runtime library)
# fluidsynth-dssi - DSSI wrapper for the FluidSynth SoundFont-playing synthesizer
# freewheeling - live looping musical instrument
# libsdl2-mixer-2.0-0 - Mixer library for Simple DirectMedia Layer 2, libraries
# libsdl2-mixer-dbg - Mixer library for Simple DirectMedia Layer 2, debugging
# libsdl2-mixer-dev - Mixer library for Simple DirectMedia Layer 2, development files
# musescore - Free music composition and notation software
# musescore-common - Free music composition and notation software (common files)
# opl3-soundfont - OPL3 SoundFont that simulates the sound of an OPL3 chip
# qsynth - fluidsynth MIDI sound synthesiser front-end
# tinyeartrainer - A tool to learn recognizing musical intervals
# tuxguitar-fluidsynth - tuxguitar plugin for sound playback using fluidsynth
# vlc - multimedia player and streamer
# vlc-plugin-fluidsynth - FluidSynth plugin for VLC
echo $TOTDATE
ACTION="fluidsynth" 
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install fluid-soundfont-gm fluid-soundfont-gs fluidsynth libfluidsynth-dev libfluidsynth1 fluidsynth-dssi freewheeling libsdl2-mixer-2.0-0 libsdl2-mixer-dbg libsdl2-mixer-dev musescore musescore-common opl3-soundfont qsynth tinyeartrainer tuxguitar-fluidsynth vlc vlc-plugin-fluidsynth 2>&1 | tee -a logfile.log
log_error;

#
# fomp
#
# fomp - collection of LV2 audio plugins
echo $TOTDATE
ACTION="fomp"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install fomp 2>&1 | tee -a logfile.log
log_error;

#
# frescobaldi
#
# frescobaldi - LilyPond sheet music text editor
# python-ly - Tool and library for manipulating LilyPond files (Python 2)
# python-ly-doc - Tool and library for manipulating LilyPond files (documentation)
# python3-ly - Tool and library for manipulating LilyPond files (Python 3)
echo $TOTDATE
ACTION="frescobaldi"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install frescobaldi python-ly python-ly-doc python3-ly 2>&1 | tee -a logfile.log
log_error;

#
# fretsonfire
#
# fretsonfire - game of musical skill and fast fingers
# fretsonfire-game - game of musical skill and fast fingers - Game files
# fretsonfire-songs-muldjord - game of musical skill and fast fingers - Songs Package
# fretsonfire-songs-sectoid - game of musical skill and fast fingers - Songs Package
echo $TOTDATE
ACTION="fretsonfire"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install fretsonfire fretsonfire-game fretsonfire-songs-muldjord fretsonfire-songs-sectoid 2>&1 | tee -a logfile.log
log_error;

#
# gstreamer
#
# python-audioread - Backend-agnostic audio decoding Python package
# autoradio - radio automation software
# baresip - portable and modular SIP user-agent - metapackage
# baresip-core - portable and modular SIP user-agent - core parts
# baresip-ffmpeg - portable and modular SIP user-agent - FFmpeg codecs and formats
# baresip-gstreamer - portable and modular SIP user-agent - GStreamer pipelines
# baresip-gtk - portable and modular SIP user-agent - GTK+ front-end
# baresip-x11 - portable and modular SIP user-agent - X11 features
# brasero - CD/DVD burning application for GNOME
# gir1.2-clutter-gst-3.0 - Gobject introspection data for Clutter GStreamer elements
# gstreamer1.0-clutter-3.0 - Clutter PLugin for GStreamer 1.0
# libclutter-gst-3.0-0 - Open GL based interactive canvas library GStreamer elements
# libclutter-gst-3.0-dev - Open GL based interactive canvas library GStreamer elements (development files)
# libclutter-gst-3.0-doc - Open GL based interactive canvas library GStreamer elements (documentation)
# gir1.2-coglgst-2.0 - GObject introspection data for the CoglGst 2.0 library
# libcogl-gst20 - Object oriented GL/GLES Abstraction/Utility Layer
# gstreamer1.0-crystalhd - Crystal HD Video Decoder (GStreamer plugin)
# fso-deviced-player-gstreamer - GStreamer player module for fso-deviced
# gambas3-gb-media - Gambas media component
# gnome-sushi - sushi is a quick previewer for nautilus
# gnome-twitch-player-backend-gstreamer-cairo - Player backend for GNOME Twitch based on gstreamer+cairo
# gnome-twitch-player-backend-gstreamer-clutter - Player backend for GNOME Twitch based on gstreamer+clutter
# gnome-twitch-player-backend-gstreamer-opengl - Player backend for GNOME Twitch based on gstreamer+opengl
# gnome-video-effects - Collection of GStreamer effects
# gnome-video-effects-dev - Development files for gnome-video-effects
# gnome-video-effects-frei0r - GNOME Video Effects - frei0r plugins
# goobox - CD player and ripper with GNOME 3 integration
# gstreamer1.0-fluendo-mp3 - Fluendo mp3 decoder GStreamer 1.0 plugin
# gstreamer1.0-libav - libav plugin for GStreamer
# gstreamer1.0-libav-dbg - libav plugin for GStreamer (debug symbols)
# gir1.2-gst-plugins-bad-1.0 - GObject introspection data for the GStreamer libraries from the "bad" set
# gstreamer1.0-plugins-bad - GStreamer plugins from the "bad" set
# gstreamer1.0-plugins-bad-dbg - GStreamer plugins from the "bad" set (debug symbols)
# gstreamer1.0-plugins-bad-doc - GStreamer documentation for plugins from the "bad" set
# libgstreamer-plugins-bad1.0-0 - GStreamer development files for libraries from the "bad" set
# libgstreamer-plugins-bad1.0-dev - GStreamer development files for libraries from the "bad" set
# gir1.2-gst-plugins-base-1.0 - GObject introspection data for the GStreamer Plugins Base library
# gstreamer1.0-alsa - GStreamer plugin for ALSA
# gstreamer1.0-plugins-base - GStreamer plugins from the "base" set
# gstreamer1.0-plugins-base-apps - GStreamer helper programs from the "base" set
# gstreamer1.0-plugins-base-dbg - GStreamer plugins from the "base" set
# gstreamer1.0-plugins-base-doc - GStreamer documentation for plugins from the "base" set
# gstreamer1.0-x - GStreamer plugins for X11 and Pango
# libgstreamer-plugins-base1.0-0 - GStreamer libraries from the "base" set
# libgstreamer-plugins-base1.0-dev - GStreamer development files for libraries from the "base" set
# gstreamer1.0-espeak - GStreamer plugin for eSpeak speech synthesis
# gstreamer1.0-plugins-good - GStreamer plugins from the "good" set
# gstreamer1.0-plugins-good-dbg - GStreamer plugins from the "good" set
# gstreamer1.0-plugins-good-doc - GStreamer documentation for plugins from the "good" set
# gstreamer1.0-pulseaudio - GStreamer plugin for PulseAudio
# gstreamer1.0-plugins-ugly - GStreamer plugins from the "ugly" set
# gstreamer1.0-plugins-ugly-dbg - GStreamer plugins from the "ugly" set (debug symbols)
# gstreamer1.0-plugins-ugly-doc - GStreamer documentation for plugins from the "ugly" set
# python-gst-1.0 - GStreamer GObject Introspection overrides for Python
# python-gst-1.0-dbg - GStreamer GObject Introspection overrides for Python (debug extensions)
# python3-gst-1.0 - GStreamer GObject Introspection overrides for Python (Python 3)
# python3-gst-1.0-dbg - GStreamer GObject Introspection overrides for Python (Python 3, debug extensions)
# gir1.2-gst-rtsp-server-1.0 - GObject introspection data for the GStreamer RTSP Server
# gstreamer1.0-rtsp - RTSP plugin for GStreamer
# gstreamer1.0-rtsp-dbg - RTSP plugin for GStreamer
# libgstrtspserver-1.0-0 - GStreamer RTSP Server (shared library)
# libgstrtspserver-1.0-0-dbg - GStreamer RTSP Server (debug symbols)
# libgstrtspserver-1.0-dev - GStreamer RTSP Server (development files)
# libgstrtspserver-1.0-doc - GStreamer RTSP Server (documentation)
# gst123 - GStreamer based command line media player
# ges1.0-tools - Tools for use with the GStreamer editing services
# gir1.2-ges-1.0 - GObject introspection data for the GES library
# libges-1.0-0 - GStreamer editing services (shared library)
# libges-1.0-0-dbg - GStreamer editing services (debug symbols)
# libges-1.0-dev - GStreamer editing services (development files)
# libges-1.0-doc - GStreamer editing services (documentation)
# gstreamer1.0-vaapi - VA-API plugins for GStreamer
# gstreamer1.0-vaapi-doc - GStreamer VA-API documentation and manuals
# gir1.2-gstreamer-1.0 - GObject introspection data for the GStreamer library
# gstreamer1.0-doc - GStreamer core documentation and manuals
# gstreamer1.0-tools - Tools for use with GStreamer
# libgstreamer1.0-0 - Core GStreamer libraries and elements
# libgstreamer1.0-0-dbg - Core GStreamer libraries and elements
# libgstreamer1.0-dev - GStreamer core development files
# libgstreamermm-1.0-1 - C++ wrapper library for GStreamer (shared libraries)
# libgstreamermm-1.0-dev - C++ wrapper library for GStreamer (development files)
# libgstreamermm-1.0-doc - C++ wrapper library for GStreamer (documentation)
# libcanberra-gstreamer - GStreamer backend for libcanberra
# gir1.2-nice-0.1 - ICE library (GObject introspection)
# gstreamer1.0-nice - ICE library (GStreamer plugin)
# libnice-dbg - ICE library (debugging symbols)
# libnice-dev - ICE library (development files)
# libnice-doc - ICE library (documentation)
# libnice10 - ICE library (shared library)
# gstreamer-qapt - GStreamer plugin to install codecs using QApt
# gstreamer0.10-qapt - transitional dummy package
# libreoffice - office productivity suite (metapackage)
# libreoffice-avmedia-backend-gstreamer - GStreamer backend for LibreOffice
# liquidsoap-plugin-gstreamer - audio streaming language -- GStreamer plugin
# lua-lgi - Lua bridge to GObject based libraries
# lua-lgi-dbg - Lua bridge to GObject based libraries
# mkchromecast-gstreamer - Gstreamer dependencies to cast with mkchromecast
# libgstreamer-ocaml - OCaml interface to the gstreamer library -- runtime files
# libgstreamer-ocaml-dev - OCaml interface to the gstreamer library -- development files
# gstreamer1.0-packagekit - GStreamer plugin to install codecs using PackageKit
# parole - media player based on GStreamer framework
# parole-dev - development files for Parole media player
# phonon-backend-gstreamer - Phonon GStreamer 1.0 backend
# phonon-backend-gstreamer-common - Phonon GStreamer 1.0.x backend icons
# phonon4qt5-backend-gstreamer - Phonon Qt5 GStreamer 1.0 backend
# pitivi - non-linear audio/video editor using GStreamer
# playitslowly - Plays back audio files at a different speed or pitch
# gstreamer1.0-pocketsphinx - Speech recognition tool - gstreamer plugin
# pulseaudio - PulseAudio sound server
# libqt5glib-2.0-0 - C++ bindings library for GLib and GObject with a Qt-style API - Qt 5 build
# libqt5gstreamer-1.0-0 - C++ bindings library for GStreamer with a Qt-style API - Qt 5 build
# libqt5gstreamer-dev - Development headers for QtGStreamer - Qt 5 build
# libqt5gstreamerquick-1.0-0 - QtGStreamerQuick library - Qt 5 build
# libqt5gstreamerui-1.0-0 - QtGStreamerUi library - Qt 5 build
# libqt5gstreamerutils-1.0-0 - QtGStreamerUtils library - Qt 5 build
# libqtglib-2.0-0 - C++ bindings library for GLib and GObject with a Qt-style API
# libqtgstreamer-1.0-0 - C++ bindings library for GStreamer with a Qt-style API
# libqtgstreamer-dev - Development headers for QtGStreamer
# libqtgstreamerui-1.0-0 - QtGStreamerUi library
# libqtgstreamerutils-1.0-0 - QtGStreamerUtils library
# qml-module-qtgstreamer - QML plugins from QtGStreamer - Qt 5 build
# qt5gstreamer-dbg - Debug symbols for QtGStreamer - Qt 5 build
# qtgstreamer-dbg - Debug symbols for QtGStreamer
# qtgstreamer-declarative - QML plugins from QtGStreamer
# qtgstreamer-doc - QtGStreamer API documentation
# qtgstreamer-plugins - GStreamer plugins from QtGStreamer
# qtgstreamer-plugins-qt5 - GStreamer plugins from QtGStreamer - Qt 5 build
# libqgsttools-p1 - GStreamer tools for  Qt 5 Multimedia module
# libqt5multimedia5-plugins - Qt 5 Multimedia module plugins
# roarplaylistd-codechelper-gst - roarplaylistd helper script for GStreamer codecs
# ruby-gstreamer - GStreamer bindings for the Ruby language
# librygel-renderer-gst-2.6-2 - GNOME UPnP/DLNA services - renderer library
# rygel - GNOME UPnP/DLNA services
# rygel-gst-launch - GNOME UPnP/DLNA services - gst-launch plugin
# rygel-playbin - GNOME UPnP/DLNA services - GStreamer Media Renderer plugin
# sound-juicer - GNOME CD Ripper
# soundconverter - GNOME application to convert audio files into other formats
# subtitlecomposer - Subtitles editor for KDE
# subtitleeditor - Graphical subtitle editor with sound waves representation
# tap-plugins - Tom's Audio Processing LADSPA plugins
# tap-plugins-doc - TAP-plugins documentation
# libtelepathy-qt4-farstream2 - Telepathy/Farsight integration - Qt 4 library
# libtelepathy-qt5-farstream0 - Telepathy/Farsight integration - Qt 5 library
# totem - Simple media player for the GNOME desktop based on GStreamer
# transmageddon - video transcoder for Linux and Unix systems built using GStreamer
# vim-syntax-gtk - Syntax files to highlight GTK+ keywords in vim
# vlevel - Levelling audio filter as command-line tool and LADSPA/JACK plugin
# voctomix - Full-HD Software Live-Video-Mixer
# volti - control audio volume from system tray/notification area
echo $TOTDATE
ACTION="gstreamer"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install python-audioread autoradio baresip baresip-core baresip-ffmpeg baresip-gstreamer baresip-gtk baresip-x11 brasero gir1.2-clutter-gst-3.0 gstreamer1.0-clutter-3.0 libclutter-gst-3.0-0 libclutter-gst-3.0-dev libclutter-gst-3.0-doc gir1.2-coglgst-2.0 libcogl-gst20 gstreamer1.0-crystalhd fso-deviced-player-gstreamer gambas3-gb-media gnome-sushi gnome-twitch-player-backend-gstreamer-cairo gnome-twitch-player-backend-gstreamer-clutter gnome-twitch-player-backend-gstreamer-opengl gnome-video-effects gnome-video-effects-dev gnome-video-effects-frei0r goobox gstreamer1.0-fluendo-mp3 gstreamer1.0-libav gstreamer1.0-libav-dbg gir1.2-gst-plugins-bad-1.0 gstreamer1.0-plugins-bad gstreamer1.0-plugins-bad-dbg gstreamer1.0-plugins-bad-doc libgstreamer-plugins-bad1.0-0 libgstreamer-plugins-bad1.0-dev gir1.2-gst-plugins-base-1.0 gstreamer1.0-alsa gstreamer1.0-plugins-base gstreamer1.0-plugins-base-apps gstreamer1.0-plugins-base-dbg gstreamer1.0-plugins-base-doc gstreamer1.0-x libgstreamer-plugins-base1.0-0 libgstreamer-plugins-base1.0-dev gstreamer1.0-espeak gstreamer1.0-plugins-good gstreamer1.0-plugins-good-dbg gstreamer1.0-plugins-good-doc gstreamer1.0-pulseaudio gstreamer1.0-plugins-ugly gstreamer1.0-plugins-ugly-dbg gstreamer1.0-plugins-ugly-doc python-gst-1.0 python-gst-1.0-dbg python3-gst-1.0 python3-gst-1.0-dbg gir1.2-gst-rtsp-server-1.0 gstreamer1.0-rtsp gstreamer1.0-rtsp-dbg libgstrtspserver-1.0-0 libgstrtspserver-1.0-0-dbg libgstrtspserver-1.0-dev libgstrtspserver-1.0-doc gst123 ges1.0-tools gir1.2-ges-1.0 libges-1.0-0 libges-1.0-0-dbg libges-1.0-dev libges-1.0-doc gstreamer1.0-vaapi gstreamer1.0-vaapi-doc gir1.2-gstreamer-1.0 gstreamer1.0-doc gstreamer1.0-tools libgstreamer1.0-0 libgstreamer1.0-0-dbg libgstreamer1.0-dev libgstreamermm-1.0-1 libgstreamermm-1.0-dev libgstreamermm-1.0-doc libcanberra-gstreamer gir1.2-nice-0.1 gstreamer1.0-nice libnice-dbg libnice-dev libnice-doc libnice10 gstreamer-qapt gstreamer0.10-qapt libreoffice libreoffice-avmedia-backend-gstreamer liquidsoap-plugin-gstreamer lua-lgi lua-lgi-dbg mkchromecast-gstreamer libgstreamer-ocaml libgstreamer-ocaml-dev gstreamer1.0-packagekit parole parole-dev phonon-backend-gstreamer phonon-backend-gstreamer-common phonon4qt5-backend-gstreamer pitivi playitslowly gstreamer1.0-pocketsphinx pulseaudio libqt5glib-2.0-0 libqt5gstreamer-1.0-0 libqt5gstreamer-dev libqt5gstreamerquick-1.0-0 libqt5gstreamerui-1.0-0 libqt5gstreamerutils-1.0-0 libqtglib-2.0-0 libqtgstreamer-1.0-0 libqtgstreamer-dev libqtgstreamerui-1.0-0 libqtgstreamerutils-1.0-0 qml-module qtgstreamer qt5gstreamer-dbg qtgstreamer-dbg qtgstreamer-declarative qtgstreamer-doc qtgstreamer-plugins qtgstreamer-plugins-qt5 libqgsttools-p1 libqt5multimedia5-plugins roarplaylistd-codechelper-gst ruby-gstreamer librygel-renderer-gst-2.6-2 rygel rygel-gst-launch rygel-playbin sound-juicer soundconverter subtitlecomposer subtitleeditor tap-plugins tap-plugins-doc libtelepathy-qt4-farstream2 libtelepathy-qt5-farstream0 totem transmageddon vim-syntax-gtk vlevel voctomix volti 2>&1 | tee -a logfile.log
log_error;

#
# handbrake
#
# handbrake - versatile DVD ripper and video transcoder (GTK+ GUI)
# handbrake-cli - versatile DVD ripper and video transcoder (command line)
echo $TOTDATE
ACTION="handbrake"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install handbrake handbrake-cli 2>&1 | tee -a logfile.log
log_error;

#
# holap
#
# Unavailable
echo $TOTDATE
ACTION="holap"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# hydrogen
#
# abx - audio ABX testing software
# gjacktransport - access to the JACK's transport mechanism as touchable slider
# golang-github-hydrogen18-stalecucumber-dev - Reader and writer for Python's pickle format in Golang
# golang-github-hydrogen18-stoppablelistener-dev - stoppable TCP listener in Go
# hydrogen - advanced drum machine/step sequencer
# hydrogen-data - advanced drum machine/step sequencer (data)
# hydrogen-doc - advanced drum machine/step sequencer (doc)
# hydrogen-drumkits - drumkits for Hydrogen
# hydrogen-drumkits-effects - effect drumkits for Hydrogen
# libchemistry-openbabel-perl - Chemical toolbox library (perl bindings)
# libopenbabel-dev - Chemical toolbox library (development files)
# libopenbabel-doc - Chemical toolbox library (documentation)
# libopenbabel4v5 - Chemical toolbox library
# openbabel - Chemical toolbox utilities (cli)
# openbabel-dbg - Chemical toolbox library (debugging symbols)
# openbabel-gui - Chemical toolbox utilities (graphical user interface)
# python-openbabel - Chemical toolbox library (python bindings)
# pdb2pqr - Preparation of protein structures for electrostatics calculations
# xmakemol - program for visualizing atomic and molecular systems
# xmakemol-gl - program for visualizing atomic and molecular systems (OpenGL)
echo $TOTDATE
ACTION="hydrogen"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install abx gjacktransport golang-github-hydrogen18-stalecucumber-dev golang-github-hydrogen18-stoppablelistener-dev hydrogen hydrogen-data hydrogen-doc hydrogen-drumkits hydrogen-drumkits-effects libchemistry-openbabel-perl libopenbabel-dev libopenbabel-doc libopenbabel4v5 openbabel openbabel-dbg openbabel-gui python-openbabel pdb2pqr xmakemol xmakemol-gl 2>&1 | tee -a logfile.log
log_error;

#
# ingen
#
# Unavailable
echo $TOTDATE
ACTION="ingen"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# jack
#
# a2jmidid - Daemon for exposing legacy ALSA MIDI in JACK MIDI systems
# aj-snapshot - make snapshots of JACK connections
# libasound2-plugins - ALSA library additional plugins
# alsa-tools-gui - GUI based ALSA utilities for specific hardware
# alsaplayer-jack - alsaplayer output module for JACK
# ams - Realtime modular synthesizer for ALSA
# apf-firewall - easy iptables based firewall system
# ardour - the digital audio workstation
# asterisk - Open Source Private Branch Exchange (PBX)
# baresip - portable and modular SIP user-agent - metapackage
# baresip-core - portable and modular SIP user-agent - core parts
# baresip-ffmpeg - portable and modular SIP user-agent - FFmpeg codecs and formats
# baresip-gstreamer - portable and modular SIP user-agent - GStreamer pipelines
# baresip-gtk - portable and modular SIP user-agent - GTK+ front-end
# baresip-x11 - portable and modular SIP user-agent - X11 features
# python-beaker - cache and session library
# python3-beaker - cache and session library for Python 3
# bitmeter - diagnosis tool for JACK audio software
# calf-plugins - Calf Studiogear - audio effects and sound generators
# multimedia-jack - JACK (Jack Audio Connection Kit) and ALSA related packages
# din - digital audio synthesizer
# drumkv1 - old-school drum-kit sampler - standalone
# drumkv1-common - old-school drum-kit sampler - common files
# drumkv1-lv2 - old-school drum-kit sampler - lv2-plugin
# dssi-host-jack - Example of DSSI host
# ebumeter - Loudness measurement according to EBU-R128
# ebumeter-doc - Loudness measurement EBU-R128 - documentation
# faust - functional programming language for realtime audio applications
# faust-common - functional programming language for realtime audio applications - common files
# foo-yc20 - YC-20 organ emulation
# fortunes-it - Data files containing Italian fortune cookies
# freecontact - fast protein contact predictor
# libfreecontact-dev - fast protein contact predictor library - development files
# libfreecontact-doc - documentation for libfreecontact
# libfreecontact0-dbg - debugging symbols for libfreecontact
# libfreecontact0v5 - fast protein contact predictor library
# freewheeling - live looping musical instrument
# ghostess - A graphical DSSI plugin host
# gjacktransport - access to the JACK's transport mechanism as touchable slider
# gmidimonitor - GTK+ application that shows MIDI events
# golang-github-elazarl-goproxy-dev - HTTP proxy library for Go
# golang-github-jackpal-gateway-dev - library for discovering the address of a LAN gateway
# golang-github-natefinch-lumberjack-dev - Go package for writing logs to rolling files
# golang-gopkg-natefinch-lumberjack.v2-dev - Go package for writing logs to rolling files
# gtklick - simple metronome GUI for JACK
# guitarix - Rock guitar amplifier for Jack
# guitarix-common - Guitarix - Common files
# guitarix-doc - Guitarix - Development documentation
# guitarix-ladspa - Guitarix - ladspa plugins
# guitarix-lv2 - Guitarix - LV2 plugins
# gxw-glade - Guitarix - GTK+ library Glade support
# libgxw-dev - Guitarix - GTK+ library (development files)
# libgxw0 - Guitarix - GTK+ library
# libgxwmm-dev - Guitarix - GTK+ C++ widget library (development files)
# libgxwmm0 - Guitarix - GTK+ C++ widget library
# gxtuner - Tuner for Jack
# horgand - JACK capable organ softsynth
# horgand-data - JACK capable organ softsynth (data files)
# hydrogen - advanced drum machine/step sequencer
# idjc - graphical shoutcast/icecast client
# jaaa - audio signal generator and spectrum analyser
# jack - Rip and encode CDs with one command
# jackd1 - JACK Audio Connection Kit (server and example clients)
# jackd1-firewire - JACK Audio Connection Kit (FFADO backend)
# libjack-dev - JACK Audio Connection Kit (development files)
# libjack0 - JACK Audio Connection Kit (libraries)
# jack-capture - program for recording soundfiles with jack
# jack-keyboard - Virtual MIDI keyboard for JACK MIDI
# jack-midi-clock - JACK client that sends MIDI beat clock pulses
# jack-mixer - JACK Audio Mixer
# jack-stdio - program to pipe audio-data from and to JACK
# jack-tools - various JACK tools: dl, record, scope, osc, plumbing, udp, play, transport
# jackd - JACK Audio Connection Kit (default server package)
# jackd2 - JACK Audio Connection Kit (server and example clients)
# jackd2-firewire - JACK Audio Connection Kit (FFADO and FreeBoB backends)
# libjack-jackd2-0 - JACK Audio Connection Kit (libraries)
# libjack-jackd2-dev - JACK Audio Connection Kit (development files)
# jackeq - routes and manipulates audio from/to multiple sources
# jackmeter - a basic command line meter for the JACK audio system
# libjackrabbit-java - content repository implementation (JCR API)
# libjackson2-annotations-java - fast and powerful JSON library for Java -- annotations
# libjackson2-annotations-java-doc - Documentation for Jackson-annotations
# libjackson2-core-java - fast and powerful JSON library for Java -- core library
# libjackson2-core-java-doc - Documentation for Jackson-core
# libjackson2-databind-java - fast and powerful JSON library for Java -- data binding
# libjackson2-databind-java-doc - Documentation for jackson-databind
# libjackson2-dataformat-cbor - Jackson data format module for RfC7049 Concise Binary Object Representation
# libjackson2-dataformat-cbor-doc - Documentation for jackson-dataformat-cbor
# libjackson2-dataformat-smile - fast and powerful JSON library for Java -- Smile dataformat
# libjackson2-dataformat-smile-doc - Documentation for Jackson-dataformat-smile
# libjackson2-dataformat-xml-java - fast and powerful JSON library for Java -- XML dataformat
# libjackson2-dataformat-xml-java-doc - Documentation for Jackson-dataformat-XML
# libjackson2-dataformat-yaml - fast and powerful JSON library for Java -- YAML dataformat
# libjackson2-dataformat-yaml-doc - Documentation for jackson-dataformat-yaml
# libjackson2-datatype-guava-java - Jackson support for JSON serialization of Guava collection types
# libjackson2-datatype-guava-java-doc - Documentation for Jackson serialisation of Guava collection types
# libjackson2-datatype-joda-java - fast and powerful JSON library for Java -- Joda datatypes
# libjackson2-datatype-joda-java-doc - Documentation for jackson-datatype-joda
# libjackson2-jaxrs-providers-java - Jackson JAX-RS providers
# libjackson2-module-jaxb-annotations-java - Fast and powerful JSON library for Java -- JAXB annotations
# jacksum - computes checksums, CRCs and message digests
# jacktrip - high-quality system for audio network performances
# jalv - tool to run LV2 plugins as stand-alone applications
# jamin - Audio mastering from a mixed down multitrack source with JACK
# japa - JACK and ALSA Perceptual Analyser
# jconvolver - Convolution reverb Engine for JACK
# jkmeter - horizontal or vertical bargraph audio level meter for Jack Audio Connection Kit
# jmeters - multichannel audio level meter
# jnoise - white and pink noise generator
# klick - advanced metronome for JACK
# kluppe - loop-player and recorder designed for live use
# laborejo - music notation workshop
# gladish - graphical interface for LADI Session Handler
# ladish - session management system for JACK applications
# ladish-dbg - Debugging symbols for ladish
# laditools - Linux Audio Desktop Integration Tools
# python-laditools - Python module to control and monitor the LADI system
# libambix-utils - AMBIsonics eXchange library (utilities)
# libaudio-ecasound-perl - Perl binding to the ecasound sampler, recorder, fx-processor
# libb-hooks-op-annotation-perl - module to allow annotation and delegation of hooked OPs
# libcrypto++-dev - General purpose cryptographic library - C++ development
# libcrypto++-doc - General purpose cryptographic library - documentation
# libcrypto++-utils - General purpose cryptographic library - utilities and data files
# libfreecontact-perl - fast protein contact predictor - binding for Perl
# libjackson-json-java - streaming fast powerful standard conformant json processor in java
# libjackson-json-java-doc - standard conformant json processor in java - API documentation
# liblist-maker-perl - Perl module to generate more sophisticated lists than just $a..$b
# libltcsmpte-dev - Development files for libltcsmpte
# libltcsmpte-doc - Documentation for libltcsmpte
# liblwp-protocol-psgi-perl - override LWP's HTTP/HTTPS backend with your own PSGI application
# libmoosex-has-options-perl - module for succinctly declaring options for Moose attributes
# liquidsoap-plugin-jack - audio streaming language -- JACK plugin
# meterbridge - Collection of Audio meters for the JACK audio server
# mhwaveedit - Simple and fast GTK2 sound editor
# mididings - MIDI router and processor based on Python
# mididings-doc - mididings Documentation
# python-mididings - MIDI routing library for Python
# midisnoop - MIDI monitor and prober
# mixxx - Digital Disc Jockey Interface
# mixxx-data - Digital Disc Jockey Interface -- data files
# mpg123 - MPEG layer 1/2/3 audio player
# libbjack-ocaml - OCaml blocking interface to jack audio connection kit
# libbjack-ocaml-dev - OCaml blocking interface to jack audio connection kit
# patchage - modular patch bay for Jack audio and Alsa Midi
# libifd-cyberjack6 - REINER SCT cyberJack USB chipcard reader user space driver
# pd-mediasettings - programmatically modify the audio and MIDI settings from within Pd
# petri-foo - MIDI controllable audio sampler - successor of specimen
# phasex - Phase Harmonic Advanced Synthesis EXperiment
# phasex-dbg - Debugging symbols for PHASEX
# playitslowly - Plays back audio files at a different speed or pitch
# pnmixer - Simple mixer application for system tray
# projectm-jack - projectM JackAudio module
# pulseaudio - PulseAudio sound server
# pulseaudio-module-jack - jackd modules for PulseAudio sound server
# python-freecontact - fast protein contact predictor - binding for Python
# python-fudge - Python 2 module for using fake objects for tests
# python-fudge-doc - Python module for using fake objects for tests, documentation package
# python3-fudge - Python 3 module for using fake objects for tests
# python-jack-client - JACK Audio Connection Kit (JACK) Client for Python
# python3-jack-client - JACK Audio Connection Kit (JACK) Client for Python 3
# qjackctl - User interface for controlling the JACK sound server
# qjackrcd - Qt4 application to record JACK server outputs
# qmidiarp - MIDI arpeggiator for ALSA
# qmmp - feature-rich audio player with support of many formats
# qsapecng - symbolic analyzer and solver of linear analog circuits
# qtractor - MIDI/Audio multi-track sequencer application
# radium-compressor - audio compressor for JACK
# rotter - JACK client for transmission recording and audio logging
# librtaudio-dev - C++ library for realtime audio input/ouput (development files)
# librtaudio5a - C++ library for realtime audio input/ouput
# librtmidi-dev - C++ library for realtime MIDI input/ouput (development files)
# librtmidi3 - C++ library for realtime MIDI input/ouput
# ruby-lumberjack - Lumberjack is a logging implementation in Ruby
# samplv1 - polyphonic sampler synthesizer - standalone
# samplv1-common - polyphonic sampler synthesizer - common files
# samplv1-lv2 - polyphonic sampler synthesizer - LV2 plugin
# showq - MIDI controllable audio player
# silentjack - silence detector for the JACK audio system
# simplescreenrecorder - Feature-rich screen recorder for X11 and OpenGL
# snd-gtk-jack - Sound file editor (GTK+ user interface - JACK)
# snd-nox - Sound file editor (cmdline)
# sndfile-tools - Collection of programs for operating on sound files
# sooperlooper - Looping Sampler
# sslstrip - SSL/TLS man-in-the-middle attack tool
# tetraproc - Tetrahedral Microphone Processor for Ambisonic Recording
# texlive-latex-extra - TeX Live: LaTeX additional packages
# timemachine - JACK audio recorder for spontaneous and conservatory use
# timidity - Software sound renderer (MIDI sequencer, MOD player)
# tinyeartrainer - A tool to learn recognizing musical intervals
# tuxguitar-jack - tuxguitar plugin for sound playback using JACKD
# twclock - World clock for ham radio operators
# vlc - multimedia player and streamer
# vlc-plugin-jack - Jack audio plugins for VLC
# vlevel - Levelling audio filter as command-line tool and LADSPA/JACK plugin
# xen-tools - Tools to manage Xen virtual servers
# xjadeo - Video player with JACK sync
# xmms2-plugin-jack - XMMS2 - JACK output
# xscreensaver-data-extra - Extra screen saver modules for screensaver frontends
# zam-plugins - Collection of LV2, LADSPA, LINUX-VST and JACK plugins
# zita-ajbridge - alsa to jack bridge
# zita-alsa-pcmi-utils - Two simple demo programs zita-alsa-pcmi library
# zita-at1 - JACK autotuner
# zita-lrx - Command line jack application providing crossover filters
# zita-mu1 - organise stereo monitoring for Jack Audio Connection Kit
# zita-njbridge - Jack clients to transmit multichannel audio over a local IP network
echo $TOTDATE
ACTION="jack"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install a2jmidid aj-snapshot libasound2-plugins alsa-tools-gui alsaplayer-jack ams apf-firewall ardour asterisk baresip baresip-core baresip-ffmpeg baresip-gstreamer baresip-gtk baresip-x11 python-beaker python3-beaker bitmeter calf-plugins multimedia-jack din drumkv1 drumkv1-common drumkv1-lv2 dssi-host-jack ebumeter ebumeter-doc faust faust-common foo-yc20 fortunes-it freecontact libfreecontact-dev libfreecontact-doc libfreecontact0-dbg libfreecontact0v5 freewheeling ghostess gjacktransport gmidimonitor golang-github-elazarl-goproxy-dev golang-github-jackpal-gateway-dev golang-github-natefinch-lumberjack-dev golang-gopkg-natefinch-lumberjack.v2-dev gtklick guitarix guitarix-common guitarix-doc guitarix-ladspa guitarix-lv2 gxw-glade libgxw-dev libgxw0 libgxwmm-dev libgxwmm0 gxtuner horgand horgand-data hydrogen idjc jaaa jack jackd1 jackd1-firewire libjack-dev libjack0 jack-capture jack-keyboard jack-midi-clock jack-mixer jack-stdio jack-tools jackd jackd2 jackd2-firewire libjack-jackd2-0 libjack-jackd2-dev jackeq jackmeter libjackrabbit-java libjackson2-annotations-java libjackson2-annotations-java-doc libjackson2-core-java libjackson2-core-java-doc libjackson2-databind-java libjackson2-databind-java-doc libjackson2-dataformat-cbor libjackson2-dataformat-cbor-doc libjackson2-dataformat-smile libjackson2-dataformat-smile-doc libjackson2-dataformat-xml-java libjackson2-dataformat-xml-java-doc libjackson2-dataformat-yaml libjackson2-dataformat-yaml-doc libjackson2-datatype-guava-java libjackson2-datatype-guava-java-doc libjackson2-datatype-joda-java libjackson2-datatype-joda-java-doc libjackson2-jaxrs-providers-java libjackson2-module-jaxb-annotations-java jacksum jacktrip jalv jamin japa jconvolver jkmeter jmeters jnoise klick kluppe laborejo gladish ladish ladish-dbg laditools python-laditools libambix-utils libaudio-ecasound-perl libb-hooks-op-annotation-perl libcrypto++-dev libcrypto++-doc libcrypto++-utils libfreecontact-perl libjackson-json-java libjackson-json-java-doc liblist-maker-perl libltcsmpte-dev libltcsmpte-doc liblwp-protocol-psgi-perl libmoosex-has-options-perl liquidsoap-plugin-jack meterbridge mhwaveedit mididings mididings-doc python-mididings midisnoop mixxx mixxx-data mpg123 libbjack-ocaml libbjack-ocaml-dev patchage libifd-cyberjack6 pd-mediasettings petri-foo phasex phasex-dbg playitslowly pnmixer projectm-jack pulseaudio pulseaudio-module-jack python-freecontact python-fudge python-fudge-doc python3-fudge python-jack-client python3-jack-client qjackctl qjackrcd qmidiarp qmmp qsapecng qtractor radium-compressor rotter librtaudio-dev librtaudio5a librtmidi-dev librtmidi3 ruby-lumberjack samplv1 samplv1-common samplv1-lv2 showq silentjack simplescreenrecorder snd-gtk-jack snd-nox sndfile-tools sooperlooper sslstrip tetraproc texlive-latex-extra timemachine timidity tinyeartrainer tuxguitar-jack twclock vlc vlc-plugin-jack vlevel xen-tools xjadeo xmms2-plugin-jack xscreensaver-data-extra zam-plugins zita-ajbridge zita-alsa-pcmi-utils zita-at1 zita-lrx zita-mu1 zita-njbridge 2>&1 | tee -a logfile.log
log_error;

#
# jack keyboard
#
# jack-keyboard - Virtual MIDI keyboard for JACK MIDI
echo $TOTDATE
ACTION="jackeyboard"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install jack-keyboard 2>&1 | tee -a logfile.log
log_error;

#
# jack-midi-clock
#
# jack-midi-clock - JACK client that sends MIDI beat clock pulses
echo $TOTDATE
ACTION="jack-midi-clock"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install jack-midi-cloc 2>&1 | tee -a logfile.log
log_error;

#
# jalv
#
# golang-github-dgrijalva-jwt-go-dev - Golang implementation of JSON Web Tokens (JWT)
# golang-github-dgrijalva-jwt-go-v3-dev - Golang implementation of JSON Web Tokens (JWT)
# jalv - tool to run LV2 plugins as stand-alone applications
# libjaba-client-java - minimal client for the JABAWS server
echo $TOTDATE
ACTION="jalv"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install golang-github-dgrijalva-jwt-go-dev golang-github-dgrijalva-jwt-go-v3-dev jalv libjaba-client-java 2>&1 | tee -a logfile.log
log_error;

#
# jukebox
#
# fookebox - web-based jukebox frontend to mpd
# gmusicbrowser - graphical jukebox for large music collections
# gnomad2 - Manage a Creative Labs Nomad Jukebox
# icecast2 - streaming media server
# jajuk - advanced jukebox and music organizer
# juk - music jukebox / music player
# kodi - Open Source Home Theatre (executable binaries)
# kodi-addons-dev - Open Source Home Theatre (Addons Dev package)
# kodi-bin - Open Source Home Theatre (architecture-dependent files)
# kodi-data - Open Source Home Theatre (arch-independent data package)
# kodi-eventclients-common - Open Source Home Theatre (Event Client Common package)
# kodi-eventclients-dev - Open Source Home Theatre (Event Client Dev package)
# kodi-eventclients-kodi-send - Open Source Home Theatre (Event Client Kodi-SEND package)
# kodi-eventclients-ps3 - Open Source Home Theatre (Event Client PS3 package)
# kodi-eventclients-wiiremote - Open Source Home Theatre (Event Client WII Remote support package)
# libaudio-moosic-perl - Moosic client library for Perl
# libcddb-perl - module to query CDDB and freedb servers
# libnjb-dev - Creative Labs Nomad Jukebox library development files
# libnjb-doc - Creative Labs Nomad Jukebox library documentation
# libnjb-tools - Creative Labs Nomad Jukebox library tools
# libnjb5 - Creative Labs Nomad Jukebox library
# mps-youtube - Terminal based YouTube jukebox with playlist management
# mtx - controls tape autochangers
# plait - command-line jukebox
# setcd - Control the behaviour of your cdrom device
# silverjuke - jukebox, karaoke, and kiosk mode mp3 player
# sugar-jukebox-activity - Sugar Learning Platform - music jukebox activity
echo $TOTDATE
ACTION="jukebox"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install fookebox gmusicbrowser gnomad2 icecast2 jajuk juk kodi kodi-addons-dev kodi-bin kodi-data kodi-eventclients-common kodi-eventclients-dev kodi-eventclients-kodi-send kodi-eventclients-ps3 kodi-eventclients-wiiremote libaudio-moosic-perl libcddb-perl libnjb-dev libnjb-doc libnjb-tools libnjb5 mps-youtube mtx plait setcd silverjuke sugar-jukebox-activity 2>&1 | tee -a logfile.log
log_error;

#
# k3b
#
# juk - music jukebox / music player
# k3b - Sophisticated CD/DVD burning application
# k3b-data - Sophisticated CD/DVD burning application - data files
# k3b-extrathemes - Sophisticated CD/DVD burning application - extra themes
# k3b-i18n - Sophisticated CD/DVD burning application - localizations files
# libk3b-dev - KDE CD/DVD burning application library - development files
# libk3b6 - KDE CD/DVD burning application library - runtime files
# libk3b6-extracodecs - KDE CD/DVD burning application library - extra decoders
echo $TOTDATE
ACTION="k3b"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install juk k3b k3b-data k3b-extrathemes k3b-i18n libk3b-dev libk3b6 libk3b6-extracodecs 2>&1 | tee -a logfile.log
log_error;

#
# kazam
#
# kazam - screencast and screenshot application created with design in mind
echo $TOTDATE
ACTION="kazam"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install kazam 2>&1 | tee -a logfile.log
log_error;

#
# kdenlive
#
# kdenlive - non-linear video editor
# kdenlive-data - non-linear video editor (data files)
# kdenlive-dbg - non-linear video editor (debugging symbols)
echo $TOTDATE
ACTION="kdenlive"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install kdenlive kdenlive-data kdenlive-dbg 2>&1 | tee -a logfile.log
log_error;

#
# kmidimon
#
# kmidimon - MIDI monitor using ALSA sequencer and KDE user interface
echo $TOTDATE
ACTION="handbrake"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install kmidimon 2>&1 | tee -a logfile.log
log_error;

#
# kodi
#
# kodi - Open Source Home Theatre (executable binaries)
# kodi-addons-dev - Open Source Home Theatre (Addons Dev package)
# kodi-bin - Open Source Home Theatre (architecture-dependent files)
# kodi-data - Open Source Home Theatre (arch-independent data package)
# kodi-eventclients-common - Open Source Home Theatre (Event Client Common package)
# kodi-eventclients-dev - Open Source Home Theatre (Event Client Dev package)
# kodi-eventclients-kodi-send - Open Source Home Theatre (Event Client Kodi-SEND package)
# kodi-eventclients-ps3 - Open Source Home Theatre (Event Client PS3 package)
# kodi-eventclients-wiiremote - Open Source Home Theatre (Event Client WII Remote support package)
# kodi-pvr-argustv - ARGUS TV PVR addon for Kodi
# kodi-pvr-dvbviewer - DVBViewer Kodi PVR Addon
# kodi-pvr-hdhomerun - HDHomeRun PVR Addon for Kodi
# kodi-pvr-hts - Kodi PVR Addon TvHeadend Hts
# kodi-pvr-iptvsimple - IPTV Simple Client Kodi PVR Addon
# kodi-pvr-mediaportal-tvserver - MediaPortal's TV-Server PVR addon for Kodi
# kodi-pvr-mythtv - MythTV PVR Addon for Kodi
# kodi-pvr-nextpvr - NextPVR PVR addon for Kodi
# kodi-pvr-njoy - NJOY PVR Addon for Kodi
# kodi-pvr-vdr-vnsi - Kodi PVR Addon VDR VNSI
# kodi-pvr-vuplus - Vu+/Enigma2 PVR Addon for Kodi
# kodi-pvr-wmc - WMC PVR Addon for Kodi
# kodi-visualization-spectrum - Spectrum visualizer addon for Kodi
# libkodiplatform-dev - Kodi platform support library -- development files
# libkodiplatform16 - Kodi platform support library
# vdr-plugin-vnsiserver - VDR plugin to provide PVR backend services for Kodi
# vdr-plugin-vnsiserver-dbg - VDR plugin to provide PVR backend services for Kodi
echo $TOTDATE
ACTION="kodi"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install kodi kodi-addons-dev kodi-bin
kodi-data kodi-eventclients-common kodi-eventclients-dev kodi-eventclients-kodi-send kodi-eventclients-ps3 kodi-eventclients-wiiremote kodi-pvr-argustv kodi-pvr-dvbviewer kodi-pvr-hdhomerun kodi-pvr-hts kodi-pvr-iptvsimple kodi-pvr-mediaportal-tvserver kodi-pvr-mythtv kodi-pvr-nextpvr kodi-pvr-njoy kodi-pvr-vdr-vnsi kodi-pvr-vuplus kodi-pvr-wmc kodi-visualization-spectrum libkodiplatform-dev libkodiplatform16 vdr-plugin-vnsiserver vdr-plugin-vnsiserver-dbg 2>&1 | tee -a logfile.log
log_error;

#
# ladspa
#
# libasound2-plugin-equal - equalizer plugin for ALSA
# amb-plugins - ambisonics LADSPA plugins
# ambdec - Ambisonic decoder for first and second order
# ams - Realtime modular synthesizer for ALSA
# ardour - the digital audio workstation
# autotalent - pitch correction LADSPA plugin
# blepvco - LADSPA, minBLEP-based, hard-sync-capable oscillator plugins
# blop - Bandlimited wavetable-based oscillator plugins for LADSPA hosts
# bs2b-ladspa - Bauer stereophonic-to-binaural DSP LADSPA plugin
# caps - C* Audio Plugin Suite
# cmt - LADSPA plugin collection
# csladspa - LADSPA plugin for Csound
# dssi-dev - Header file for compiling DSSI plugins and hosts
# dssi-example-plugins - Examples of DSSI plugin
# dssi-host-jack - Example of DSSI host
# dssi-utils - Command-line utilities for sending commands to DSSI plugins
# fil-plugins - parametric equalizer LADSPA plugin
# fomp - collection of LV2 audio plugins
# guitarix - Rock guitar amplifier for Jack
# guitarix-common - Guitarix - Common files
# guitarix-doc - Guitarix - Development documentation
# guitarix-ladspa - Guitarix - ladspa plugins
# guitarix-lv2 - Guitarix - LV2 plugins
# gxw-glade - Guitarix - GTK+ library Glade support
# libgxw-dev - Guitarix - GTK+ library (development files)
# libgxw0 - Guitarix - GTK+ library
# libgxwmm-dev - Guitarix - GTK+ C++ widget library (development files)
# libgxwmm0 - Guitarix - GTK+ C++ widget library
# invada-studio-plugins-ladspa - Invada Studio Plugins - a set of LADSPA audio plugins
# jackeq - routes and manipulates audio from/to multiple sources
# jamin - Audio mastering from a mixed down multitrack source with JACK
# ladspa-sdk - sample tools for linux-audio-dev plugin architecture
# libaudio-ecasound-perl - Perl binding to the ecasound sampler, recorder, fx-processor
# liblrdf0 - library to manipulate RDF files describing LADSPA plugins
# liquidsoap-plugin-ladspa - audio streaming language -- LADSPA plugin
# calf-ladspa - Linux Multimedia Studio - Calf LADSPA plugins
# lv2-dev - LV2 audio plugin specification
# lv2-examples - LV2 audio plugin specification (example plugins)
# lvtk-dev - LV2 C++ wrappers and utilities
# lvtk-doc - LV2 Toolkit documentation
# lvtk-examples - LV2 C++ wrappers and utilities - examples plugins
# lvtk-tools - LV2 C++ wrappers and utilities - tools
# mcp-plugins - LADSPA plugins designed for Alsa Modular Synth
# mda-lv2 - Paul Kellett's MDA plugins ported to LV2
# muse - Qt4-based audio/MIDI sequencer
# naspro-bridges - collection of bridges to LV2
# libladspa-ocaml - OCaml bindings for LADSPA -- runtime files
# libladspa-ocaml-dev - OCaml bindings for LADSPA -- development files
# omins - collection of LADSPA plugins aimed at modular synthesizers
# pd-bsaylor - library of FFT-based Pd objects by Ben Saylor
# pd-plugin - LADSPA and VST plug-in hosting for Pd
# qmmp - feature-rich audio player with support of many formats
# rev-plugins - reverb LADSPA plugin
# rubberband-ladspa - LADSPA plugin for audio pitch-shifting
# sox - Swiss army knife of sound processing
# ste-plugins - stereo LADSPA plugins
# ladspalist - List LADSPA plugins for use by LADSPA UGen
# sweep - Audio editor and live playback tool
# sweep-dev - Audio editor and live playback tool (development)
# swh-plugins - Steve Harris's LADSPA plugins
# tap-plugins - Tom's Audio Processing LADSPA plugins
# tap-plugins-doc - TAP-plugins documentation
# terminatorx - realtime audio synthesizer
# vco-plugins - LADSPA plugin sporting anti-aliased oscillators
# vlevel - Levelling audio filter as command-line tool and LADSPA/JACK plugin
# wah-plugins - auto-wah LADSPA plugin
# zam-plugins - Collection of LV2, LADSPA, LINUX-VST and JACK plugins
echo $TOTDATE
ACTION="ladspa"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install libasound2-plugin-equal amb-plugins ambdec ams ardour autotalent blepvco blop bs2b-ladspa caps cmt csladspa dssi-dev dssi-example-plugins dssi-host-jack dssi-utils fil-plugins fomp guitarix guitarix-common guitarix-doc guitarix-ladspa guitarix-lv2 gxw-glade libgxw-dev libgxw0 libgxwmm-dev libgxwmm0 invada-studio-plugins-ladspa jackeq jamin ladspa-sdk libaudio-ecasound-perl liblrdf0 liquidsoap-plugin-ladspa calf-ladspa lv2-dev lv2-examples lvtk-dev lvtk-doc lvtk-examples lvtk-tools mcp-plugins mda-lv2 muse naspro-bridges libladspa-ocaml libladspa-ocaml-dev omins pd-bsaylor pd-plugin qmmp rev-plugins rubberband-ladspa sox ste-plugins ladspalist sweep sweep-dev swh-plugins tap-plugins tap-plugins-doc terminatorx vco-plugins vlevel wah-plugins zam-plugins 2>&1 | tee -a logfile.log
log_error;

#
# linthesia
#
# Unavailable
echo $TOTDATE
ACTION="linthesia"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# linuxsampler
#
# gigedit - instrument editor for Gigasampler files
# liblscp-dev - Development files for LinuxSampler Control Protocol library
# liblscp-doc - Documentation for LinuxSampler Control Protocol library
# liblscp6 - LinuxSampler Control Protocol wrapper library
# qsampler - LinuxSampler GUI frontend based on the Qt toolkit
echo $TOTDATE
ACTION="linuxsampler"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log 
$APPS install gigedit liblscp-dev liblscp-doc liblscp6 qsampler 2>&1 | tee -a logfile.log
log_error;

#
# lmms
#
# lmms - Linux Multimedia Studio
# lmms-common - Linux Multimedia Studio - common files
# lmms-vst-server - Linux Multimedia Studio - VST server
echo $TOTDATE
ACTION="lmms"
echo "Subset: "$ACTION":" 
$APPS install lmms lmms-common lmms-vst-server 2>&1 | tee -a logfile.log
log_error;

#
# luppp
#
# Unavailable
echo $TOTDATE
ACTION="luppp"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# lv2
#
# abgate - LV2 noise gate plugin
# avw.lv2 - collection of Voltage Controlled LV2 modules
# calf-plugins - Calf Studiogear - audio effects and sound generators
# drumgizmo - Audio sampler plugin and stand-alone app that simulates a real drum kit
# drumkv1 - old-school drum-kit sampler - standalone
# drumkv1-common - old-school drum-kit sampler - common files
# drumkv1-lv2 - old-school drum-kit sampler - lv2-plugin
# eq10q - LV2 plugins bundle
# fomp - collection of LV2 audio plugins
# foo-yc20 - YC-20 organ emulation
# guitarix - Rock guitar amplifier for Jack
# guitarix-common - Guitarix - Common files
# guitarix-doc - Guitarix - Development documentation
# guitarix-ladspa - Guitarix - ladspa plugins
# guitarix-lv2 - Guitarix - LV2 plugins
# gxw-glade - Guitarix - GTK+ library Glade support
# libgxw-dev - Guitarix - GTK+ library (development files)
# libgxw0 - Guitarix - GTK+ library
# libgxwmm-dev - Guitarix - GTK+ C++ widget library (development files)
# libgxwmm0 - Guitarix - GTK+ C++ widget library
# invada-studio-plugins-lv2 - Invada Studio Plugins - a set of LV2 audio plugins
# ir.lv2 - LV2 IR reverb
# jalv - tool to run LV2 plugins as stand-alone applications
# libanyevent-yubico-perl - Perl module for validating YubiKey OTPs in AnyEvent applications
# liblilv-0-0 - library for simple use of LV2 plugins
# liblilv-dev - library for simple use of LV2 plugins (development files)
# lilv-utils - library for simple use of LV2 plugins (runtime files)
# lv2-dev - LV2 audio plugin specification
# lv2-examples - LV2 audio plugin specification (example plugins)
# libpaq-dev - library for parsing and querying RDF data (header files)
# libpaq0 - library for parsing and querying RDF data
# lv2-c++-tools - library and tools for LV2 plugins
# lv2-c++-tools-doc - lv2-c++-tools documentation
# liblv2dynparam1-dev - lv2dynparam is a LV2 plugin interface extension
# liblv2dynparamhost1-1 - LV2 plugin interface extension - host
# liblv2dynparamplugin1-0 - LV2 plugin interface extension - plugin
# lv2file - Command-line program to apply LV2 effects to audio files
# lv2proc - command line effect processor
# lv2vocoder - LV2 vocoder plugin
# lvtk-dev - LV2 C++ wrappers and utilities
# lvtk-doc - LV2 Toolkit documentation
# lvtk-examples - LV2 C++ wrappers and utilities - examples plugins
# lvtk-tools - LV2 C++ wrappers and utilities - tools
# mda-lv2 - Paul Kellett's MDA plugins ported to LV2
# mupen64plus-video-arachnoid - Arachnoid high-level graphics emulation for mupen64plus
# libnabrit-dbg - LV2 bridging helper library (debugging symbols)
# libnabrit-dev - LV2 bridging helper library (development files)
# libnabrit3 - LV2 bridging helper library
# naspro-bridges - collection of bridges to LV2
# libnacore-dev - NASPRO core library (development files)
# libnacore-doc - NASPRO core library (documentation)
# libnacore5 - NASPRO core library
# libns3-3v5 - shared libraries of ns-3
# libns3-dev - Static and header files of ns-3
# ns3 - discrete-event network simulator for Internet systems
# ns3-doc - documentation for ns3
# python-ns3 - Python binding of ns3
# libnss3 - Network Security Service libraries
# libnss3-dbg - Debugging symbols for the Network Security Service libraries
# libnss3-dev - Development files for the Network Security Service libraries
# qtractor - MIDI/Audio multi-track sequencer application
# libreadline-gplv2-dev - GNU readline and history libraries, development files
# samplv1 - polyphonic sampler synthesizer - standalone
# samplv1-common - polyphonic sampler synthesizer - common files
# samplv1-lv2 - polyphonic sampler synthesizer - LV2 plugin
# libserd-0-0 - lightweight RDF syntax library
# setbfree - DSP tonewheel organ
# sigrok-firmware-fx2lafw - Firmware for Cypress FX2(LP) based logic analyzers
# so-synth-lv2 - Set of synthesizers for the LV2 plugin format
# libsratom-0-0 - library for serialising LV2 atoms to/from Turtle
# libsratom-dev - library for serialising LV2 atoms to/from Turtle - development files
# libsratom-doc - library for serialising LV2 atoms to/from Turtle - documentation
# libsuil-0-0 - library for loading and wrapping LV2 plugin UIs
# swh-lv2 - Steve Harris's SWH plugins ported to LV2
# synthv1-common - old-school polyphonic synthesizer - common files
# synthv1-lv2 - old-school polyphonic synthesizer - LV2 plugin
# vocproc - LV2 plugin for pitch shifting and vocoding
# x42-plugins - Collection of LV2 plugins
# zam-plugins - Collection of LV2, LADSPA, LINUX-VST and JACK plugins
# zynadd - ZynAddSubFX engines converted to LV2 plugin format
echo $TOTDATE
ACTION="lv2"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install abgate avw.lv2 calf-plugins drumgizmo drumkv1 drumkv1-common drumkv1-lv2 eq10q fomp foo-yc20 guitarix guitarix-common guitarix-doc guitarix-ladspa guitarix-lv2 gxw-glade libgxw-dev libgxw0 libgxwmm-dev libgxwmm0 invada-studio-plugins-lv2 ir.lv2 jalv libanyevent-yubico-perl liblilv-0-0 liblilv-dev lilv-utils lv2-dev lv2-examples libpaq-dev libpaq0 lv2-c++-tools lv2-c++-tools-doc liblv2dynparam1-dev liblv2dynparamhost1-1 liblv2dynparamplugin1-0 lv2file lv2proc lv2vocoder lvtk-dev lvtk-doc lvtk-examples lvtk-tools mda-lv2 mupen64plus-video-arachnoid libnabrit-dbg libnabrit-dev libnabrit3 naspro-bridges libnacore-dev libnacore-doc libnacore5 libns3-3v5 libns3-dev ns3 ns3-doc python-ns3 libnss3 libnss3-dbg libnss3-dev qtractor libreadline-gplv2-dev samplv1 samplv1-common samplv1-lv2 libserd-0-0 setbfree sigrok-firmware-fx2lafw so-synth-lv2 libsratom-0-0 libsratom-dev libsratom-doc libsuil-0-0 swh-lv2 synthv1-common synthv1-lv2 vocproc x42-plugins zam-plugins zynadd 2>&1 | tee -a logfile.log
log_error;

#
# mda
#
# mda-lv2 - Paul Kellett's MDA plugins ported to LV2
echo $TOTDATE
ACTION="mda"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install mda-lv2 2>&1 | tee -a logfile.log
log_error;

#
# midi
#
# a2jmidid - Daemon for exposing legacy ALSA MIDI in JACK MIDI systems
# abcmidi - converter from ABC to MIDI format and back
# aconnectgui - graphical ALSA sequencer connection manager
# aeolus - Synthesised pipe organ emulator
# aj-snapshot - make snapshots of JACK connections
# alsa-utils - Utilities for configuring and using ALSA
# ams - Realtime modular synthesizer for ALSA
# amsynth - two oscillator software synthesizer
# ardour - the digital audio workstation
# aseqjoy - Joystick to ALSA MIDI Sequencer Converter
# bristol - vintage synthesizer emulator
# bristol-data - vintage synthesizer emulator (data files)
# calf-plugins - Calf Studiogear - audio effects and sound generators
# multimedia-looping - Packages for looping music and audio
# multimedia-midi - MIDI related packages
# digitemp - read temperature sensors in a 1-Wire net
# din - digital audio synthesizer
# drumgizmo - Audio sampler plugin and stand-alone app that simulates a real drum kit
# drumkv1 - old-school drum-kit sampler - standalone
# drumkv1-common - old-school drum-kit sampler - common files
# drumkv1-lv2 - old-school drum-kit sampler - lv2-plugin
# dssi-host-jack - Example of DSSI host
# ecasound - multitrack-capable audio recorder and effect processor
# ecasound-doc - documentation files for Ecasound
# ecasound-el - multitrack-capable audio recorder and effect processor (emacs)
# ecatools - multitrack-capable audio recorder and effect processor (tools)
# libecasoundc-dev - multitrack-capable audio recorder and effect processor (C dev library)
# libecasoundc1v5 - multitrack-capable audio recorder and effect processor (C library)
# python-ecasound - multitrack-capable audio recorder and effect processor (Python bindings)
# ruby-ecasound - multitrack-capable audio recorder and effect processor (ruby bindings)
# fluid-soundfont-gm - Fluid (R3) General MIDI SoundFont (GM)
# fluid-soundfont-gs - Fluid (R3) General MIDI SoundFont (GS)
# fluidsynth - Real-time MIDI software synthesizer
# libfluidsynth-dev - Real-time MIDI software synthesizer (development files)
# libfluidsynth1 - Real-time MIDI software synthesizer (runtime library)
# foo-yc20 - YC-20 organ emulation
# freepats - Free patch set for MIDI audio synthesis
# freewheeling - live looping musical instrument
# frescobaldi - LilyPond sheet music text editor
# ghostess - A graphical DSSI plugin host
# giada - Hardcore Loop Machine
# gimp - GNU Image Manipulation Program
# gkrellweather - A weather monitor plugin for GKrellM
# gmidimonitor - GTK+ application that shows MIDI events
# gmorgan - MIDI rhythm station emulator software
# gramophone2 - GRAMophone II is an algorithmic music generator
# python-hachoir-metadata - Program to extract metadata using Hachoir library
# hexter - Yamaha DX7 modeling DSSI plugin
# hydrogen - advanced drum machine/step sequencer
# jack-keyboard - Virtual MIDI keyboard for JACK MIDI
# jack-midi-clock - JACK client that sends MIDI beat clock pulses
# jack-mixer - JACK Audio Mixer
# jfugue - Java API for music programming - transitional package
# libjfugue-java - Java API for music programming
# kmetronome - ALSA MIDI Metronome
# kmidimon - MIDI monitor using ALSA sequencer and KDE user interface
# laborejo - music notation workshop
# ladish - session management system for JACK applications
# laditools - Linux Audio Desktop Integration Tools
# drumstick-tools - Qt4/C++ wrapper for ALSA Sequencer - utilities
# libdrumstick-dev - Qt4/C++ wrapper for ALSA Sequencer - development files
# libdrumstick0 - Qt4/C++ wrapper for ALSA Sequencer
# libdssialsacompat-dev - DSSI ALSA compatibility library (development files)
# libdssialsacompat0 - DSSI ALSA compatibility library for non-Linux platforms
# libinstpatch-1.0-0 - MIDI instrument editing library
# libinstpatch-dev - MIDI instrument editing library development files
# libinstpatch-doc - MIDI instrument editing library documentation
# libmidi-perl - module to read, compose, modify, and write MIDI files in Perl
# libsdl2-mixer-2.0-0 - Mixer library for Simple DirectMedia Layer 2, libraries
# libsdl2-mixer-dbg - Mixer library for Simple DirectMedia Layer 2, debugging
# libsdl2-mixer-dev - Mixer library for Simple DirectMedia Layer 2, development files
# smf-utils - Utilities to support the smf library
# smitools - various tools operating on MIB module files
# lmms - Linux Multimedia Studio
# lmms-common - Linux Multimedia Studio - common files
# midge - A text to MIDI program
# midicsv - translate MIDI file to CSV
# mididings - MIDI router and processor based on Python
# mididings-doc - mididings Documentation
# python-mididings - MIDI routing library for Python
# midish - shell-like MIDI sequencer/filter
# midisnoop - MIDI monitor and prober
# mixxx - Digital Disc Jockey Interface
# mixxx-data - Digital Disc Jockey Interface -- data files
# mma - Musical MIDI Accompaniment Generator
# moosic - Daemon/client combo to easily queue music files for playing
# muse - Qt4-based audio/MIDI sequencer
# musescore - Free music composition and notation software
# musescore-common - Free music composition and notation software (common files)
# libnabrit3 - LV2 bridging helper library
# naspro-bridges - collection of bridges to LV2
# libnacore5 - NASPRO core library
# nted - Musical score editor
# openhpi-plugin-ipmidirect - OpenHPI plugin module for direct IPMI over LAN (RMCP) or SMI
# opl3-soundfont - OPL3 SoundFont that simulates the sound of an OPL3 chip
# patchage - modular patch bay for Jack audio and Alsa Midi
# pd-jmmmp - a collection of Pd GUI objects for musical performance
# pd-kollabs - data management and state saving for Pure Data
# pd-mediasettings - programmatically modify the audio and MIDI settings from within Pd
# pd-mrpeach - bag of tricks for Pure Data (Pd)
# petri-foo - MIDI controllable audio sampler - successor of specimen
# phasex - Phase Harmonic Advanced Synthesis EXperiment
# phasex-dbg - Debugging symbols for PHASEX
# pianobooster - learn the piano just by playing a game
# playmidi - MIDI player
# pmidi - command line midi player for ALSA
# pmw - Philip's Music Writer
# libportmidi-dev - library for real-time MIDI input/output
# libportmidi0 - library for real-time MIDI input/output
# libportsmf-dev - Portable Standard Midi File Library (development files)
# libportsmf0 - Portable Standard Midi File Library
# pykaraoke - free CDG/MIDI/MPEG karaoke player
# pykaraoke-bin - free CDG/MIDI/MPEG karaoke player
# python-pykaraoke - free CDG/MIDI/MPEG karaoke player
# python-jack-client - JACK Audio Connection Kit (JACK) Client for Python
# python3-jack-client - JACK Audio Connection Kit (JACK) Client for Python 3
# python-messaging - SMS/MMS encoder/decoder
# python-midiutil - Python 2 library to write multi-track MIDI files
# python3-midiutil - Python 3 library to write multi-track MIDI files
# python-mido - Python module for working with MIDI messages and ports
# python3-mido - Python 3 module for working with MIDI messages and ports
# python-pyknon - Simple Python music library
# python-pyo - Python module written in C to help digital signal processing script creation
# python3-pyo - Python3 module written in C to help digital signal processing script creation
# python-pypm - Python interface to libportmidi
# qmidiarp - MIDI arpeggiator for ALSA
# qmidinet - MIDI Network Gateway via UDP/IP Multicast
# qmidiroute - MIDI event router and filter
# qmmp - feature-rich audio player with support of many formats
# qsynth - fluidsynth MIDI sound synthesiser front-end
# qtractor - MIDI/Audio multi-track sequencer application
# qxgedit - MIDI System Exclusive files editor
# rakarrack - Simple and easy guitar effects processor for GNU/Linux
# libroar-dev - header files and documentation for the RoarAudio libraries
# libroar2 - foundation libraries for the RoarAudio sound server and clients
# roaraudio-dbg - RoarAudio sound server for audio mixing (debugging symbols)
# rosegarden - music editor and MIDI/audio sequencer
# librtmidi-dev - C++ library for realtime MIDI input/ouput (development files)
# librtmidi3 - C++ library for realtime MIDI input/ouput
# rumor - Realtime MIDI keyboard to Lilypond converter
# libsdl-mixer1.2 - Mixer library for Simple DirectMedia Layer 1.2, libraries
# libsdl-mixer1.2-dbg - Mixer library for Simple DirectMedia Layer 1.2, debugging
# libsdl-mixer1.2-dev - Mixer library for Simple DirectMedia Layer 1.2, development files
# setbfree - DSP tonewheel organ
# sfront - MPEG 4 Structured Audio decoder
# showq - MIDI controllable audio player
# libsndio-dev - Small audio and MIDI framework from OpenBSD, development files
# libsndio6.1 - Small audio and MIDI framework from OpenBSD, runtime libraries
# sndio-tools - Small audio and MIDI framework from OpenBSD, basic tools
# sndiod - Small audio and MIDI framework from OpenBSD, sound server
# sooperlooper - Looping Sampler
# libswami-dev - MIDI instrument editor - development files
# libswami0 - MIDI instrument editor - shared libraries
# swami - MIDI instrument editor application
# timidity - Software sound renderer (MIDI sequencer, MOD player)
# timidity-daemon - runs TiMidity++ as a system-wide MIDI sequencer
# timidity-el - Emacs front end to Timidity++
# timidity-interfaces-extra - TiMidity++ extra user interfaces
# tk707 - drum sequencer for a sound card or MIDI device
# libtse3-0.3.1c2a - portable MIDI sequencer engine in C++ - development files
# libtse3-dev - portable MIDI sequencer engine in C++ - development files
# tse3play - MIDI/TSE3MDL player/converter
# tuxguitar - Multitrack guitar tablature editor and player (gp3 to gp5)
# tuxguitar-alsa - tuxguitar plugin for sound playback using ALSA
# tuxguitar-fluidsynth - tuxguitar plugin for sound playback using fluidsynth
# tuxguitar-jack - tuxguitar plugin for sound playback using JACKD
# tuxguitar-oss - tuxguitar plugin for sound playback using OSS
# vkeybd - Virtual MIDI Keyboard
# vlc-plugin-fluidsynth - FluidSynth plugin for VLC
# vmpk - Virtual MIDI Piano Keyboard
# wah-plugins - auto-wah LADSPA plugin
# libwildmidi-config - software MIDI player configuration
# libwildmidi-dev - software MIDI player library headers
# libwildmidi2 - software MIDI player library
# wildmidi - software MIDI player
# wmfrog - dockapp for graphically indicating the weather
# x42-plugins - Collection of LV2 plugins
# xfce4-weather-plugin - weather information plugin for the Xfce4 panel
# xjadeo - Video player with JACK sync
# zita-at1 - JACK autotuner
echo $TOTDATE
ACTION="midi"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install a2jmidid abcmidi aconnectgui aeolus aj-snapshot alsa-utils ams amsynth ardour aseqjoy bristol bristol-data calf-plugins multimedia-looping multimedia-midi digitemp din drumgizmo drumkv1 drumkv1-common drumkv1-lv2 dssi-host-jack ecasound ecasound-doc ecasound-el ecatools libecasoundc-dev libecasoundc1v5 python-ecasound ruby-ecasound fluid-soundfont-gm fluid-soundfont-gs fluidsynth libfluidsynth-dev libfluidsynth1 foo-yc20 freepats freewheeling frescobaldi ghostess giada gimp gkrellweather gmidimonitor gmorgan gramophone2 python-hachoir-metadata hexter hydrogen jack-keyboard jack-midi-clock jack-mixer jfugue libjfugue-java kmetronome kmidimon laborejo ladish laditools drumstick-tools libdrumstick-dev libdrumstick0 libdssialsacompat-dev libdssialsacompat0 libinstpatch-1.0-0 libinstpatch-dev libinstpatch-doc libmidi-perl libsdl2-mixer-2.0-0 libsdl2-mixer-dbg libsdl2-mixer-dev smf-utils smitools lmms lmms-common midge midicsv mididings mididings-doc python-mididings midish midisnoop mixxx mixxx-data mma moosic muse musescore musescore-common libnabrit3 naspro-bridges libnacore5 nted openhpi-plugin-ipmidirect opl3-soundfont patchage pd-jmmmp pd-kollabs pd-mediasettings pd-mrpeach petri-foo phasex phasex-dbg pianobooster playmidi pmidi pmw libportmidi-dev libportmidi0 libportsmf-dev libportsmf0 pykaraoke pykaraoke-bin python-pykaraoke python-jack-client python3-jack-client python-messaging python-midiutil python3-midiutil python-mido python3-mido python-pyknon python-pyo python3-pyo python-pypm qmidiarp qmidinet qmidiroute qmmp qsynth qtractor qxgedit rakarrack libroar-dev libroar2 roaraudio-dbg rosegarden librtmidi-dev librtmidi3 rumor libsdl-mixer1.2 libsdl-mixer1.2-dbg libsdl-mixer1.2-dev setbfree sfront showq libsndio-dev libsndio6.1 sndio-tools sndiod sooperlooper libswami-dev libswami0 swami timidity timidity-daemon timidity-el timidity-interfaces-extra tk707 libtse3-0.3.1c2a libtse3-dev tse3play tuxguitar tuxguitar-alsa tuxguitar-fluidsynth tuxguitar-jack tuxguitar-oss vkeybd vlc-plugin-fluidsynth vmpk wah-plugins libwildmidi-config libwildmidi-dev libwildmidi2 wildmidi wmfrog x42-plugins xfce4-weather-plugin xjadeo zita-at1 2>&1 | tee -a logfile.log
log_error;

#
# mixxx
#
# mixxx - Digital Disc Jockey Interface
# mixxx-data - Digital Disc Jockey Interface -- data files
echo $TOTDATE
ACTION="mixxx"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install mixxx mixxx-data 2>&1 | tee -a logfile.log
log_error;

#
# mp3
#
# abcde - A Better CD Encoder
# alsaplayer-common - audio player (common files)
# amarok - easy to use media player based on the KDE Platform
# ample - simple MP3 server easy to use
# libassimp3v5 - 3D model import library
# asterisk-mp3 - MP3 playback support for the Asterisk PBX
# asunder - graphical audio CD ripper and encoder
# audacious - small and fast audio player which supports lots of formats
# audacious-dev - audacious development files
# libaudcore3 - audacious core engine library
# libaudgui3 - audacious media player (libaudgui shared library)
# libaudqt0 - audacious media player (libaudqt shared library)
# libaudtag2 - audacious media player (libaudtag shared library)
# audacious-plugins - Base plugins for audacious
# audacity - fast, cross-platform audio editor
# audiolink - makes managing and searching for music easier
# btag - interactive command-line based multimedia tag editor
# burn - command-line tool for writing optical media
# cdcat - media catalog program
# cdlabelgen - generates front cards and tray cards for CDs and DVDs
# clamz - command-line program to download MP3's from Amazon
# clementine - modern music player and library organizer
# cmus - lightweight ncurses audio player
# cmus-plugin-ffmpeg - lightweight ncurses audio player (FFmpeg plugin)
# coccinella - Communication tool (XMPP/Jabber) with a built-in whiteboard
# cplay - A front-end for various audio players
# crip - terminal-based ripper/encoder/tagger tool
# cue2toc - converts CUE files to cdrdao's TOC format
# cynthiune.app - Music player for GNUstep
# darkice - Live audio streamer
# detox - replace problematic characters in filenames
# dir2ogg - audio file converter into ogg-vorbis format
# draai - Command-line music player for MPD
# easytag - GTK+ editor for audio file tags
# ebook2cw - convert ebooks to Morse MP3s/OGGs
# ebook2cwgui - GUI for ebook2cw
# entagged - graphical audio file tagger with freedb support
# eyed3 - Display and manipulate id3-tags on the command-line
# python-eyed3 - Python module for id3-tags manipulation
# ezquake - modern QuakeWorld client
# ezstream - easy media streaming client over icecast servers
# fadecut - toolset to rip audiostreams, cut, fade in/out and tag the resulting audiofiles
# fapg - Fast Audio Playlist Generator
# fatsort - utility for sorting FAT directory structures
# flac - Free Lossless Audio Codec - command line tools
# libflac++-dev - Free Lossless Audio Codec - C++ development library
# libflac++6v5 - Free Lossless Audio Codec - C++ runtime library
# libflac-dev - Free Lossless Audio Codec - C development library
# libflac-doc - Free Lossless Audio Codec - library documentation
# libflac8 - Free Lossless Audio Codec - runtime C library
# gjay - An automatic and learning DJ for audacious
# libgmp3-dev - Multiprecision arithmetic library developers tools
# gmusicbrowser - graphical jukebox for large music collections
# gnome-sound-recorder - simple and modern sound recorder for GNOME
# gpodder - podcast client and feed aggregator
# gstreamer1.0-fluendo-mp3 - Fluendo mp3 decoder GStreamer 1.0 plugin
# gst123 - GStreamer based command line media player
# python-hachoir-metadata - Program to extract metadata using Hachoir library
# icecast2 - streaming media server
# id3tool - Command line editor for id3 tags
# id3v2 - A command line id3v2 tag editor
# idjc - graphical shoutcast/icecast client
# imagination - DVD slide show maker
# irssi-scripts - collection of scripts for irssi
# jack - Rip and encode CDs with one command
# libjs-jquery-jplayer - HTML5 Audio & Video for jQuery with a Flash fallback
# jsymphonic - File manager for Sony's MP3 players
# libk3b6-extracodecs - KDE CD/DVD burning application library - extra decoders
# python-kaa-metadata - Media Metadata for Python
# kid3 - KDE audio tag editor
# kid3-cli - Command line audio tag editor
# kid3-core - Audio tag editor core libraries and data
# kid3-qt - Audio tag editor
# kradio4 - comfortable radio application for KDE
# lame - MP3 encoding library (frontend)
# lame-dbg - MP3 encoding library (debugging symbols)
# lame-doc - MP3 encoding library (documentation)
# libmp3lame-dev - MP3 encoding library (development)
# libmp3lame0 - MP3 encoding library
# libanydata-perl - simple tied hash interface for files and data structures
# libapache2-mod-musicindex - Browse, stream, download and search through MP3/Ogg/FLAC/MP4 files
# mod-musicindex-common - Common files for mod-musicindex
# libaudclient-dev - audacious D-Bus remote control library (development files)
# libaudclient2 - audacious D-Bus remote control library
# libaudio-file-perl - Perl audio file abstraction library
# libaudio-flac-decoder-perl - Perl module providing an object-oriented FLAC decoder
# libaudio-scan-perl - module for reading metadata from common audio file formats
# libaudiomask-dev - Audio masking threshold estimation lib headers, docs and examples
# libaudiomask1 - Audio masking threshold estimation library
# libcddb-perl - module to query CDDB and freedb servers
# extract - displays meta-data from files of arbitrary type
# libextractor3 - extracts meta-data from files of arbitrary type (library)
# libjaudiotagger-java - library for editing tags like ID3 in audio files such as MP3s
# libjlayer-java - library to decode, convert and play MP3 files
# libjlayer-java-doc - library to decode, convert and play MP3 files - documentation
# libmad0 - MPEG audio decoder library
# libmad0-dev - MPEG audio decoder development library
# libmediainfo-dev - library reading metadata from media files -- headers
# libmediainfo-doc - library for reading metadata from media files -- documentation
# libmediainfo0v5 - library for reading metadata from media files -- shared library
# python-mediainfodll - library for reading metadata from media files -- shared library
# python3-mediainfodll - library for reading metadata from media files -- shared library
# libmp3-info-perl - Perl MP3::Info - Manipulate / fetch info from MP3 audio files
# libmp3-tag-perl - Module for reading tags of MP3 audio files
# libmp3spi-java - interface to support MP3 (MPEG 1/2/2.5 Layer 1/2/3) audio format
# libmp3splt-dev - development files for libmp3splt0
# libmp3splt0 - library for splitting MP3 and Ogg Vorbis files
# libmp3splt0-flac - FLAC plugin for mp3splt
# libmp3splt0-mp3 - MP3 plugin for mp3splt
# libmp3splt0-ogg - Ogg Vorbis plugin for mp3splt
# libmp4-info-perl - Fetch info from MPEG-4 files
# libmpeg3-2 - MPEG streams decoding library
# libomxil-bellagio0-components-mad - MAD MP3 decoder components for Bellagio OpenMAX IL
# libsdl2-mixer-2.0-0 - Mixer library for Simple DirectMedia Layer 2, libraries
# libsdl2-mixer-dbg - Mixer library for Simple DirectMedia Layer 2, debugging
# libsdl2-mixer-dev - Mixer library for Simple DirectMedia Layer 2, development files
# libshout3 - MP3/Ogg Vorbis broadcast streaming library
# libshout3-dev - MP3/Ogg Vorbis broadcast streaming library (development)
# libpacketdump3 - network packet parsing and human-readable display library
# libpacketdump3-dev - development headers for the libpacketdump library
# liburi-title-perl - common interface to get the titles of things on the web
# liquidsoap-plugin-lame - audio streaming language -- Lame plugin
# liquidsoap-plugin-mad - audio streaming language -- Mad plugin
# liquidsoap-plugin-shine - audio streaming language -- Shine plugin
# lltag - Automatic command-line mp3/ogg/flac file tagger and renamer
# madplay - MPEG audio player in fixed point
# magicrescue - recover files by looking for magic bytes
# mat - Metadata anonymisation toolkit
# mediainfo - command-line utility for reading information from audio/video files
# mediainfo-gui - graphical utility for reading information from audio/video files
# mixxx - Digital Disc Jockey Interface
# mixxx-data - Digital Disc Jockey Interface -- data files
# mkchromecast - Cast your Linux audio to your Google Cast devices
# moc - ncurses based console audio player
# moosic - Daemon/client combo to easily queue music files for playing
# mp3blaster - Full-screen console mp3 and Ogg Vorbis player
# mp3burn - burn audio CDs directly from MP3, Ogg Vorbis, or FLAC files
# mp3cd - Burns normalized audio CDs from lists of MP3s/WAVs/Oggs/FLACs
# mp3check - tool to check mp3 files for consistency
# mp3diags - find issues in MP3 files and help to solve them
# mp3fs - FUSE filesystem for transcoding FLAC to MP3 on the fly
# mp3info - An MP3 technical info viewer and ID3 1.x tag editor
# mp3info-gtk - MP3 info viewer and ID3 1.x tag editor -- GTK+ version
# mp3rename - Rename mp3 files based on id3tags
# mp3report - Script to create an HTML report of MP3 files in a directory
# mp3roaster - Perl hack for burning audio CDs out of MP3/OGG/FLAC/WAV files
# mp3val - program for MPEG audio stream validation
# mp3wrap - Utility for MP3 wrapping (rolling multiple MP3s into one)
# mpc123 - command-line Musepack audio player
# mpd - Music Player Daemon
# libmpg123-0 - MPEG layer 1/2/3 audio decoder (shared library)
# libmpg123-dev - MPEG layer 1/2/3 audio decoder (development files)
# libout123-0 - MPEG layer 1/2/3 audio decoder (libout123 shared library)
# mpg123 - MPEG layer 1/2/3 audio player
# mpg123-el - front-end to mpg321/ogg321 media players for Emacs
# mpg321 - Simple and lightweight command line MP3 player
# mpgtx - toolbox to manipulate MPEG files (video, system, and audio)
# mencoder - MPlayer's Movie Encoder
# mupen64plus-rsp-hle - high-level rsp emulation for mupen64plus
# music123 - Command-line shell for sound-file players
# musiclibrarian - A simple GUI tool to organize collections of music
# mussort - simple tool that sorts a music collection
# pypy-mutagen - audio metadata editing library (PyPy)
# python-mutagen - audio metadata editing library
# python-mutagen-doc - audio metadata editing library - documentation
# python3-mutagen - audio metadata editing library (Python 3)
# ncdt - Display directory tree
# libsnmp30 - SNMP (Simple Network Management Protocol) library
# libsnmp30-dbg - SNMP (Simple Network Management Protocol) library debug
# normalize-audio - adjusts the volume of WAV, MP3 and OGG files to a standard volume level
# browser-plugin-vlc - multimedia plugin for web browsers based on VLC
# libxcomp3 - NX X compression library
# libxcomp3-dbg - nx-X11 compression library (debug package)
# libcry-ocaml-dev - MP3/Ogg Vorbis broadcast OCaml module
# libflac-ocaml - OCaml interface to the flac library -- runtime files
# libflac-ocaml-dev - OCaml interface to the flac library -- development files
# libmp3lame-ocaml - OCaml interface to the lame library -- runtime files
# libmp3lame-ocaml-dev - OCaml interface to the lame library -- developpement files
# libmad-ocaml - OCaml bindings for the MAD library (Runtime library)
# libmad-ocaml-dev - OCaml bindings for the MAD library (Development package)
# libshine-ocaml - OCaml interface to the shine library -- runtime files
# libshine-ocaml-dev - OCaml interface to the shine library -- developpement files
# libshout-ocaml - OCaml bindings for the shout library
# libshout-ocaml-dev - OCaml bindings for the shout library
# libagrep-ocaml - Wu-Manber algorithm for string searching with errors
# libagrep-ocaml-dev - Wu-Manber algorithm for string searching with errors
# libogmrip-dev - Application for ripping and encoding DVD - development files
# libogmrip1 - Application for ripping and encoding DVD - libraries files
# ogmrip - Application for ripping and encoding DVD
# ogmrip-doc - Application for ripping and encoding DVD - Documentation files
# oidua - audio file metadata lister
# libopenal1 - Software implementation of the OpenAL audio API (shared library)
# libosmcomp3 - InfiniBand subnet manager - component library
# pacpl - multi-purpose audio converter/ripper/tagger script
# paulstretch - Extreme sound time-stretch
# pd-iemlib - collection of general purpose objects and filters for Pure Data
# pd-unauthorized - library of Pd objects for streaming and GUI control
# phonon-backend-gstreamer - Phonon GStreamer 1.0 backend
# phonon-backend-gstreamer-common - Phonon GStreamer 1.0.x backend icons
# phonon4qt5-backend-gstreamer - Phonon Qt5 GStreamer 1.0 backend
# poc-streamer - MP3/Ogg multicast/HTTP streamer and MP3 cutting tool
# podracer - podcast aggregator/downloader
# psi4 - Quantum Chemical Program Suite
# puddletag - simple, powerful audio tag editor
# pulseaudio-dlna - Stream audio to DLNA devices and Chromecasts
# pykaraoke - free CDG/MIDI/MPEG karaoke player
# pykaraoke-bin - free CDG/MIDI/MPEG karaoke player
# python-pykaraoke - free CDG/MIDI/MPEG karaoke player
# python-pymad - Python wrapper to the MPEG Audio Decoder library (Python 2)
# python-pymad-dbg - Python wrapper to the MPEG Audio Decoder library (Python 2 debug)
# python3-pymad - Python wrapper to the MPEG Audio Decoder library (Python 3)
# python3-pymad-dbg - Python wrapper to the MPEG Audio Decoder library (Python 3 debug)
# python-pymtp - Pythonic binding to LibMTP to interact with MTP devices
# python-id3 - Python module for id3-tags manipulation
# qmmp - feature-rich audio player with support of many formats
# quelcom - Command line editing tools for MP3 and WAV files
# exfalso - audio tag editor for GTK+
# quodlibet - audio library manager and player for GTK3
# gir1.2-rb-3.0 - GObject introspection data for the rhythmbox music player
# librhythmbox-core10 - support library for the rhythmbox music player
# rhythmbox - music player and organizer for GNOME
# rhythmbox-data - data files for rhythmbox
# rhythmbox-dev - development files for the rhythmbox music player
# rhythmbox-doc - documentation files for the rhythmbox music player
# rhythmbox-plugin-cdrecorder - burning plugin for rhythmbox music player
# rhythmbox-plugins - plugins for rhythmbox music player
# rio - Command line Diamond Rio MP3 player controller
# ripit - Textbased audio CD ripper
# ripperx - GTK-based audio CD ripper/encoder
# ruby-mp3tag - Ruby library for manipulating ID3V1.1 tags in MP3
# libsdl-mixer1.2 - Mixer library for Simple DirectMedia Layer 1.2, libraries
# libsdl-mixer1.2-dbg - Mixer library for Simple DirectMedia Layer 1.2, debugging
# libsdl-mixer1.2-dev - Mixer library for Simple DirectMedia Layer 1.2, development files
# libsdl-sound1.2 - Sound library for Simple DirectMedia Layer 1.2, libraries
# libsdl-sound1.2-dev - Sound library for Simple DirectMedia Layer 1.2, development files
# libshine-dev - Fixed-point MP3 encoding library - development files
# libshine3 - Fixed-point MP3 encoding library - runtime files
# shineenc - Fixed-point MP3 encoding library - frontend binary
# silverjuke - jukebox, karaoke, and kiosk mode mp3 player
# libsmpeg-dev - SDL MPEG Player Library - development files
# libsmpeg0 - SDL MPEG Player Library - shared libraries
# smpeg-gtv - SMPEG GTK+ MPEG audio/video player
# smpeg-plaympeg - SMPEG command line MPEG audio/video player
# libsnack-alsa - Sound extension to Tcl/Tk and Python/Tkinter - ALSA files
# libsnack-oss - Sound extension to Tcl/Tk and Python/Tkinter - OSS files
# python-tksnack - Sound extension to Tcl/Tk and Python/Tkinter - Python 2.x library
# python3-tksnack - Sound extension to Tcl/Tk and Python/Tkinter - Python 3.x library
# tcl-snack - Sound extension to Tcl/Tk and Python/Tkinter - Tcl/Tk library
# tcl-snack-dev - Sound extension to Tcl/Tk and Python/Tkinter - development files
# tcl-snack-doc - Sound extension to Tcl/Tk and Python/Tkinter - documentation
# sound-juicer - GNOME CD Ripper
# soundconverter - GNOME application to convert audio files into other formats
# libsox-fmt-mp3 - SoX MP2 and MP3 format library
# sox - Swiss army knife of sound processing
# squeezelite - lightweight headless Squeezebox emulator - ALSA version
# squeezelite-pa - lightweight headless Squeezebox emulator - PortAudio version
# sweep - Audio editor and live playback tool
# sweep-dev - Audio editor and live playback tool (development)
# swish-e - Simple Web Indexing System for Humans - Enhanced
# taggrepper - search and match tags of audio files against regular expressions
# libtag1-dev - audio meta-data library - development files
# libtag1-doc - audio meta-data library - API documentation
# libtag1v5 - audio meta-data library
# libtag1v5-vanilla - audio meta-data library - vanilla flavour
# libtagc0 - audio meta-data library - C bindings
# libtagc0-dev - audio meta-data library - development files for C bindings
# python-tagpy - Python module for manipulating tags in music files
# tagtool - Tool to tag and rename MP3 and Ogg Vorbis files
# terminatorx - realtime audio synthesizer
# testdisk - Partition scanner and disk recovery tool, and PhotoRec file recovery tool
# texlive-metapost - TeX Live: MetaPost and Metafont packages
# libtwolame-dev - MPEG Audio Layer 2 encoder (development files)
# libtwolame0 - MPEG Audio Layer 2 encoding library
# twolame - MPEG Audio Layer 2 encoder (command line frontend)
# unmo3 - Uncompress and extract samples from MO3 modules
# vbrfix - corrects MP3 files that have incorrect VBR information
# vdr-plugin-mp3 - MP3 playback plugin for VDR
# libvlc-bin - tools for VLC's base library
# libvlc-dev - development files for libvlc
# libvlc5 - multimedia player and streamer library
# libvlccore-dev - development files for libvlccore
# libvlccore8 - base library for VLC and its modules
# vlc - multimedia player and streamer
# vlc-bin - binaries from VLC
# vlc-data - Common data for VLC
# vlc-l10n - Translations for VLC
# vlc-plugin-access-extra - multimedia player and streamer (extra access plugins)
# vlc-plugin-base - multimedia player and streamer (base plugins)
# vlc-plugin-fluidsynth - FluidSynth plugin for VLC
# vlc-plugin-jack - Jack audio plugins for VLC
# vlc-plugin-notify - LibNotify plugin for VLC
# vlc-plugin-qt - multimedia player and streamer (Qt plugin)
# vlc-plugin-samba - Samba plugin for VLC
# vlc-plugin-sdl - SDL video and audio output plugin for VLC
# vlc-plugin-skins2 - multimedia player and streamer (Skins2 plugin)
# vlc-plugin-svg - SVG plugin for VLC
# vlc-plugin-video-output - multimedia player and streamer (video output plugins)
# vlc-plugin-video-splitter - multimedia player and streamer (video splitter plugins)
# vlc-plugin-visualization - multimedia player and streamer (visualization plugins)
# vlc-plugin-zvbi - VBI teletext plugin for VLC
# vokoscreen - easy to use screencast creator
# xcfa - X Convert File Audio
# xcfa-dbg - X Convert File Audio - debugging symbols
# libxine2 - xine media player library – meta-package
# libxine2-all-plugins - xine video/media player library ‒ meta-package for all plugins
# libxine2-dev - xine video player library – development packages
# libxine2-doc - xine video player library – documentation files
# libxine2-plugins - xine video/media player library ‒ meta-package for commonly-used plugins
# xmms2 - Client/server based media player system
# xmms2-plugin-mad - XMMS2 - libmad based mp3 decoder
# xmms2-plugin-mpg123 - XMMS2 - libmpg123 based mp3 decoder
# xwax - open-source vinyl emulation software for Linux
# youtube-dl - downloader of videos from YouTube and other sites
echo $TOTDATE
ACTION="mp3"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install abcde alsaplayer-common amarok ample libassimp3v5 asterisk-mp3 asunder audacious audacious-dev libaudcore3 libaudgui3 libaudqt0 libaudtag2 audacious-plugins audacity audiolink btag burn cdcat cdlabelgen clamz clementine cmus cmus-plugin-ffmpeg coccinella cplay crip cue2toc cynthiune.app darkice detox dir2ogg draai easytag ebook2cw ebook2cwgui entagged eyed3 python-eyed3 ezquake ezstream fadecut fapg fatsort flac libflac++-dev libflac++6v5 libflac-dev libflac-doc libflac8 gjay libgmp3-dev gmusicbrowser gnome-sound-recorder gpodder gstreamer1.0-fluendo-mp3 gst123 python-hachoir-metadata icecast2 id3tool id3v2 idjc imagination irssi-scripts jack libjs-jquery-jplayer jsymphonic libk3b6-extracodecs python-kaa-metadata kid3 kid3-cli kid3-core kid3-qt kradio4 lame lame-dbg lame-doc libmp3lame-dev libmp3lame0 libanydata-perl libapache2-mod-musicindex mod-musicindex-common libaudclient-dev libaudclient2 libaudio-file-perl libaudio-flac-decoder-perl libaudio-scan-perl libaudiomask-dev libaudiomask1 libcddb-perl extract libextractor3 libjaudiotagger-java libjlayer-java libjlayer-java-doc libmad0 libmad0-dev libmediainfo-dev libmediainfo-doc libmediainfo0v5 python-mediainfodll python3-mediainfodll libmp3-info-perl libmp3-tag-perl libmp3spi-java libmp3splt-dev libmp3splt0 libmp3splt0-flac libmp3splt0-mp3 libmp3splt0-ogg libmp4-info-perl libmpeg3-2 libomxil-bellagio0-components-mad libsdl2-mixer-2.0-0 libsdl2-mixer-dbg libsdl2-mixer-dev libshout3 libshout3-dev libpacketdump3 libpacketdump3-dev liburi-title-perl liquidsoap-plugin-lame liquidsoap-plugin-mad liquidsoap-plugin-shine lltag madplay magicrescue mat mediainfo mediainfo-gui mixxx mixxx-data mkchromecast moc moosic mp3blaster mp3burn mp3cd mp3check mp3diags mp3fs mp3info mp3info-gtk mp3rename mp3report mp3roaster mp3val mp3wrap mpc123 mpd libmpg123-0 libmpg123-dev libout123-0 mpg123 mpg123-el mpg321 mpgtx mencoder mupen64plus-rsp-hle music123 musiclibrarian mussort pypy-mutagen python-mutagen python-mutagen-doc python3-mutagen ncdt libsnmp30 libsnmp30-dbg normalize-audio browser-plugin-vlc libxcomp3 libxcomp3-dbg libcry-ocaml-dev libflac-ocaml libflac-ocaml-dev libmp3lame-ocaml libmp3lame-ocaml-dev libmad-ocaml libmad-ocaml-dev libshine-ocaml libshine-ocaml-dev libshout-ocaml libshout-ocaml-dev libagrep-ocaml libagrep-ocaml-dev libogmrip-dev libogmrip1 ogmrip ogmrip-doc oidua libopenal1 libosmcomp3 pacpl paulstretch pd-iemlib pd-unauthorized phonon-backend-gstreamer phonon-backend-gstreamer-common phonon4qt5-backend-gstreamer poc-streamer podracer psi4 puddletag pulseaudio-dlna pykaraoke pykaraoke-bin python-pykaraoke python-pymad python-pymad-dbg python3-pymad python3-pymad-dbg python-pymtp python-id3 qmmp quelcom exfalso quodlibet gir1.2-rb-3.0 librhythmbox-core10 rhythmbox rhythmbox-data rhythmbox-dev rhythmbox-doc rhythmbox-plugin-cdrecorder rhythmbox-plugins rio ripit ripperx ruby-mp3tag libsdl-mixer1.2 libsdl-mixer1.2-dbg libsdl-mixer1.2-dev libsdl-sound1.2 libsdl-sound1.2-dev libshine-dev libshine3 shineenc silverjuke libsmpeg-dev libsmpeg0 smpeg-gtv smpeg-plaympeg libsnack-alsa libsnack-oss python-tksnack python3-tksnack tcl-snack tcl-snack-dev tcl-snack-doc sound-juicer soundconverter libsox-fmt-mp3 sox squeezelite squeezelite-pa sweep sweep-dev swish-e taggrepper libtag1-dev libtag1-doc libtag1v5 libtag1v5-vanilla libtagc0 libtagc0-dev python-tagpy tagtool terminatorx testdisk texlive-metapost libtwolame-dev libtwolame0 twolame unmo3 vbrfix vdr-plugin-mp3 libvlc-bin libvlc-dev libvlc5 libvlccore-dev libvlccore8 vlc vlc-bin vlc-data vlc-l10n vlc-plugin-access-extra vlc-plugin-base vlc-plugin-fluidsynth vlc-plugin-jack vlc-plugin-notify vlc-plugin-qt vlc-plugin-samba vlc-plugin-sdl vlc-plugin-skins2 vlc-plugin-svg vlc-plugin-video-output vlc-plugin-video-splitter vlc-plugin-visualization vlc-plugin-zvbi vokoscreen xcfa xcfa-dbg libxine2 libxine2-all-plugins libxine2-dev libxine2-doc libxine2-plugins xmms2 xmms2-plugin-mad xmms2-plugin-mpg123 xwax youtube-dl 2>&1 | tee -a logfile.log
log_error;

#
# mp4
#
# atomicparsley - read, parse and set metadata of MPEG-4 and 3gp files
# audex - Audio grabber tool for KDE
# easytag - GTK+ editor for audio file tags
# faad - freeware Advanced Audio Decoder player
# gpac - GPAC Project on Advanced Content - utilities
# libatomicparsley-dev - main library for atomic parsley in gtkpod, development kit
# libatomicparsley0 - main library for atomic parsley in gtkpod, shared library
# libjs-jquery-jplayer - HTML5 Audio & Video for jQuery with a Flash fallback
# kid3 - KDE audio tag editor
# kid3-cli - Command line audio tag editor
# kid3-core - Audio tag editor core libraries and data
# kid3-qt - Audio tag editor
# libapache2-mod-musicindex - Browse, stream, download and search through MP3/Ogg/FLAC/MP4 files
# libaudio-scan-perl - module for reading metadata from common audio file formats
# libjaudiotagger-java - library for editing tags like ID3 in audio files such as MP3s
# libmp4-info-perl - Fetch info from MPEG-4 files
# libwww-nicovideo-download-perl - Download FLV/MP4/SWF files from nicovideo.jp
# libxmp4 - module file rendering library
# moc-ffmpeg-plugin - ncurses based console audio player - ffmpeg plugin
# motion - V4L capture program supporting motion detection
# mp4h - Macro processor for HTML documents
# libisoparser-java - Generic parser and writer for ISO 14496 based files
# libmp4v2-2 - library to read, create, and modify mp4 files (shared library)
# libmp4v2-dev - library to read, create, and modify mp4 files (development files)
# mp4v2-dbg - library to read, create, and modify mp4 files (debug)
# mp4v2-utils - library to read, create, and modify mp4 files (frontends)
# mencoder - MPlayer's Movie Encoder
# mplayer - movie player for Unix-like systems
# mplayer-gui - movie player for Unix-like systems (GUI variant)
# mps-youtube - Terminal based YouTube jukebox with playlist management
# nginx-extras - nginx web/proxy server (extended version)
# libogmrip-dev - Application for ripping and encoding DVD - development files
# libogmrip1 - Application for ripping and encoding DVD - libraries files
# ogmrip - Application for ripping and encoding DVD
# ogmrip-doc - Application for ripping and encoding DVD - Documentation files
# ogmrip-plugins - Application for ripping and encoding DVD - plugins
# pacpl - multi-purpose audio converter/ripper/tagger script
# psi4 - Quantum Chemical Program Suite
# puddletag - simple, powerful audio tag editor
# python-pysnmp4 - Python SNMP library for agents and managers (Python 2 module)
# python-pysnmp4-doc - Python SNMP library for agents and managers (unstable branch)
# python3-pysnmp4 - Python SNMP library for agents and managers (Python 3 module)
# python-pysnmp4-apps - Applications for the Python SNMP library
# python-pysnmp4-mibs - MIBs for the Python SNMP library
# sfront - MPEG 4 Structured Audio decoder
# libtag1-dev - audio meta-data library - development files
# libtag1-doc - audio meta-data library - API documentation
# libtag1v5 - audio meta-data library
# libtag1v5-vanilla - audio meta-data library - vanilla flavour
# libtagc0 - audio meta-data library - C bindings
# libtagc0-dev - audio meta-data library - development files for C bindings
# libtag-extras-dev - TagLib extras library - development files
# libtag-extras1 - TagLib extras library - support for more file formats
# vokoscreen - easy to use screencast creator
# xmms2-plugin-avcodec - XMMS2 - avcodec decoder
# xmms2-plugin-faad - XMMS2 - faad decoder
# xmms2-plugin-mp4 - XMMS2 - MPEG-4 plug-in
# yorick-av - write movies from Yorick in various formats
echo $TOTDATE
ACTION="mp4"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
log_error;
$APPS install atomicparsley audex easytag faad gpac libatomicparsley-dev libatomicparsley0 libjs-jquery-jplayer kid3 kid3-cli kid3-core kid3-qt libapache2-mod-musicindex libaudio-scan-perl libjaudiotagger-java libmp4-info-perl libwww-nicovideo-download-perl libxmp4 moc-ffmpeg-plugin motion mp4h libisoparser-java libmp4v2-2 libmp4v2-dev mp4v2-dbg mp4v2-utils mencoder mplayer mplayer-gui mps-youtube nginx-extras libogmrip-dev libogmrip1 ogmrip ogmrip-doc ogmrip-plugins pacpl psi4 puddletag python-pysnmp4 python-pysnmp4-doc python3 pysnmp4 python-pysnmp4-apps python-pysnmp4-mibs sfront libtag1-dev libtag1-doc libtag1v5 libtag1v5 libtagc0 libtagc0-dev libtag-extras-dev libtag-extras1 vokoscreen xmms2-plugin-avcodec xmms2-plugin-faad xmms2-plugin-mp4 yorick-av 2>&1 | tee -a logfile.log

#
# non-mixer
#
# Unavailable
echo $TOTDATE
ACTION="non-mixer"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# non-session-manager
#
# Unavailable
echo $TOTDATE
ACTION="non-session-manager"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# non-timeline
#
# Unavailable
echo $TOTDATE
ACTION="non-timeline"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# paulstretch
#
# paulstretch - Extreme sound time-stretch
echo $TOTDATE
ACTION="paulstretch"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install paulstretch 2>&1 | tee -a logfile.log
log_error;

#
# piano
#
# jcadencii - Piano roll editor for singing synthesis
# drumstick-tools - Qt4/C++ wrapper for ALSA Sequencer - utilities
# mda-lv2 - Paul Kellett's MDA plugins ported to LV2
# monobristol - simple GUI for Bristol
# muse - Qt4-based audio/MIDI sequencer
# pd-moonlib - library of Pd objects related to GUI control
# pd-unauthorized - library of Pd objects for streaming and GUI control
# libpiano-dev - library to interface with Pandora radio -- development
# libpiano0 - library to interface with Pandora radio -- runtime files
# pianobar - console based player for Pandora radio
# pianobar-dbg - console based player for Pandora radio - debugging symbols
# pianobooster - learn the piano just by playing a game
# pianobooster-dbg - learn the piano just by playing a game - debug
# pithos - Pandora Radio client for the GNOME desktop
# rosegarden - music editor and MIDI/audio sequencer
# so-synth-lv2 - Set of synthesizers for the LV2 plugin format
# texlive-music - TeX Live: Music packages
# vmpk - Virtual MIDI Piano Keyboard
echo $TOTDATE
ACTION="piano"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install jcadencii drumstick-tools mda-lv2 monobristol muse pd-moonlib pd-unauthorized libpiano-dev libpiano0 pianobar pianobar-dbg pianobooster pianobooster-dbg pithos rosegarden so-synth-lv2 texlive-music vmpk 2>&1 | tee -a logfile.log
log_error;

#
# pitch
#
# amsynth - two oscillator software synthesizer
# aubio-tools - library for audio segmentation -- utilities
# libaubio-dev - library for audio and music analysis, synthesis, and effects
# libaubio-doc - library for audio segmentation -- documentation
# libaubio5 - library for audio segmentation
# python-aubio - python interface for aubio, a library for audio segmentation
# python3-aubio - python interface for aubio, a library for audio segmentation
# autotalent - pitch correction LADSPA plugin
# beep - advanced pc-speaker beeper
# blop - Bandlimited wavetable-based oscillator plugins for LADSPA hosts
# dbmix - DJ mixer for digital audio streams
# multimedia-audio-utilities - packages for manipulating & cataloging music and audio
# etw - arcade-style soccer game
# fonts-ipaexfont - Japanese OpenType font, all IPAex Fonts
# fonts-ipaexfont-gothic - Japanese OpenType font, IPAex Gothic Font
# fonts-ipaexfont-mincho - Japanese OpenType font, IPAex Mincho Font
# fonts-yozvox-yozfont - Japanese proportional Handwriting OpenType font
# fonts-yozvox-yozfont-antique - Japanese proportional Handwriting OpenType font (antique kana)
# fonts-yozvox-yozfont-cute - Japanese proportional Handwriting OpenType font (cute kana)
# fonts-yozvox-yozfont-edu - Japanese proportional Handwriting OpenType font (educational cana)
# fonts-yozvox-yozfont-new-kana - Japanese proportional Handwriting OpenType font (new kana)
# fonts-yozvox-yozfont-standard-kana - Japanese proportional Handwriting OpenType font (standard kana)
# gespeaker - GTK+ front-end for eSpeak and mbrola
# gtranscribe - simple GTK+ tool focussed on easy transcription of spoken words
# hydrogen - advanced drum machine/step sequencer
# libaldmb1 - dynamic universal music bibliotheque, Allegro version
# libaldmb1-dev - development files for libaldmb1
# libdumb1 - dynamic universal music bibliotheque
# libdumb1-dev - development files for libdumb1
# libsbsms-dev - Subband Sinusoidal Modeling Synthesis (development files)
# libsbsms10 - Subband Sinusoidal Modeling Synthesis
# mda-lv2 - Paul Kellett's MDA plugins ported to LV2
# milkytracker - music creation tool inspired by Fast Tracker 2
# libsoundtouch-ocaml - OCaml bindings for the sound stretching library -- runtime files
# libsoundtouch-ocaml-dev - OCaml bindings for the sound stretching library -- runtime files
# paulstretch - Extreme sound time-stretch
# pd-aubio - aubio external for PureData
# pd-fftease - live spectral sound processors for Pd
# pd-lyonpotpourri - potpourri of Pd objects for synthesizing with audio
# pd-moonlib - library of Pd objects related to GUI control
# petri-foo - MIDI controllable audio sampler - successor of specimen
# playitslowly - Plays back audio files at a different speed or pitch
# praat - program for speech analysis and synthesis
# qmidiroute - MIDI event router and filter
# librubberband-dev - audio time-stretching and pitch-shifting library (development files)
# librubberband2 - audio time-stretching and pitch-shifting library
# rubberband-cli - audio time-stretching and pitch-shifting utility
# rubberband-ladspa - LADSPA plugin for audio pitch-shifting
# rubberband-vamp - Vamp plugins using Rubber Band
# schism - ImpulseTracker clone aiming at providing the same look&feel
# libsoundtouch-dev - Development files for the sound stretching library
# libsoundtouch1 - Sound stretching library
# libsoundtouch1-dbg - Debugging symbols for the sound stretching library
# soundstretch - Stretches and pitch-shifts sound independently
# soundstretch-dbg - Debugging symbols for the soundstretch program
# stretchplayer - Audio file player with time stretch and pitch shifting
# stretchplayer-dbg - Debugging symbols for StretchPlayer
# swh-lv2 - Steve Harris's SWH plugins ported to LV2
# swh-plugins - Steve Harris's LADSPA plugins
# cwcp - Morse code tutor - text user interface
# vocproc - LV2 plugin for pitch shifting and vocoding
# xwax - open-source vinyl emulation software for Linux
# yatm - Command line audio file player with time stretching capabilities
# zita-at1 - JACK autotuner
echo $TOTDATE
ACTION="pitch"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install amsynth aubio-tools libaubio-dev libaubio-doc libaubio5 python-aubio python3-aubio autotalent beep blop dbmix multimedia-audio-utilities etw fonts-ipaexfont fonts-ipaexfont-gothic fonts-ipaexfont-mincho fonts-yozvox-yozfont fonts-yozvox-yozfont-antique fonts-yozvox-yozfont-cute fonts-yozvox-yozfont-edu fonts-yozvox-yozfont-new-kana fonts-yozvox-yozfont-standard-kana gespeaker gtranscribe hydrogen libaldmb1 libaldmb1-dev libdumb1 libdumb1 libsbsms-dev libsbsms10 mda-lv2 milkytracker libsoundtouch-ocaml libsoundtouch-ocaml-dev paulstretch pd-aubio pd-fftease pd-lyonpotpourri pd-moonlib petri-foo playitslowly praat qmidiroute librubberband-dev librubberband2 rubberband-cli rubberband-ladspa rubberband-vamp schism libsoundtouch-dev libsoundtouch1 libsoundtouch1-dbg soundstretch soundstretch-dbg stretchplayer stretchplayer-dbg swh-lv2 swh-plugins cwcp vocproc xwax yatm zita-at1 2>&1 | tee -a logfile.log
log_error;

#
# pizmidi
#
# Unavailable
echo $TOTDATE
ACTION="pizmidi"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# protrekkr
#
# Unavailable
echo $TOTDATE
ACTION="protrekkr"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# pulseaudio
#
# cairo-dock-impulse-plug-in - Implus plug-in Cairo-dock
# python3-checkbox-support - collection of Python modules used by PlainBox providers
# gir1.2-cvc-1.0 - Introspection data for Cinnamon pulseaudio abstraction
# libcvc0 - Cinnamon pulseaudio abstraction library
# conky-all - highly configurable system monitor (all features enabled)
# conky-all-dbg - highly configurable system monitor (all features enabled - debug)
# gstreamer1.0-pulseaudio - GStreamer plugin for PulseAudio
# kwave - sound editor for KDE
# libao-common - Cross Platform Audio Output Library (Common files)
# libao-dbg - Cross Platform Audio Output Library Debug Symbols
# libao-dev - Cross Platform Audio Output Library Development
# libao4 - Cross Platform Audio Output Library
# libcanberra-pulse - PulseAudio backend for libcanberra
# libmatemixer-common - Mixer library for MATE Desktop (common files)
# libmatemixer-dev - Mixer library for MATE Desktop (development files)
# libmatemixer-doc - Mixer library for MATE Desktop (documentation files)
# libmatemixer0 - Mixer library for MATE Desktop
# libmikmod-config - Portable sound library - development binaries
# libmikmod-dev - Portable sound library - development files
# libmikmod3 - Portable sound library
# libpulse-java - PulseAudio sound driver for Java
# libpulse-jni - PulseAudio sound driver for Java (JNI libraries)
# libsdl1.2debian - Simple DirectMedia Layer
# libsdl2-2.0-0 - Simple DirectMedia Layer
# liquidsoap-plugin-pulseaudio - audio streaming language -- Pulseaudio plugin
# ltsp-server-standalone - complete LTSP server environment
# mate-media - MATE media utilities
# mhwaveedit - Simple and fast GTK2 sound editor
# mkchromecast - Cast your Linux audio to your Google Cast devices
# mkchromecast-pulseaudio - Pulseaudio dependencies to cast with mkchromecast
# mpg123 - MPEG layer 1/2/3 audio player
# libpulse-ocaml - OCaml interface to the PulseAudio sound server
# libpulse-ocaml-dev - OCaml interface to the pulseaudio library
# oss-compat - Open Sound System (OSS) compatibility package
# osspd - OSS Proxy Daemon: Userland OSS emulation
# osspd-alsa - OSS Proxy Daemon: ALSA backend (experimental)
# osspd-pulseaudio - OSS Proxy Daemon: PulseAudio backend
# paman - PulseAudio Manager
# paprefs - PulseAudio Preferences
# pasystray - PulseAudio controller for the system tray
# pavucontrol - PulseAudio Volume Control
# pavucontrol-dbg - Debugging symbols for pavucontrol
# pavucontrol-qt - Qt port of volume control pavucontrol
# pavumeter - PulseAudio Volume Meter
# libpcaudio-dev - C API to different audio devices - development files
# libpcaudio0 - C API to different audio devices - shared library
# pnmixer - Simple mixer application for system tray
# projectm-pulseaudio - projectM PulseAudio module
# libpulse-dev - PulseAudio client development headers and libraries
# libpulse-mainloop-glib0 - PulseAudio client libraries (glib support)
# libpulse0 - PulseAudio client libraries
# libpulsedsp - PulseAudio OSS pre-load library
# pulseaudio - PulseAudio sound server
# pulseaudio-equalizer - Equalizer sink module for PulseAudio sound server
# pulseaudio-esound-compat - PulseAudio ESD compatibility layer
# pulseaudio-module-bluetooth - Bluetooth module for PulseAudio sound server
# pulseaudio-module-gconf - GConf module for PulseAudio sound server
# pulseaudio-module-jack - jackd modules for PulseAudio sound server
# pulseaudio-module-lirc - lirc module for PulseAudio sound server
# pulseaudio-module-raop - RAOP module for PulseAudio sound server
# pulseaudio-module-zeroconf - Zeroconf module for PulseAudio sound server
# pulseaudio-utils - Command line tools for the PulseAudio sound server
# pulseaudio-dlna - Stream audio to DLNA devices and Chromecasts
# qmmp - feature-rich audio player with support of many formats
# libqt5multimedia5-plugins - Qt 5 Multimedia module plugins
# libroar-compat-tools - drop-in replacements for other sound libraries (tools package)
# libroar-compat2 - drop-in replacements for other sound libraries
# simplescreenrecorder - Feature-rich screen recorder for X11 and OpenGL
# snd-gtk-pulse - Sound file editor (GTK+ user interface - PulseAudio)
# libsox-fmt-pulse - SoX PulseAudio format I/O library
# twclock - World clock for ham radio operators
# libcw6 - Morse code tutor - shared library
# vokoscreen - easy to use screencast creator
# volti - control audio volume from system tray/notification area
# xfce4-pulseaudio-plugin - Xfce4 panel plugin to control pulseaudio
# xmms2-plugin-pulse - XMMS2 - PulseAudio output plug-in
echo $TOTDATE
ACTION="pulseaudio"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install cairo-dock-impulse-plug-in python3-checkbox-support gir1.2-cvc-1.0 libcvc0 conky-all conky-all-dbg gstreamer1.0-pulseaudio kwave libao-common libao-dbg libao-dev libao4 libcanberra-pulse libmatemixer-common libmatemixer-dev libmatemixer-doc libmatemixer0 libmikmod-config libmikmod-dev libmikmod3 libpulse-java libpulse-jni libsdl1.2debian libsdl2-2.0-0 liquidsoap-plugin-pulseaudio ltsp-server-standalone mate-media mhwaveedit mkchromecast mkchromecast-pulseaudio mpg123 libpulse-ocaml libpulse-ocaml-dev oss-compat osspd osspd-alsa osspd-pulseaudio paman paprefs pasystray pavucontrol pavucontrol-dbg pavucontrol-qt pavumeter libpcaudio-dev libpcaudio0 pnmixer projectm-pulseaudio libpulse-dev libpulse-mainloop-glib0 libpulse0 libpulsedsp pulseaudio pulseaudio-equalizer pulseaudio-esound-compat pulseaudio-module-bluetooth pulseaudio-module-gconf pulseaudio module-jack pulseaudio-module-lirc pulseaudio-module-raop pulseaudio-module-zeroconf pulseaudio-utils pulseaudio-dlna qmmp libqt5multimedia5-plugins libroar-compat-tools libroar-compat2 simplescreenrecorder snd-gtk-pulse libsox-fmt-pulse twclock libcw6 vokoscreen volti xfce4-pulseaudio-plugin xmms2-plugin-pulse 2>&1 | tee -a logfile.log
log_error;

#
# pykaraoke
#
# pykaraoke - free CDG/MIDI/MPEG karaoke player
# pykaraoke-bin - free CDG/MIDI/MPEG karaoke player
# python-pykaraoke - free CDG/MIDI/MPEG karaoke player
echo $TOTDATE
ACTION="pykaraoke"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install pykaraoke pykaraoke-bin python-pykaraoke 2>&1 | tee -a logfile.log
log_error;

#
# qjack
#
# gmidimonitor - GTK+ application that shows MIDI events
# qjackctl - User interface for controlling the JACK sound server
# qjackrcd - Qt4 application to record JACK server outputs
echo $TOTDATE
ACTION="qjack"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install gmidimonitor qjackctl qjackrcd 2>&1 | tee -a logfile.log
log_error;

#
# qjackctl
#
# gmidimonitor - GTK+ application that shows MIDI events
# qjackctl - User interface for controlling the JACK sound server
# qjackrcd - Qt4 application to record JACK server outputs
echo $TOTDATE
ACTION="qjackctl"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install gmidimonitor qjackctl qjackrcd 2>&1 | tee -a logfile.log
log_error;

#
# qjoypad
#
# qjoypad - Program for mapping gamepad/joystick events to mouse/keyboard event
echo $TOTDATE
ACTION="qjoypad"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install qjoypad 2>&1 | tee -a logfile.log

#
# qsampler
#
# qsampler - LinuxSampler GUI frontend based on the Qt toolkit
echo $TOTDATE
ACTION="qsampler"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install qsampler 2>&1 | tee -a logfile.log
log_error;

#
# qsynth
#
# qsynth - fluidsynth MIDI sound synthesiser front-end
echo $TOTDATE
ACTION="qsynth"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install qsynth 2>&1 | tee -a logfile.log
log_error;

#
# qtractor
#
# qtractor - MIDI/Audio multi-track sequencer application
# so-synth-lv2 - Set of synthesizers for the LV2 plugin format
# swh-lv2 - Steve Harris's SWH plugins ported to LV2
echo $TOTDATE
ACTION="qtractor"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install qtractor so-synth-lv2 swh-lv2 2>&1 | tee -a logfile.log
log_error;

#
# rakarrack
#
# rakarrack - Simple and easy guitar effects processor for GNU/Linux
echo $TOTDATE
ACTION="rakarrack"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install rakarrack 2>&1 | tee -a logfile.log
log_error;

#
# rev-plugins
#
# rev-plugins - reverb LADSPA plugin
echo $TOTDATE
ACTION="rev-plugins"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install rev-plugins 2>&1 | tee -a logfile.log
log_error;

#
# rosegarden
#
# calf-plugins - Calf Studiogear - audio effects and sound generators
# debian-edu-doc-en - English documentation from the Debian Edu project
# debian-edu-doc-es - Spanish documentation from the Debian Edu project
# debian-edu-doc-fr - French documentation from the Debian Edu project
# debian-edu-doc-nb - Bokmål documentation from the Debian Edu project
# debian-edu-doc-nl - Dutch documentation from the Debian Edu project
# rosegarden - music editor and MIDI/audio sequencer
# xjadeo - Video player with JACK sync
echo $TOTDATE
ACTION="rosegarden"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install calf-plugins debian-edu-doc-en debian-edu-doc-es debian-edu-doc-fr debian-edu-doc-nb debian-edu-doc-nl rosegarden xjadeo 2>&1 | tee -a logfile.log
log_error;

#
# samplv1
#
# samplv1 - polyphonic sampler synthesizer - standalone
# samplv1-common - polyphonic sampler synthesizer - common files
# samplv1-lv2 - polyphonic sampler synthesizer - LV2 plugin
echo $TOTDATE
ACTION="samplv1"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install samplv1 samplv1-common samplv1-lv2 2>&1 | tee -a logfile.log
log_error;

#
# sf2
#
# awesfx - utility programs for AWE32/64 and Emu10k1 driver
# freepats - Free patch set for MIDI audio synthesis
# opl3-soundfont - OPL3 SoundFont that simulates the sound of an OPL3 chip
# sfarkxtc - Converts soundfonts from legacy sfArk v2 file format to sf2
# texlive-latex-extra - TeX Live: LaTeX additional packages
# timgm6mb-soundfont - TimGM6mb SoundFont from MuseScore 1.3
# timidity - Software sound renderer (MIDI sequencer, MOD player)
echo $TOTDATE
ACTION="sf2"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install awesfx freepats opl3-soundfont sfarkxtc texlive-latex-extra timgm6mb-soundfont timidity 2>&1 | tee -a logfile.log
log_error;

#
# silverjuke
#
# silverjuke - jukebox, karaoke, and kiosk mode mp3 player
echo $TOTDATE
ACTION="silverjuke"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install silverjuke 2>&1 | tee -a logfile.log
log_error;

#
# simplescreenrecorder
#
# simplescreenrecorder - Feature-rich screen recorder for X11 and OpenGL
echo $TOTDATE
ACTION="simplescreenrecorder"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install simplescreenrecorder 2>&1 | tee -a logfile.log
log_error;

#
# smplayer
#
# smplayer - Complete front-end for MPlayer and mpv
# smplayer-l10n - Complete front-end for MPlayer and mpv - translation files
# smplayer-themes - complete front-end for MPlayer - icon themes
# smtube - YouTube videos browser
echo $TOTDATE
ACTION="smplayer"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install smplayer smplayer-l10n smplayer-themes smtube 2>&1 | tee -a logfile.log
log_error;

#
# soundfonts
#
# libsfark0 - Library for decompressing sfArk soundfonts
# sfarkxtc - Converts soundfonts from legacy sfArk v2 file format to sf2
# tinyeartrainer - A tool to learn recognizing musical intervals
echo $TOTDATE
ACTION="soundfonts"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install libsfark0 sfarkxtc tinyeartrainer 2>&1 | tee -a logfile.log
log_error;

#
# sunvox
#
# Unavailable
echo $TOTDATE
ACTION="sunvox"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log 

#
# synthv1
#
# synthv1 - old-school polyphonic synthesizer - standalone
# synthv1-common - old-school polyphonic synthesizer - common files
# synthv1-lv2 - old-school polyphonic synthesizer - LV2 plugin
echo $TOTDATE
ACTION="synthv1"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install synthv1 synthv1-common synthv1-lv2 2>&1 | tee -a logfile.log
log_error;

#
# timidity
#
# libsdl2-mixer-2.0-0 - Mixer library for Simple DirectMedia Layer 2, libraries
# libsdl2-mixer-dbg - Mixer library for Simple DirectMedia Layer 2, debugging
# libsdl2-mixer-dev - Mixer library for Simple DirectMedia Layer 2, development files
# opl3-soundfont - OPL3 SoundFont that simulates the sound of an OPL3 chip
# pykaraoke - free CDG/MIDI/MPEG karaoke player
# pykaraoke-bin - free CDG/MIDI/MPEG karaoke player
# python-pykaraoke - free CDG/MIDI/MPEG karaoke player
# libsdl-mixer1.2 - Mixer library for Simple DirectMedia Layer 1.2, libraries
# libsdl-mixer1.2-dbg - Mixer library for Simple DirectMedia Layer 1.2, debugging
# libsdl-mixer1.2-dev - Mixer library for Simple DirectMedia Layer 1.2, development files
# timidity - Software sound renderer (MIDI sequencer, MOD player)
# timidity-daemon - runs TiMidity++ as a system-wide MIDI sequencer
# timidity-el - Emacs front end to Timidity++
# timidity-interfaces-extra - TiMidity++ extra user interfaces
# tk707 - drum sequencer for a sound card or MIDI device
echo $TOTDATE
ACTION="timidity"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log 
$APPS install libsdl2-mixer-2.0-0 libsdl2-mixer-dbg libsdl2-mixer-dev opl3-soundfont pykaraoke pykaraoke-bin python-pykaraoke libsdl-mixer1.2 libsdl-mixer1.2-dbg libsdl-mixer1.2-dev timidity timidity-daemon timidity-el timidity-interfaces-extra tk707 2>&1 | tee -a logfile.log
log_error;

#
# triceratops
#
# Unavailable
echo $TOTDATE
ACTION="triceratops"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#$APPS install 2>&1 | tee -a logfile.log

#
# tuxguitar
#
# tuxguitar - Multitrack guitar tablature editor and player (gp3 to gp5)
# tuxguitar-alsa - tuxguitar plugin for sound playback using ALSA
# tuxguitar-fluidsynth - tuxguitar plugin for sound playback using fluidsynth
# tuxguitar-jack - tuxguitar plugin for sound playback using JACKD
# tuxguitar-jsa - tuxguitar plugin for sound playback using Java Sound API
# tuxguitar-oss - tuxguitar plugin for sound playback using OSS
echo $TOTDATE
ACTION="tuxguitar"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install tuxguitar tuxguitar-alsa tuxguitar-fluidsynth tuxguitar-jack tuxguitar-jsa tuxguitar-oss 2>&1 | tee -a logfile.log
log_error;

#
# vj
#
# libcsvjdbc-java - read-only JDBC driver that uses CSV or DBF files as database tables
# libcsvjdbc-java-doc - Documentation for csvjdbc
# golang-github-vjeantet-grok-dev - simple library to use/parse grok patterns with Go
# libtie-ical-perl - module for tieing iCal files to Perl hashes
# lives - Video Editing system allowing users to edit and create video
# lives-data - Data files for LiVES
# lives-plugins - LiVES plugins pack
# liblavjpeg-2.1-0 - MJPEG capture/editing/replay and MPEG encoding toolset (library)
# prosody-modules - Selection of community modules for Prosody
echo $TOTDATE
ACTION="vj"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install libcsvjdbc-java libcsvjdbc-java-doc golang-github-vjeantet-grok-dev libtie-ical-perl lives lives-data lives-plugins liblavjpeg-2.1-0 prosody-modules 2>&1 | tee -a logfile.log
log_error;

#
# vlc
#
# caffe-cpu - Fast, open framework for Deep Learning (Meta)
# caffe-doc - Caffe's doxygen docs and examples
# caffe-tools-cpu - Tools for fast, open framework for Deep Learning (CPU_ONLY)
# libcaffe-cpu-dev - development files for Caffe (CPU_ONLY)
# libcaffe-cpu1 - library of Caffe, deep learning framework (CPU_ONLY)
# python3-caffe-cpu - Python3 interface of Caffe (CPU_ONLY)
# cubemap - scalable video reflector, designed to be used with VLC
# dvblast - Simple and powerful dvb-streaming application
# forensics-extra-gui - Forensics Environment - extra GUI components (metapackage)
# fp-units-multimedia - Free Pascal - multimedia units dependency package
# fp-units-multimedia-3.0.0 - Free Pascal - multimedia units
# freeplayer - wrapper around vlc for French ADSL FreeBox
# freetuxtv - Internet television and radio player
# getstream - DVB streaming application
# kaffeine - versatile media player for KDE
# laditools - Linux Audio Desktop Integration Tools
# libbluray-bdj - Blu-ray Disc Java support library (BD-J library)
# libbluray-bin - Blu-ray disc playback support library (tools)
# libbluray-dev - Blu-ray disc playback support library (development files)
# libbluray-doc - Blu-ray disc playback support library (documentation)
# libbluray1 - Blu-ray disc playback support library (shared library)
# hdhomerun-config - Configuration utility for Silicon Dust HD HomeRun
# libhdhomerun-dev - Development library for Silicon Dust HD HomeRun
# libhdhomerun3 - Library for Silicon Dust HD HomeRun
# libreoffice-avmedia-backend-vlc - VLC backend for LibreOffice
# livestreamer - CLI that pipes video streams to video players
# mimms - mms (e.g. mms://) stream downloader
# mpris-remote - command-line interface for mpris compatible media players
# browser-plugin-vlc - multimedia plugin for web browsers based on VLC
# python3-pafy - Download videos and retrieve metadata from YouTube
# phonon-backend-vlc - Phonon VLC backend
# phonon4qt5-backend-vlc - Phonon4Qt5 VLC backend
# pidgin-mpris - sets your available message to your currently playing track
# smtube - YouTube videos browser
# libvcdinfo-dev - library to extract information from VideoCD (development files)
# libvcdinfo0 - library to extract information from VideoCD
# libvlc-bin - tools for VLC's base library
# libvlc-dev - development files for libvlc
# libvlc5 - multimedia player and streamer library
# libvlccore-dev - development files for libvlccore
# libvlccore8 - base library for VLC and its modules
# vlc - multimedia player and streamer
# vlc-bin - binaries from VLC
# vlc-data - Common data for VLC
# vlc-l10n - Translations for VLC
# vlc-nox - transitional dummy package
# vlc-plugin-access-extra - multimedia player and streamer (extra access plugins)
# vlc-plugin-base - multimedia player and streamer (base plugins)
# vlc-plugin-fluidsynth - FluidSynth plugin for VLC
# vlc-plugin-jack - Jack audio plugins for VLC
# vlc-plugin-notify - LibNotify plugin for VLC
# vlc-plugin-qt - multimedia player and streamer (Qt plugin)
# vlc-plugin-samba - Samba plugin for VLC
# vlc-plugin-sdl - SDL video and audio output plugin for VLC
# vlc-plugin-skins2 - multimedia player and streamer (Skins2 plugin)
# vlc-plugin-svg - SVG plugin for VLC
# vlc-plugin-video-output - multimedia player and streamer (video output plugins)
# vlc-plugin-video-splitter - multimedia player and streamer (video splitter plugins)
# vlc-plugin-visualization - multimedia player and streamer (visualization plugins)
# vlc-plugin-zvbi - VBI teletext plugin for VLC
# vlc-plugin-vlsub - VLC extension to download subtitles from opensubtitles.org
# x264 - video encoder for the H.264/MPEG-4 AVC standard
echo $TOTDATE
ACTION="vlc"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install caffe-cpu caffe-doc caffe-tools-cpu libcaffe-cpu-dev libcaffe-cpu1 python3-caffe-cpu cubemap dvblast forensics-extra-gui fp-units-multimedia fp-units-multimedia-3.0.0 freeplayer freetuxtv getstream kaffeine laditools libbluray-bdj libbluray-bin libbluray-dev libbluray-doc libbluray1 hdhomerun-config libhdhomerun-dev libhdhomerun3 libreoffice-avmedia-backend-vlc livestreamer mimms mpris-remote browser-plugin-vlc python3-pafy phonon-backend-vlc phonon4qt5-backend-vlc pidgin-mpris smtube libvcdinfo-dev libvcdinfo0 libvlc-bin libvlc-dev libvlc5 libvlccore-dev libvlccore8 vlc vlc-bin vlc-data vlc-l10n vlc-nox vlc-plugin-access-extra vlc-plugin-base vlc-plugin-fluidsynth vlc-plugin-jack vlc-plugin-notify vlc-plugin-qt vlc-plugin-samba vlc-plugin-sdl vlc-plugin-skins2 vlc-plugin-svg vlc-plugin-video-output vlc-plugin-video-splitter vlc-plugin-visualization vlc-plugin-zvbi vlc-plugin-vlsub x264 2>&1 | tee -a logfile.log
log_error;

#
# vmpk
#
# vmpk - Virtual MIDI Piano Keyboard
echo $TOTDATE
ACTION="vmpk"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install vmpk 2>&1 | tee -a logfile.log
log_error;

#
# vokoscreen
#
# vokoscreen - easy to use screencast creator
echo $TOTDATE
ACTION="vokoscreen"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install vokoscreen 2>&1 | tee -a logfile.log
log_error;

#
# vst
#
# cvsutils - CVS utilities for use in working directories
# python-django-kvstore - Extensible key-value store backend for Django
# dssi-dev - Header file for compiling DSSI plugins and hosts
# dssi-example-plugins - Examples of DSSI plugin
# dssi-host-jack - Example of DSSI host
# dssi-utils - Command-line utilities for sending commands to DSSI plugins
# envstore - store for environment variables across shell processes
# flvstreamer - command-line RTMP client
# lmms-vst-server - Linux Multimedia Studio - VST server
# lvtk-dev - LV2 C++ wrappers and utilities
# lvtk-doc - LV2 Toolkit documentation
# lvtk-examples - LV2 C++ wrappers and utilities - examples plugins
# lvtk-tools - LV2 C++ wrappers and utilities - tools
# mda-lv2 - Paul Kellett's MDA plugins ported to LV2
# pd-plugin - LADSPA and VST plug-in hosting for Pd
# python-bashate - bash script style guide checker - Python 2.x
# python-bashate-doc - bash script style guide checker - doc
# python3-bashate - bash script style guide checker - Python 3.x
# silverjuke - jukebox, karaoke, and kiosk mode mp3 player
# vamp-plugin-sdk - audio analysis and feature extraction plugins (SDK)
# varnish-modules - Varnish module collection
# vstream-client - library and utility to fetch media streams from a TIVO
# vstream-client-dev - Development headers for vstream-client
# libwvstreams-dev - Development libraries and header files for libwvstreams4.6
# libwvstreams4.6-base - C++ network libraries for rapid application development
# libwvstreams4.6-doc - Documentation for WvStreams
# libwvstreams4.6-extras - C++ network libraries for rapid application development
# zam-plugins - Collection of LV2, LADSPA, LINUX-VST and JACK plugins
echo $TOTDATE
ACTION="vst"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install cvsutils python-django-kvstore dssi-dev dssi-example-plugins dssi-host-jack dssi-utils envstore flvstreamer lmms-vst-server lvtk-dev lvtk-doc lvtk-examples lvtk-tools mda-lv2 pd-plugin python-bashate python-bashate-doc python3-bashate silverjuke vamp-plugin-sdk varnish-modules vstream-client vstream-client-dev libwvstreams-dev libwvstreams4.6-base libwvstreams4.6-doc libwvstreams4.6-extras zam-plugins 2>&1 | tee -a logfile.log
log_error;

#
# wav
#
# abinit - package for electronic structure calculations
# abinit-data - package for electronic structure calculations (Data files)
# abinit-doc - package for electronic structure calculations (Documentation)
# abx - audio ABX testing software
# alure-doc - AL Utilities REtooled (documentation)
# alure-utils - AL Utilities REtooled (utilities)
# libalure-dev - AL Utilities REtooled (development files)
# libalure1 - AL Utilities REtooled (shared library)
# amsynth - two oscillator software synthesizer
# ap-utils - Access Point SNMP Utils for Linux
# asterisk-core-sounds-en-wav - asterisk PBX sound files - en-us/wav
# asterisk-core-sounds-es-wav - asterisk PBX sound files - es-mx/wav
# asterisk-core-sounds-fr-wav - asterisk PBX sound files - fr-ca/wav
# asterisk-core-sounds-it-wav - asterisk PBX sound files - it-it/wav
# asterisk-core-sounds-ru-wav - asterisk PBX sound files - ru-ru/wav
# asterisk-moh-opsound-wav - asterisk extra sound files - English/wav
# asterisk-prompt-it-menardi-wav - asterisk PBX Italian sound files - wav prompts
# asunder - graphical audio CD ripper and encoder
# audacious - small and fast audio player which supports lots of formats
# audacious-dev - audacious development files
# libaudcore3 - audacious core engine library
# libaudgui3 - audacious media player (libaudgui shared library)
# libaudqt0 - audacious media player (libaudqt shared library)
# libaudtag2 - audacious media player (libaudtag shared library)
# audacious-plugins - Base plugins for audacious
# audacity - fast, cross-platform audio editor
# audex - Audio grabber tool for KDE
# audiofile-tools - sfinfo and sfconvert tools
# libaudiofile-dev - Open-source version of SGI's audiofile library (header files)
# libaudiofile1 - Open-source version of SGI's audiofile library
# python-audioread - Backend-agnostic audio decoding Python package
# python3-audioread - Backend-agnostic audio decoding Python 3 package
# bart - tools for computational magnetic resonance imaging
# bchunk - CD image format conversion from bin/cue to iso/cdr
# blender - Very fast and versatile 3D modeller/renderer
# blender-data - Very fast and versatile 3D modeller/renderer - data package
# blop - Bandlimited wavetable-based oscillator plugins for LADSPA hosts
# libboost-wave-dev - C99/C++ preprocessor library (default version)
# libboost-wave1.62-dev - C99/C++ preprocessor library
# libboost-wave1.62.0 - C99/C++ preprocessor library
# bplay - Buffered audio file player/recorder
# burn - command-line tool for writing optical media
# coop-computing-tools - cooperative computing tools
# cdparanoia - audio extraction tool for sampling CDs
# cdparanoia-dbg - audio extraction tool for sampling CDs (debug)
# libcdparanoia-dev - audio extraction tool for sampling CDs (development)
# libcdparanoia0 - audio extraction tool for sampling CDs (library)
# icedax - Creates WAV files from audio CDs
# libchealpix-dev - HEALPix representation of spherical data - C development library
# libchealpix0 - HEALPix representation of spherical data - C shared library
# chemps2 - Executable to call libchemps2-2 from the command line
# chemps2-doc - Documentation of the libchemps2-2 package
# libchemps2-2 - Spin-adapted DMRG for ab initio quantum chemistry
# libchemps2-dev - C++ headers, static library, and symlink for libchemps2-2
# python-chemps2 - Python 2 interface for libchemps2-2
# cmus - lightweight ncurses audio player
# cp2k - Ab Initio Molecular Dynamics
# libcpldrs26 - CPL higher level data processing algorithms
# cpl-plugin-fors - ESO data reduction pipeline for the FORS1/2 instruments
# cpl-plugin-uves - ESO data reduction pipeline for the UVES instrument
# cpl-plugin-vimos - ESO data reduction pipeline for the VIMOS instrument
# cpl-plugin-xshoo - ESO data reduction pipeline for the XSHOOTER instrument
# cplay - A front-end for various audio players
# cue2toc - converts CUE files to cdrdao's TOC format
# cuetools - tools for manipulating CUE/TOC files
# cynthiune.app - Music player for GNUstep
# debian-edu-artwork-softwaves - Debian Edu Softwaves (stretch) themes and artwork
# dgedit - drum kit editor for DrumGizmo
# din - digital audio synthesizer
# dir2ogg - audio file converter into ogg-vorbis format
# drumgizmo - Audio sampler plugin and stand-alone app that simulates a real drum kit
# libecereaudio0 - Ecere Audio
# elk-lapw - All-Electron Density-Functional Electronic Structure Code
# eso-pipelines - ESO VLT Instrument pipeline collection
# espeak - Multi-lingual software speech synthesizer
# espeak-ng - Multi-lingual software speech synthesizer
# quantum-espresso - Electronic-Structure and Ab-Initio Molecular Dynamics Suite
# quantum-espresso-data - Electronic-Structure and Ab-Initio Molecular Dynamics Suite (Documentation)
# extace - waveform viewer
# fapg - Fast Audio Playlist Generator
# fische - stand-alone sound visualisation for Linux
# flake - Alternative encoder for the Free Lossless Audio Codec
# libflake-dev - Alternative encoder for the Free Lossless Audio Codec -- Development files
# fmit - Free Music Instrument Tuner
# freecad - Extensible Open Source CAx program (alpha)
# freehdl - VHDL simulator for Linux
# libfreehdl0 - VHDL simulator for Linux (shared libraries)
# libfreehdl0-dev - VHDL simulator for Linux (development headers)
# funnyboat - side scrolling arcade shooter game on a steamboat
# fuse-emulator-utils - The Free Unix Spectrum Emulator - Utilities
# gimp-plugin-registry - repository of optional extensions for GIMP
# gjay - An automatic and learning DJ for audacious
# browser-plugin-gnash - GNU Shockwave Flash (SWF) player - Plugin for Mozilla and derivatives
# gnash - GNU Shockwave Flash (SWF) player
# gnash-common - GNU Shockwave Flash (SWF) player - Common files/libraries
# gnash-cygnal - GNU Shockwave Flash (SWF) player - Media server
# gnash-dbg - GNU Shockwave Flash (SWF) player - Debug symbols
# gnash-dev - GNU Shockwave Flash (SWF) player - Development files
# gnash-doc - GNU Shockwave Flash (SWF) player - API documentation
# gnash-ext-fileio - GNU Shockwave Flash (SWF) player - Fileio extension
# gnash-ext-lirc - GNU Shockwave Flash (SWF) player - LIRC extension
# gnash-ext-mysql - GNU Shockwave Flash (SWF) player - MySQL extension
# gnash-tools - GNU Shockwave Flash (SWF) player - Command-line Tools
# klash - GNU Shockwave Flash (SWF) player - Standalone player for KDE
# konqueror-plugin-gnash - GNU Shockwave Flash (SWF) player - Plugin for Konqueror
# python-gtk-gnash - GNU Shockwave Flash (SWF) player - Python bindings
# libgnuradio-wavelet3.7.10 - gnuradio wavelet functions
# gpaw - DFT and beyond within the projector-augmented wave method
# gr-osmosdr - Gnuradio blocks from the OsmoSDR project
# gramofile - transfer sound from gramophone records to CD
# gtkwave - VCD (Value Change Dump) file waveform viewer
# gvb - visual simulator of 1 and 2-dimensional vibrations
# gwave - waveform viewer eg for spice simulators
# gwc - Audio file denoiser
# python-hachoir-metadata - Program to extract metadata using Hachoir library
# python-hachoir-parser - Package of Hachoir parsers used to open binary files
# libhealpix-cxx-dev - representation of spherical data - C++ development library
# libhealpix-cxx0 - representation of spherical data - C++ shared library
# libhealpix-java - HEALPix representation of spherical data - Java library
# libhealpix-java-doc - HEALPix representation of spherical data - Java documentation
# python-healpy-data - HEALPix representation of spherical data - Python data
# horgand - JACK capable organ softsynth
# horgand-data - JACK capable organ softsynth (data files)
# htsengine - frontend of HMM-based speech synthesis engine
# libhtsengine-dev - Development files for HMM-based speech synthesis engine API
# libhtsengine1 - HMM-based speech synthesis engine API
# libhugs-alut-bundled - A binding for the OpenAL Utility Toolkit
# hydrogen - advanced drum machine/step sequencer
# jack - Rip and encode CDs with one command
# jack-capture - program for recording soundfiles with jack
# jnoise - white and pink noise generator
# libjs-jquery-jplayer - HTML5 Audio & Video for jQuery with a Flash fallback
# kid3 - KDE audio tag editor
# kid3-cli - Command line audio tag editor
# kid3-core - Audio tag editor core libraries and data
# kid3-qt - Audio tag editor
# kradio4 - comfortable radio application for KDE
# kwave - sound editor for KDE
# laserboy - Laser show software for soundcard operation
# laserboy-indep - Laser show software for soundcard operation - data files
# ldm-themes - Collection of themes for the LTSP login manager
# libao-common - Cross Platform Audio Output Library (Common files)
# libao-dbg - Cross Platform Audio Output Library Debug Symbols
# libao-dev - Cross Platform Audio Output Library Development
# libao4 - Cross Platform Audio Output Library
# libaudclient-dev - audacious D-Bus remote control library (development files)
# libaudclient2 - audacious D-Bus remote control library
# libaudio-scan-perl - module for reading metadata from common audio file formats
# libaudio-wav-perl - modules for manipulating WAV Audio files
# libccaudio2-2 - GNU ccAudio2 - a C++ class framework for processing audio files
# libccaudio2-dev - header files and static link library for GNU ccAudio
# epsilon-bin - Library for wavelet image compression - tools
# libepsilon-dev - Library for wavelet image compression - development files
# libepsilon1 - Library for wavelet image compression
# extract - displays meta-data from files of arbitrary type
# libextractor3 - extracts meta-data from files of arbitrary type (library)
# libg3d-plugins - plugins for the LibG3D library
# gigtools - command line tools for Gigasampler and DLS Level 1/2 files
# libimage-seek-perl - Perl module to find similar pictures in a library
# libimage-size-perl - module for determining image sizes in several common formats
# libinstpatch-1.0-0 - MIDI instrument editing library
# libinstpatch-dev - MIDI instrument editing library development files
# libinstpatch-doc - MIDI instrument editing library documentation
# libmediainfo-dev - library reading metadata from media files -- headers
# libmediainfo-doc - library for reading metadata from media files -- documentation
# libmediainfo0v5 - library for reading metadata from media files -- shared library
# python-mediainfodll - library for reading metadata from media files -- shared library
# python3-mediainfodll - library for reading metadata from media files -- shared library
# libmikmod-config - Portable sound library - development binaries
# libmikmod-dev - Portable sound library - development files
# libmikmod3 - Portable sound library
# libmpcdec-dev - MusePack decoder - development files
# libmpcdec6 - MusePack decoder - library
# musepack-tools - MusePack commandline utilities
# libsndfile1 - Library for reading/writing audio files
# lightspeed - Shows how objects moving at relativistic speeds look like
# lirc-x - infra-red remote control support - X utilities
# ll-scope - an oscilloscope DSSI plugin
# mcp-plugins - LADSPA plugins designed for Alsa Modular Synth
# mda-lv2 - Paul Kellett's MDA plugins ported to LV2
# mediainfo - command-line utility for reading information from audio/video files
# mediainfo-gui - graphical utility for reading information from audio/video files
# mhwaveedit - Simple and fast GTK2 sound editor
# milkytracker - music creation tool inspired by Fast Tracker 2
# minimodem - general-purpose software audio FSK modem
# mixxx - Digital Disc Jockey Interface
# mixxx-data - Digital Disc Jockey Interface -- data files
# mm3d - OpenGL based 3D model editor
# moc - ncurses based console audio player
# monitoring-plugins-standard - Plugins for nagios compatible monitoring systems (standard)
# moosic - Daemon/client combo to easily queue music files for playing
# morse2ascii - tool for decoding the morse codes from a PCM WAV file
# mp3burn - burn audio CDs directly from MP3, Ogg Vorbis, or FLAC files
# mp3cd - Burns normalized audio CDs from lists of MP3s/WAVs/Oggs/FLACs
# mp3roaster - Perl hack for burning audio CDs out of MP3/OGG/FLAC/WAV files
# mpd - Music Player Daemon
# multimail - Offline reader for Blue Wave, QWK, OMEN and SOUP
# music123 - Command-line shell for sound-file players
# pypy-mutagen - audio metadata editing library (PyPy)
# python-mutagen - audio metadata editing library
# python-mutagen-doc - audio metadata editing library - documentation
# python3-mutagen - audio metadata editing library (Python 3)
# normalize-audio - adjusts the volume of WAV, MP3 and OGG files to a standard volume level
# octave-ltfat - Large Time/Frequency Analysis Toolbox
# octave-ltfat-common - Large Time/Frequency Analysis Toolbox (arch-indep files)
# octave-signal - signal processing functions for Octave
# omins - collection of LADSPA plugins aimed at modular synthesizers
# open-invaders - Space Invaders clone
# open-invaders-data - Space Invaders clone (data package)
# libopenjp2-7 - JPEG 2000 image compression/decompression library
# libopenjp2-7-dev - development files for OpenJPEG, a JPEG 2000 image library
# libopenjp3d7 - JP3D (JPEG 2000 / Part 10) image compression/decompression library
# libopenjpip7 - JPEG 2000 Interactive Protocol
# libopenzwave-doc - documentation for the openzwave library
# libopenzwave1.5 - API to use a Z-Wave controller
# libopenzwave1.5-dev - header files for the openzwave library
# openzwave - Sample Program for libopenzwave
# libotbwavelet-5.8-1 - ORFEO Toolbox library - OTBWavelet
# pacpl - multi-purpose audio converter/ripper/tagger script
# paulstretch - Extreme sound time-stretch
# pd-bassemu - Pd object for transistor bass emulation
# pd-creb - Tom's bag of trick for Pure Data (Pd)
# pd-cxc - Pd library for working with patterns and numbers
# pd-ext13 - collection of file and message objects for Pd by dieb13
# pd-lyonpotpourri - potpourri of Pd objects for synthesizing with audio
# phasex - Phase Harmonic Advanced Synthesis EXperiment
# psi4 - Quantum Chemical Program Suite
# psi3 - Quantum Chemical Program Suite
# puddletag - simple, powerful audio tag editor
# pulseaudio-utils - Command line tools for the PulseAudio sound server
# pulseaudio-dlna - Stream audio to DLNA devices and Chromecasts
# python-pysynphot - Python Synthetic Photometry Utilities
# python3-pysynphot - Python 3 Synthetic Photometry Utilities
# python-dtcwt - Dual-Tree Complex Wavelet Transform library for Python 2
# python-dtcwt-doc - Documentation of the Python implementation of the DT-CWT
# python3-dtcwt - Dual-Tree Complex Wavelet Transform library for Python 3
# pyvnc2swf - screen recording tool with Flash (SWF) output
# python-pywt - Python extension implementing of wavelet transformations
# python-pywt-doc - Python extension implementing of wavelet transformations (Documentation)
# python3-pywt - Python3 extension implementing of wavelet transformations
# qjackrcd - Qt4 application to record JACK server outputs
# qmidiarp - MIDI arpeggiator for ALSA
# qmmp - feature-rich audio player with support of many formats
# quelcom - Command line editing tools for MP3 and WAV files
# exfalso - audio tag editor for GTK+
# quodlibet - audio library manager and player for GTK3
# r-cran-rcppgsl - GNU R package for integration with the GNU GSL
# ruby-carrierwave - Ruby file upload library
# ruby-wavefile - Pure Ruby library for reading and writing Wave sound files (*.wav)
# libsdl-sound1.2 - Sound library for Simple DirectMedia Layer 1.2, libraries
# libsdl-sound1.2-dev - Sound library for Simple DirectMedia Layer 1.2, development files
# shineenc - Fixed-point MP3 encoding library - frontend binary
# shntool - multi-purpose tool for manipulating and analyzing WAV files
# sidplay-base - Music player for tunes from C64 and C128 (console)
# siggen - Waveform generation tools
# silverjuke - jukebox, karaoke, and kiosk mode mp3 player
# libsnack-alsa - Sound extension to Tcl/Tk and Python/Tkinter - ALSA files
# libsnack-oss - Sound extension to Tcl/Tk and Python/Tkinter - OSS files
# python-tksnack - Sound extension to Tcl/Tk and Python/Tkinter - Python 2.x library
# python3-tksnack - Sound extension to Tcl/Tk and Python/Tkinter - Python 3.x library
# tcl-snack - Sound extension to Tcl/Tk and Python/Tkinter - Tcl/Tk library
# tcl-snack-dev - Sound extension to Tcl/Tk and Python/Tkinter - development files
# tcl-snack-doc - Sound extension to Tcl/Tk and Python/Tkinter - documentation
# sonic - Simple utility to speed up or slow down speech
# soundconverter - GNOME application to convert audio files into other formats
# soundscaperenderer - tool for real-time spatial audio reproduction
# soundscaperenderer-common - tool for real-time spatial audio reproduction (common-files)
# soundscaperenderer-nox - tool for real-time spatial audio reproduction (without X support)
# soundstretch - Stretches and pitch-shifts sound independently
# soundstretch-dbg - Debugging symbols for the soundstretch program
# libsox-fmt-base - Minimal set of SoX format libraries
# sox - Swiss army knife of sound processing
# speech-tools - Edinburgh Speech Tools - user binaries
# squeezelite - lightweight headless Squeezebox emulator - ALSA version
# squeezelite-pa - lightweight headless Squeezebox emulator - PortAudio version
# steghide - steganography hiding tool
# steghide-doc - steganography hiding tool - documentation files
# stymulator - Curses based player and converter for the YM chiptune format
# libsubtitleeditor-dev - subtitleeditor lib - development files
# libsubtitleeditor0 - subtitleeditor lib - runtime files
# subtitleeditor - Graphical subtitle editor with sound waves representation
# libswami-dev - MIDI instrument editor - development files
# libswami0 - MIDI instrument editor - shared libraries
# swami - MIDI instrument editor application
# sweep - Audio editor and live playback tool
# sweep-dev - Audio editor and live playback tool (development)
# swfmill - xml2swf and swf2xml processor
# swftools - Collection of utilities for SWF file manipulation/creation
# swftools-dbg - Collection of utilities for SWF file manipulation/creation (debug)
# swh-lv2 - Steve Harris's SWH plugins ported to LV2
# swh-plugins - Steve Harris's LADSPA plugins
# libtag1-dev - audio meta-data library - development files
# libtag1-doc - audio meta-data library - API documentation
# libtag1v5 - audio meta-data library
# libtag1v5-vanilla - audio meta-data library - vanilla flavour
# libtagc0 - audio meta-data library - C bindings
# libtagc0-dev - audio meta-data library - development files for C bindings
# libtag-extras-dev - TagLib extras library - development files
# libtag-extras1 - TagLib extras library - support for more file formats
# tempest-for-eliza - demonstrate electromagnetic emissions from computer systems
# terminatorx - realtime audio synthesizer
# tessa - simulation of 3D optical systems with the FDTD method
# tessa-mpi - simulation of 3D optical systems using FDTD on MPI clusters
# testdisk - Partition scanner and disk recovery tool, and PhotoRec file recovery tool
# texlive-latex-extra - TeX Live: LaTeX additional packages
# timemachine - JACK audio recorder for spontaneous and conservatory use
# timidity - Software sound renderer (MIDI sequencer, MOD player)
# transcalc - microwave and RF transmission line calculator
# ttf-aenigma - 465 free TrueType fonts by Brian Kent
# vamp-examples - example Vamp plugins, host and RDF generator
# vco-plugins - LADSPA plugin sporting anti-aliased oscillators
# xul-ext-video-without-flash - extension to watch videos without the Flash plugin
# view3dscene - VRML / X3D browser, and a viewer for other 3D model formats
# libwaili-dev - WAILI is a wavelet transform library (develop. files)
# libwaili1c2 - WAILI is a wavelet transform library
# wav2cdr - Converts wav files into CD-ROM audio file format
# wavbreaker - tool to split wave files into multiple chunks
# wavemon - Wireless Device Monitoring Application
# wavesurfer - Sound Manipulation Program
# libwavpack-dev - audio codec (lossy and lossless) - development files
# libwavpack1 - audio codec (lossy and lossless) - library
# wavpack - audio codec (lossy and lossless) - encoder and decoder
# wavtool-pl - tool to concatenate wav files
# whysynth - DSSI Soft Synth Interface
# wildmidi - software MIDI player
# wings3d - Nendo-inspired 3D polygon mesh modeller
# wmwave - Monitor status of an 802.11 wireless ethernet link
# wsynth-dssi - hack on Xsynth-DSSI to allow wavetable synthesis
# xawtv-tools - television viewer - tools
# xcfa - X Convert File Audio
# xcfa-dbg - X Convert File Audio - debugging symbols
# xdesktopwaves - Simulation of water waves on the X Window System
# xfce4-goodies - enhancements for the Xfce4 Desktop Environment
# xfce4-wavelan-plugin - wavelan status plugin for the Xfce4 panel
# xmms2-plugin-wavpack - XMMS2 - WavPack decoder plug-in
# xscreensaver-data - Screen saver modules for screensaver frontends
# yaret - console tool to turn CDs into encoded music
# yorick-yeti - utility plugin for the Yorick language
# youtube-dl - downloader of videos from YouTube and other sites
# zita-resampler - resampler application written with libzita-resampler
echo $TOTDATE
ACTION="wav"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install abinit abinit-data abinit-doc abx alure-doc alure-utils libalure-dev libalure1 amsynth ap-utils asterisk-core-sounds-en-wav asterisk-core-sounds-es-wav asterisk-core-sounds-fr-wav asterisk-core-sounds-it-wav asterisk-core-sounds-ru-wav asterisk-moh-opsound-wav asterisk-prompt-it-menardi-wav asunder audacious audacious-dev libaudcore3 libaudgui3 libaudqt0 libaudtag2 audacious-plugins audacity audex audiofile-tools libaudiofile-dev libaudiofile1 python-audioread python3-audioread bart bchunk blender blender-data blop libboost-wave-dev libboost-wave1.62-dev libboost-wave1.62.0 bplay burn coop-computing-tools cdparanoia cdparanoia-dbg libcdparanoia-dev libcdparanoia0 icedax libchealpix-dev libchealpix0 chemps2 chemps2-doc libchemps2-2 libchemps2-dev python-chemps2 cmus cp2k libcpldrs26 cpl-plugin-fors cpl-plugin-uves cpl-plugin-vimos cpl-plugin-xshoo cplay cue2toc cuetools cynthiune.app debian-edu-artwork-softwaves dgedit din dir2ogg drumgizmo libecereaudio0 elk-lapw eso-pipelines espeak espeak-ng quantum-espresso quantum-espresso-data extace fapg fische flake libflake-dev fmit freecad freehdl libfreehdl0 libfreehdl0-dev funnyboat fuse-emulator-utils gimp-plugin-registry gjay browser-plugin-gnash gnash gnash-common gnash-cygnal gnash-dbg gnash-dev gnash-doc gnash-ext-fileio gnash-ext-lirc gnash-ext-mysql gnash-tools klash konqueror-plugin-gnash python-gtk-gnash libgnuradio-wavelet3.7.10 gpaw gr-osmosdr gramofile gtkwave gvb gwave gwc python-hachoir-metadata python-hachoir-parser libhealpix-cxx-dev libhealpix-cxx0 libhealpix-java libhealpix-java-doc python-healpy-data horgand horgand-data htsengine libhtsengine-dev libhtsengine1 libhugs-alut-bundled hydrogen jack jack-capture jnoise libjs-jquery-jplayer kid3 kid3-cli kid3-core kid3-qt kradio4 kwave laserboy laserboy-indep ldm-themes libao-common libao-dbg libao-dev libao4 libaudclient-dev libaudclient2 libaudio-scan-perl libaudio-wav-perl libccaudio2-2 libccaudio2-dev epsilon-bin libepsilon-dev libepsilon1 extract libextractor3 libg3d-plugins gigtools libimage-seek-perl libimage-size-perl libinstpatch-1.0-0 libinstpatch-dev libinstpatch-doc libmediainfo-dev libmediainfo-doc libmediainfo0v5 python-mediainfodll python3-mediainfodll libmikmod-config libmikmod-dev libmikmod3 libmpcdec-dev libmpcdec6 musepack-tools libsndfile1 lightspeed lirc-x ll-scope mcp-plugins mda-lv2 mediainfo mediainfo-gui mhwaveedit milkytracker minimodem mixxx mixxx-data mm3d moc monitoring-plugins-standard moosic morse2ascii mp3burn mp3cd mp3roaster mpd multimail music123 pypy-mutagen python-mutagen python-mutagen-doc python3-mutagen normalize-audio octave-ltfat octave-ltfat-common octave-signal omins open-invaders open-invaders-data libopenjp2-7 libopenjp2-7-dev libopenjp3d7 libopenjpip7 libopenzwave-doc libopenzwave1.5 libopenzwave1.5-dev openzwave libotbwavelet-5.8-1 pacpl paulstretch pd-bassemu pd-creb pd-cxc pd-ext13 pd-lyonpotpourri phasex psi4 psi3 puddletag pulseaudio-utils pulseaudio-dlna python-pysynphot python3-pysynphot python-dtcwt python-dtcwt-doc python3-dtcwt pyvnc2swf python-pywt python-pywt-doc python3-pywt qjackrcd qmidiarp qmmp quelcom exfalso quodlibet r-cran-rcppgsl ruby-carrierwave ruby-wavefile libsdl-sound1.2 libsdl-sound1.2-dev shineenc shntool sidplay-base siggen silverjuke libsnack-alsa libsnack-oss python-tksnack python3-tksnack tcl-snack tcl-snack-dev tcl-snack-doc sonic soundconverter soundscaperenderer soundscaperenderer-common soundscaperenderer-nox soundstretch soundstretch-dbg libsox-fmt-base sox speech-tools squeezelite squeezelite-pa steghide steghide-doc stymulator libsubtitleeditor-dev libsubtitleeditor0 subtitleeditor libswami-dev libswami0 swami sweep sweep-dev swfmill swftools swftools-dbg swh-lv2 swh-plugins libtag1-dev libtag1-doc libtag1v5 libtag1v5-vanilla libtagc0 libtagc0-dev libtag-extras-dev libtag-extras1 terminatorx tessa tessa-mpi testdisk texlive-latex-extra timemachine timidity transcalc ttf-aenigma vamp-examples vco-plugins xul-ext-video-without-flash view3dscene libwaili-dev libwaili1c2 wav2cdr wavbreaker wavemon wavesurfer libwavpack-dev libwavpack1 wavpack wavtool-pl whysynth wildmidi wings3d wmwave wsynth-dssi xawtv-tools xcfa xcfa-dbg xdesktopwaves xfce4-goodies xfce4-wavelan-plugin xmms2-plugin-wavpack xscreensaver-data yaret yorick-yeti youtube-dl zita-resampler 2>&1 | tee -a logfile.log
log_error;

#
# wine
#
# libwinpr-asn1-0.1 - Windows Portable Runtime library (ASN1 library)
# libwinpr-bcrypt0.1 - Windows Portable Runtime library (bcrypt library)
# libwinpr-credentials0.1 - Windows Portable Runtime library (credentials library)
# libwinpr-credui0.1 - Windows Portable Runtime library (credeui library)
# libwinpr-crt0.1 - Windows Portable Runtime library (crt library)
# libwinpr-crypto0.1 - Windows Portable Runtime library (crypto library)
# libwinpr-dbg - Windows Portable Runtime library (debug symbols)
# libwinpr-dev - Windows Portable Runtime library (development files)
# libwinpr-dsparse0.1 - Windows Portable Runtime library (dsparse library)
# libwinpr-environment0.1 - Windows Portable Runtime library (environment library)
# libwinpr-error0.1 - Windows Portable Runtime library (error library)
# libwinpr-file0.1 - Windows Portable Runtime library (file library)
# libwinpr-handle0.1 - Windows Portable Runtime library (handle library)
# libwinpr-heap0.1 - Windows Portable Runtime library (heap library)
# libwinpr-input0.1 - Windows Portable Runtime library (input library)
# libwinpr-interlocked0.1 - Windows Portable Runtime library (interlocked library)
# libwinpr-io0.1 - Windows Portable Runtime library (io library)
# libwinpr-library0.1 - Windows Portable Runtime library (library)
# libwinpr-path0.1 - Windows Portable Runtime library (path library)
# libwinpr-pipe0.1 - Windows Portable Runtime library (pipe library)
# libwinpr-pool0.1 - Windows Portable Runtime library (pool library)
# libwinpr-registry0.1 - Windows Portable Runtime library (registry library)
# libwinpr-rpc0.1 - Windows Portable Runtime library (RPC library)
# libwinpr-sspi0.1 - Windows Portable Runtime library (sspi library)
# libwinpr-sspicli0.1 - Windows Portable Runtime library (sspicli library)
# libwinpr-synch0.1 - Windows Portable Runtime library (synch library)
# libwinpr-sysinfo0.1 - Windows Portable Runtime library (sysinfo library)
# libwinpr-thread0.1 - Windows Portable Runtime library (thread library)
# libwinpr-timezone0.1 - Windows Portable Runtime library (timezone library)
# libwinpr-utils0.1 - Windows Portable Runtime library (utils library)
# libwinpr-winhttp0.1 - Windows Portable Runtime library (winhttp library)
# libwinpr-winsock0.1 - Windows Portable Runtime library (winsock library)
# gnome-colors - set of GNOME icon themes
# gnome-wine-icon-theme - red variation of the GNOME-Colors icon theme
# gnome-exe-thumbnailer - Wine .exe and other executable thumbnailer for GNOME
# innoextract - Tool for extracting data from an Inno Setup installer
# libkwineffects9 - KDE window manager effects library
# mingw-w64-i686-dev - Development files for MinGW-w64 targeting Win32
# mingw-w64-x86-64-dev - Development files for MinGW-w64 targeting Win64
# python-neo - Python IO library for electrophysiological data formats
# q4wine - Qt GUI for wine (WINE)
# shiki-colors - set of Metacity/GTK-2+ themes
# shiki-wine-theme - red variation of the Shiki-Colors theme
# tellico - Collection manager for books, videos, music, etc
# tellico-data - Collection manager for books, videos, music, etc [data]
# tellico-doc - Collection manager for books, videos, music, etc [doc]
# tellico-scripts - Collection manager for books, videos, music, etc [scripts]
# twine - utility for interacting with PyPI
# unmass - Extract game archive files
# fonts-wine - Windows API implementation - fonts
# libwine - Windows API implementation - library
# libwine-dev - Windows API implementation - development files
# wine - Windows API implementation - standard suite
# wine-binfmt - Windows API implementation - binfmt support
# wine32 - Windows API implementation - 32-bit binary loader
# wine32-preloader - Windows API implementation - prelinked 32-bit binary loader
# wine32-tools - Windows API implementation - 32-bit developer tools
# libwine-development - Windows API implementation - library
# libwine-development-dev - Windows API implementation - development files
# wine-development - Windows API implementation - standard suite
# wine32-development - Windows API implementation - 32-bit binary loader
# wine32-development-preloader - Windows API implementation - prelinked 32-bit binary loader
# wine32-development-tools - Windows API implementation - 32-bit developer tools
echo $TOTDATE
ACTION="wav"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install gnome-colors gnome-wine-icon-theme gnome-exe-thumbnailer innoextract libkwineffects9 mingw-w64-i686-dev mingw-w64-x86-64-dev python-neo q4wine shiki-colors shiki-wine-theme tellico tellico-data tellico-doc tellico-scripts twine unmass fonts-wine wine wine-binfmt wine32 wine32-preloader wine32-tools 2>&1 | tee -a logfile.log
log_error;

#
# xoscope
#
# xoscope - digital oscilloscope
echo $TOTDATE
ACTION="xoscope"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install xoscope 2>&1 | tee -a logfile.log
log_error;

#
# yoshimi
#
# yoshimi - software synthesizer originally based on ZynAddSubFX2
# yoshimi-data - Presets for Yoshimi
echo $TOTDATE
ACTION="yoshimi"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install yoshimi yoshimi-data 2>&1 | tee -a logfile.log
log_error;

#
# zynaddsubfx
#
# yoshimi - software synthesizer originally based on ZynAddSubFX2
# yoshimi-data - Presets for Yoshimi
# zynadd - ZynAddSubFX engines converted to LV2 plugin format
# zynaddsubfx - Realtime software synthesizer for Linux
# zynaddsubfx-data - Realtime software synthesizer for Linux (data)
# zynaddsubfx-dssi - dssi plugin of zynaddsubfx
echo $TOTDATE
ACTION="zynaddsubfx"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install yoshimi yoshimi-data zynadd zynaddsubfx zynaddsubfx-data zynaddsubfx-dssi 2>&1 | tee -a logfile.log
log_error;

#
# Subsets of applications and Plugins from A to Z
# Section of the sources set up in file /etc/apt/sources.list: contrib and non-free
#

#
# playonlinux
#
# playonlinux - front-end for Wine
echo $TOTDATE
ACTION="playonlinux"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
$APPS install playonlinux 2>&1 | tee -a logfile.log
log_error;

#
# sorcer
#
# irssi-scripts - collection of scripts for irssi
# lure-of-the-temptress - classic 2D point and click fantasy adventure game
# openarena-081-players-mature - OpenArena game data - "mature" player graphics from 0.8.1
# pccts - The Purdue Compiler Construction Tool Set (PCCTS).
# scummvm - engine for several graphical adventure games
# scummvm-data - engine for several graphical adventure games (data files)
# wesnoth-1.12-dw - "Dead Water" official campaign for Wesnoth (branch 1.12)
# fheroes2-pkg - fheroes2 package downloader and builder
# game-data-packager - Installer for game data files
# zangband - A single-player, text-based, roguelike game
echo $TOTDATE
ACTION="sorcer"
echo "Subset: "$ACTION":" 2>&1 | tee -a logfile.log
#NO-AUDIO-MATCHES
#$APPS install 2>&1 | tee -a logfile.log

#
# Remove unnecessary packages
#
$APPS autoremove 2>&1 | tee -a logfile.log

#
# Farewall
#
echo "Installation process complete. Verify the applications with:"
echo "Applications menu"
echo "$ dpkg --get-selections"
echo "dpkg -l | grep 'APPNAME'"
echo "$ aptitude"
echo "$ ls /var/cache/apt/archives | more" 
echo "etc.."
echo "Don't forget to re-establish your sources files if you need"
echo "Thanks for using the script and enjoy the apps..."


