.. include:: <s5defs.txt>
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



What does Diskless mean ?
===============================

.. class:: incremental

* Computer (nodes) without storage (HDD / SSD)

* Impossible to boot from a local OS

* Impossible to save data on the computer

* Solution: Network Booting / Storage


Terms used in the presentation
================================

Node
  A computer or workstation connected to a central network

Diskless
  Something without storage

Slave / Client
  A diskless node that will rely on a Master node for storage
  and booting

Master / Server
  A node that will allow slaves to boot and store data


Why use Diskless Linux
=======================

.. class:: incremental

* Automatic propagation of software changes to the slave nodes

* No need to buy storage for every node

Why not use remote sessions
============================

.. class:: incremental

* The slave uses its own RAM

* The slave uses its own processing power (CPU / GPU)

* More scalable

Diskless Boot
===========================

To boot the slave node, we need

  * An available filesystem

  * An OS to boot on

Diskless Boot - Filesystem
===========================

Since we need a way to store files and data, we need a filesystem.
Without a disk, we have to use a Distributed File System (DFS)

There a multiple DFS today:

  * Ceph
  * GlusterFS (Epita, before OpenAFS)
  * OpenAFS (Epita)


PXE
====

  The Preboot eXecution Environment (PXE, sometimes pronounced as pixie)
  specification describes a standardized client-server
  environment that boots a software assembly,
  retrieved from a network, on PXE-enabled clients

  - Wikipedia



Slave Configuration
======================

The slave's BIOS needs to register the networking card as a bootable
drive