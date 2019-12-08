ssato.assertive_programming_examples
======================================

Ansible example role to demonstrate asseritve programming style in Ansible.

.. image:: https://img.shields.io/travis/ssato/ansible-role-assertive-programming-examples.png
   :target: https://travis-ci.org/ssato/ansible-role-assertive-programming-examples
   :alt: [Test Status]


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

.. vim:sw=2:ts=2:et:
