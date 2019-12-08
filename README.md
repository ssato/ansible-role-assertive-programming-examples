ssato.assertive_programming_examples
======================================

Ansible example role to demonstrate asseritve programming style in Ansible.

![Test Status](https://img.shields.io/travis/ssato/ansible-role-assertive-programming-examples.png)

Requirements
------------

- ansible >= 2.9

Role Variables
--------------

.. seealso:: defaults/main.yml

Dependencies
------------

None.

Example Playbook
----------------

```
- hosts: all
  gather_facts: false
  connection: local
  roles:
    - role: ssato.assertive_programming_examples
      x: 42
```

License
-------

MIT

<!-- vim:sw=2:ts=2:et:
-->
