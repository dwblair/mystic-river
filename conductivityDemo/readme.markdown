First plug in receive side
Then plug in data-logger

To start logging,

    $ picocom -b 115200 --imap lfcrlf --omap crlf --echo /dev/ttyACM1
    v=1
    r=1
    T=5
    t=5
    a=5

To start plotting

    python monitor.py /dev/ttyACM0 | cplot -x 0 -y 3
