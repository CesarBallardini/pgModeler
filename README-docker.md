# README - create a Docker image and run pgModeler from a container

## How to use this repository

* Clone the repo

```bash
git clone https://github.com/CesarBallardini/pgModeler.git
```

* You can set the version of the program to build in `build-image.sh`. The builder will work for pgModeler versions that uses Qt6.  You need to change the variable like:

```bash
PGMODELER_VERSION="1.1.3"
````

* Build the image

```bash
./build-image.sh
# it took 30 minutes approx.
```

* Run the pgModeler program

```bash
./run-container-on-ubuntu.sh
```

## Appendix A: Requisites

This was tested using Ubuntu 22.04.4 (2024-07-07) and `docker-ce` version `5:27.0.3-1~ubuntu.22.04~jammy`.


