#! /bin/bash

picocom -b 115200 --imap lfcrlf --omap crlf --echo /dev/ttyACM1
