ssato.assertive_programming_examples
======================================

Ansible example role to demonstrate asseritve programming style in Ansible.

Requirements
------------

- ansible >= 2.9

Role Variables
--------------

SEEALSO: defaults/main.yml

Dependencies
------------

None.

Example Playbook
----------------

SEEALSO: tests/playbook.yml

::

  - hosts: all
    gather_facts: false
    connection: local
    roles:
      - role: ssato.assertive_programming_examples
        x: 42

License
-------

MIT
