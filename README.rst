ssato.assertive_programming_examples
======================================

Ansible example role to demonstrate asseritve programming style in Ansible.

.. image:: https://github.com/ssato/ansible-role-assertive-programming-examples/workflows/Tests/badge.svg
   :target: https://github.com/ssato/ansible-role-assertive-programming-examples/actions?query=workflow%3ATests
   :alt: [GitHub Actions Status]

.. TODO:
.. .. image:: https://dev.azure.com/satorusatoh0471/ansible-role-assertive-programming-examples/_apis/build/status/ssato.ansible-role-assertive-programming-examples?branchName=master
   :target: https://dev.azure.com/satorusatoh0471/ansible-role-assertive-programming-examples/_build/latest?definitionId=1
   :alt: [Azure Pipelines Status]

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
