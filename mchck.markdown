
# setting up if not on ubuntu:

If you have some setup other than ubuntu:

https://github.com/mchck/mchck/wiki/Getting-Started

- if you've made your board and have the bootloader installed, you can just follow the 'install toolchain software' section

- dfu-util needs to be upgraded? 

# installation instructions for ubuntu

    $ git clone https://github.com/bgamari/mchck
    $ cd mchck
    $ cd examples
    $ git clone https://github.com/bgamari/data-logger
    $ cd data-logger 
    $ make

press reset

    $ sudo make flash
    $ make console

you may need to follow the instructions here re: the summon-arm-toolchain:

http://bgamari.github.io/posts/2012-06-25-getting-started-with-mchck.html

i downloaded the file from: https://mchck.s3.amazonaws.com/sat-e35a85d-32bit.tar.bz2

into a directory 'sat' in my home directory, then did:

$ PATH=~/sat/bin:$PATH
$ export LD_LIBRARY_PATH=~/sat/lib:$LD_LIBRARY_PATH


need to install picocom for datalogger
sudo apt-get install picocom

Using the command line interface:

    [plug in fresh mchck]
    $ cd mchck/examples/data-logger
    $ sudo make flash
    $ data-logger info
    firmware version: aaed3986fbeda324ab0f21b2f051e81bdf1ca80e
    device ID: 24404e45-2d0011-ffff0052-ffffffff
    samples collected: 0
    flash: mfg=ef memtype=40 capacity=14
    RTC time: 1970-01-01T00:00:00 = 0
    sample period: 30 seconds
    acquisition: stopped

    sensors:
    1   temperature     unknown
    2   thermistor      Kelvin
    3   thermistor      Kelvin
    4   conductivity    arbitrary
    $ data-logger start
    The device time doesn't look valid. I've updated it for you.
    Acquisition started sampling every 30 seconds

Wait a bit,

    $ data-logger info
    firmware version: aaed3986fbeda324ab0f21b2f051e81bdf1ca80e
    device ID: 24404e45-2d0011-ffff0052-ffffffff
    samples collected: 6
    flash: mfg=ef memtype=40 capacity=14
    RTC time: 2014-01-02T04:31:50 = 1388637110
    sample period: 30 seconds
    acquisition: running

    sensors:
    1   temperature     unknown
    2   thermistor      Kelvin
    3   thermistor      Kelvin
    4   conductivity    arbitrary
    $ data-logger fetch
    # time         sensor    value
    1388637077     3         306.4710
    1388637077     2         304.9580
    1388637106     1         23.1310
    1388637106     3         306.6940
    1388637106     2         305.3190
    1388637136     1         23.1310
    1388637136     3         306.6220
    1388637136     2         305.9620
    1388637166     1         23.3620
    1388637166     3         306.7070
    1388637166     2         307.5180
