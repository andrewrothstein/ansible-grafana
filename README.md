andrewrothstein.grafana
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-grafana.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-grafana)

Installs [Grafana](https://grafana.com).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.grafana
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
