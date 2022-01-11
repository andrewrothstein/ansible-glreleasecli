andrewrothstein.glreleasecli
=========

![Build Status](https://github.com/andrewrothstein/ansible-glreleasecli/actions/workflows/build.yml/badge.svg)

Installs the GitLab [release-cli](https://gitlab.com/gitlab-org/release-cli).

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
    - andrewrothstein.glreleasecli
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
