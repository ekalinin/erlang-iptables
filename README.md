erlang-iptables
===============

``erlang-iptables`` is a simple wrapper to ``iptables``. Without using any
``C`` libraries (``libiptc``, ``libxtables``, ...). Just ``os:cmd("iptables ...")``.
No any extra dependencies except ``iptables`` package and erlang.

Installation
============

Compile
-------

    $ make compile

Tests
-----

    $ make test

Docs
----

    $ make doc

Api
===

  * ``append``
  * ``check``
  * ``delete``
  * ``insert``
  * ``list``
  * ``flush``
  * ``zero``
  * ``create_chain``
  * ``delete_chain``
  * ``rename_chain``
  * ``policy``
  * ``is_installed``


Examples
========

```erlang
% append rule in the 'filter' table (default) and FILTER chain
iptables:append(input, "-i lo -j ACCEPT")).

%set default policy for chain
iptables:policy(input, drop).
```

LICENSE
=======

MIT
