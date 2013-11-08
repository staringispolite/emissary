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

- > $venv/bin/pserve development.ini
--- If you get an error on 'from Crypto.Cipher import AES' no such module found,
    run 'pip install pycrypto'. It's in setup.py as a dependency, but didn't work
    for Jon.
