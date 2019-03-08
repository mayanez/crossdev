# crossdev
:earth_africa: multiarch cross compiling environment

![](https://raw.githubusercontent.com/multiarch/dockerfile/master/logo.jpg)

This is a [multiarch](https://github.com/multiarch) Docker build environment image.
You can use this image to produce binaries for multiple architectures.

It leverages multiple of the [multiarch](https://github.com/multiarch) family of projects:
* [qemu-user-static](https://github.com/multiarch/qemu-user-static)
* [crossbuild](https://github.com/multiarch/crossbuild)
* [debian-debootstrap](https://github.com/multiarch/debian-debootstrap)

This project leverages [distcc](https://github.com/distcc/distcc) for efficient compilation across a wide variety of architectures.
A QEMU architecture specific docker environment is used as a master node, managing any external package dependencies via the distro's package manager.
A second docker environment is used to host the cross-compiler to natively compile code.

## Why & How?

* Huge performance savings and better management of dependencies.

* Header resolution and library linking done locally inside of QEMU.

* Build doesn't have to be cross-compile aware, or configured for cross-compiling. As far as the build is concerned, it's building natively.

* The `distcc` in a nutshell: 
When told to compile `.c` files to `.o` files it 
(1) calls the preprocessor on each `.c` file (`gcc -E`) to resolve the includes 
(2) sends the preprocessed `.c` file through the network to a server
(3) server compiles preprocessed `.c` code into `.o` object code
(4) sends the `.o` file back when done
(5) copies `.o` file back through network to local filesystem
(6) calls the local compiler to link the `.o` files together


---

## Prerequisites

Register `qemu-*-static` for all supported processors except the current one
* `./setup_prereq.sh`

Register shell helper functions for simplified use. Add the following to your `.bashrc`:
* `. `pwd`/docker-cross.rc`

## Setup

`export DOCKER_CROSS_PATH=/path/to/mount/in/container`

## Run

Navigate to the desired architecture and run `docker-compose up`.
You may then use the `docker-cross-run` command from the `docker-cross.rc` to run commands inside of the container.

---

## Examples

### Hello World

 TODO: Add simulated terminal for compiling & running helloworld

### GDB Debugging
`docker-cross-run gdbserver :2000 <your_binary>`

