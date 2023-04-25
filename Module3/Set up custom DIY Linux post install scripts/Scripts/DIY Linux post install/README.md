DIY Linux post install
======================

Original Author: [Esteban Herrera](https://github.com/stvherrera)

> This project is my set of post-installation and maintenance scripts for Debian, to run on a fresh install. It's designed to install your favourite applications, set your preferred settings, etc. mostly automatically. 

Feel free to fork this project, modify to suit your preference, and distribute.

## Structure

This project is coded and organized in a modular fashion so you can easily delete or exclude parts that you don't want to use.

 * [`data`](/data): this folder contains files which are lists of packages read by various functions. It's recommended to update these to suit your preferences.
 * [`functions`](/functions): this folder contains bash files which are the main functions of this scriptset. They should require little modification.

## Usage

Simple, you just run the main script from the root of the source folder:

    ./DIY-Linux-post-install.sh

Or you can store this scriptset in some directory, and add that location to your custom shell paths to run on-demand. For example, adding it as the following line to your `.bashrc` (editing the path appropriately):

    export PATH=${PATH}:$HOME/scripts/DIY Linux post install/
