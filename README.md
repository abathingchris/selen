selen
=====

selen is a vagrant setup for selenium grid  

Version
-------

0.0.1

Setup
-----

selen requires the following:

* [Vagrant v1.3.5+] - tool for automating environments
* [Virtualbox v4.3+] - virtualization software

Start the vagrant instances with

```bash
vagrant up
```
##### There are two boxes named:
* grid
* node

Once the boxes have started, you can SSH into each box using `vagrant ssh [box name]`.

You can also see the status of the boxes with `varant status`.

From there you can find the project located at `/vagrant`.

Continuous Integration
----------------------
[Travis](link)

Test
----

Deploy
------

Release
-------

[What is the release process used by this project?]

[We curently use GitFlow on most of our projects but your specific technology may need additional steps for preperation for release.]

This project uses the [Git Flow](https://confluence.meltdev.com/display/DEV/Git+Flow) process for getting changes into the project.

  [Vagrant v1.3.5+]: http://downloads.vagrantup.com/tags/v1.3.5
  [VirtualBox v4.3+]: https://www.virtualbox.org/wiki/Downloads