.. |date| date:: %Y/%m/%d
.. |time| date:: %H:%M


================
 Diskless Linux
================
-------------------------
Surviving Without Storage
-------------------------


:Authors:
  Hugo Delahousse

.. beamer-note:: Bonjour, Hugo Delahousse
  ajd je vais vous parler de Diskless Linux


~~~~~~~~~~~~~
Introduction
~~~~~~~~~~~~~


Terms used in the presentation
================================


.. beamer-note:: Parle en francais

Node
  A computer or workstation connected to a central network

Diskless
  Something without storage

Slave / Client
  A diskless node that will rely on a Master node for storage
  and booting

Master / Server
  A node that will allow slaves to boot and store data



What does Diskless mean ?
===============================

.. beamer-note:: Les nodes diskless n'ont pas de hdd,
  impossible de boot normalement


* Node without storage (HDD / SSD)

* Impossible to boot from a local OS

* Impossible to save data on the computer

* Solution: Network Booting / Storage



Why use Diskless Linux
=======================


.. beamer-note:: Vu que les clients utilise un OS qui est centralise
  sur le serveur, chaque changement sur le serveur vont etre
  automatiquement deploye a prochain boot (nouveau logiciel, updates...)
  Pas forcement envie d'acheter des lecteurs disques ou des HDD

* Automatic propagation of software changes to the slave nodes

* No need to buy storage for every node

Diskless Vs Remote
============================

.. beamer-note:: Delege la puissance de calculs
  et la memoire vive (On peux pas avoir enormenent de sessions remote
  en meme temps sans bottleneck / lag)
  Remote c'est de la merde (quand on a beaucoup de nodes)

Why not use remote sessions ?

* The slave uses its own RAM

* The slave uses its own processing power (CPU / GPU)

* More scalable


~~~~~~~~~~~~~~
Diskless Boot
~~~~~~~~~~~~~~


Requirements
=============

To boot the slave node, we need

.. beamer-note:: Un OS et un endroit ou stocker des donnes

* An available filesystem

* An OS to boot on

Filesystem
===========================

.. beamer-note:: Les donnees vont etre stocker sur une (ou plusieurs)
  autres machines du network

Since we need a way to store files and data, we need a filesystem.
Without a disk, we have to use a Distributed File System (DFS)

There a multiple DFS today:

  * Ceph
  * GlusterFS (Epita, before OpenAFS)
  * OpenAFS (Epita)

Boot image
===========================

The slave needs an image to boot on. It is usually transfered by the
master by TFTP (Trivial File Transfer Protocol)

Usually not the actual OS, but a boot manager with more
advanced networking capabilities.

The actual OS can then be downloaded via HTTP, Bittorent, [S]FTP...


Setting up the Client
=========================

* Set the BIOS to boot on network

* The network card with with PXE (or Etherboot) software in ROM

  * gPXE -> iPXE (Easier process, allows HTTP and other protocols)

Setting up the Server
=======================

* Setup (PXE enabled) DHCP and TFTP servers

* Setup the DFS for the clients to use

PXE Process
============

* Client sends DHCPDISCOVER

* Server sends back DHCPOFFER

* Client sets up IP Address, IP Mask...

* Clients downloads a Network Boostrap Program into RAM

* Clients boots on the NBP (Distro, Grub, iPXE, PXELINUX, ...)

* [OPTIONAL] Client chooses an OS on the NBP, downloads it and boots into it


Linux and Network Booting
==========================

Linux offer multiple lightweight MBR to boot into

* SYSLINUX -> PXELINUX

* Most distributions can be loaded directly (slow) or by the NBP
