# mlat-client

This is a client that selectively forwards Mode S messages to a
server that resolves the transmitter position by multilateration of the same
message received by multiple clients.

The corresponding server code is available at
https://github.com/flightsurf/mlat-server.

## Building

Due to conflicting packages with the same name, it's recommended to install in a Python virtual environment.
First set the direcory you'd like to install to, if that path is not writeable by your user, use `sudo su` to become root first.
```
VENV=/usr/local/share/flightsurf-mlat-client/venv
```
Now the build / install, it's not a bad idea to recreate the virtual environment when rebuilding:
```
rm -rf "$VENV"
python3 -m venv "$VENV"
source "$VENV/bin/activate"
python3 -c "import setuptools" || python3 -m pip install setuptools
python3 -c "import asyncore" || python3 -m pip install pyasyncore
python3 setup.py build
python3 setup.py install
```
Or you can run install.sh provided in this repository.

To run it, invoke:
```
/usr/local/share/flightsurf-mlat-client/venv/bin/mlat-client
```


## Running

If you are connecting to a third party multilateration server, contact the
server's administrator for configuration instructions.

## Supported receivers

* Anything that produces Beast-format output with a 12MHz clock:
 * readsb, dump1090-mutability, dump1090-fa
 * an actual Mode-S Beast
 * airspy_adsb in Beast output mode
* Radarcape in 12MHz mode
* Radarcape in GPS mode

## Unsupported receivers

* The FlightRadar24 radarcape-based receiver. This produces a deliberately
crippled timestamp in its output, making it useless for multilateration.
If you have one of these, you should ask FR24 to fix this.
