First plug in receive side
Then plug in data-logger

To start logging,

    $ picocom -b 115200 --imap lfcrlf --omap crlf --echo /dev/ttyACM1
    v=1
    r=1
    T=2
    t=5
    a=5

To start plotting

    python monitor.py /dev/ttyACM0 | cplot -x 0 -y 3

Reference values (from [engineering toolbox](http://www.engineeringtoolbox.com/water-salinity-d_1251.html)

- Saline in Water
- fresh water (typical city water in United States) : < 100 ppm
- water supply typicaly restricted to : 500 ppm
- fresh water - official salt concentration limits in drinking water US: 1000 ppm
- typical limit agriculture irrigation : 2000 ppm
- brackish water, mildly : 1000 - 5,000 ppm
- brackish water, moderately : 5000 - 15,000 ppm
- brackish water, heavily : 15,000 - 35,000 ppm
- sea water : 30,000 - 50,000 ppm (approx. 35,000)
- brine > 50.000 ppm
- Dead sea : 330.000 ppm
