emissary README
==================

Getting Started
---------------

- > cd <directory containing this file>

- > mkvirtualenv emissary

- > $venv/bin/python setup.py develop
--- If you get the error "EnvironmentError: mysql_config" on OS X Mountain Lion
    or later, then append /mysql/bin to your path.
    eg. 'export PATH=$PATH:/usr/local/mysql/bin'

- > $venv/bin/initialize_emissary_db development.ini

- > $venv/bin/pserve development.ini


