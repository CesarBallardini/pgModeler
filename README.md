# README - compile and run pgModeler using a Virtualbox VM

As described in it's repo, https://github.com/pgmodeler/pgmodeler :

«An open-source, multiplatform database modeler for PostgreSQL. This project aims to be a reference database design tool when it comes to FOSS in the PostgreSQL ecosystem. Its feature-rich interface allows quick data modeling and fast code deployment on a server. It also supports reverse engineering by creating a visual representation of existing databases. Besides, pgModeler can also generate SQL scripts to sync a model and a database through the process called diff. This tool is not about modeling only, it also counts with a minimalist but functional database server administration module that allows the execution of any sort of SQL commands, and provides database browsing and data handling in a simple and intuitive UI.»

You can use pgModeler [from a Virtualbox virtual machine](README-virtualbox.md)

Or you can use it [from a Docker container](README-docker.md).

BTW, thank you Kayvan Sylvan for the tips on `Dockerfile` in [your Docker Hub image](https://hub.docker.com/r/kayvan/pgmodeler).

## References

* https://medium.com/@mglaving/tutorial-how-to-compile-and-install-pgmodeler-1-0-4-on-ubuntu-22-04-lts-jammy-from-source-code-16aafd273d5 Tutorial how to compile and install pgModeler 1.0.4 on Ubuntu 22.04 LTS Jammy from source code 2023-05-20

* Docker:
  * https://hub.docker.com/r/kayvan/pgmodeler/dockerfile (using x11vnc xvfb indide the container)
  * https://github.com/artis3n/pgmodeler-container/blob/main/Dockerfile (multi stage image, and secure by default, displays on GNU/Linux and OSX)
  * https://github.com/mviereck/x11docker x11docker: x11docker logo Run GUI applications in Docker or podman containers.  Avoid X security leaks and enhance container security.<br/>x11docker runs on Linux and (with some setup and limitations) on MS Windows. x11docker does not run on macOS.



* Windows based:
  * https://github.com/miniwark/miniwark-howtos/blob/master/build_pgModeler0.9.0_for_Windows_64-bit.md Build pgModeler 0.9.0 for Windows 64-bit
  * https://en.quillevere.net/programming/bdd/postgresql/compile-pgmodeler-windows_60618.htm Compile pgModeler on Windows
  * https://github.com/handcraftedbits/docker-pgmodeler-builder A Docker container that allows you to build pgModeler with one simple command. <br/> This container currently produces binaries for Windows x86_64 only. Other platforms are forthcoming.





* Docker:
  * https://hub.docker.com/r/kayvan/pgmodeler/dockerfile (using x11vnc xvfb indide the container)
  * https://github.com/apazga/docker-pgmodeler (display on GNU/Linux, MS Windows and OSX)
  * https://github.com/artis3n/pgmodeler-container/blob/main/Dockerfile (multi stage image, and secure by default, displays on GNU/Linux and OSX)
  * https://github.com/mviereck/x11docker x11docker: x11docker logo Run GUI applications in Docker or podman containers.<br/>
    Avoid X security leaks and enhance container security<br/>
    x11docker runs on Linux and (with some setup and limitations) on MS Windows. x11docker does not run on macOS.


* Windows based:
  * https://github.com/miniwark/miniwark-howtos/blob/master/build_pgModeler0.9.0_for_Windows_64-bit.md Build pgModeler 0.9.0 for Windows 64-bit
  * https://en.quillevere.net/programming/bdd/postgresql/compile-pgmodeler-windows_60618.htm Compile pgModeler on Windows

* X server:
  * https://wiki.lsce.ipsl.fr/pmip3/doku.php/other:x_conf Installing and configuring an X server (all operating systems)
  * https://www.uxora.com/unix/45-xdisplay-over-ssh-with-putty-xming-vcxsrv XDISPLAY over SSH with Putty & Xming/VcXsrv (MS Windows)

