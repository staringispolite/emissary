import unittest
from pyramid import testing
from paste.deploy.loadwsgi import appconfig
from webtest import TestApp
import os
from zope.sqlalchemy import ZopeTransactionExtension
here = os.path.dirname(__file__)
settings = appconfig('config:' + os.path.join(here, '../../', 'development.ini'))

def _initTestingDB():
  from sqlalchemy import create_engine
  from emissary.models import (
    DBSession,
    Base
    )

  engine = create_engine(settings['sqlalchemy.url'])
  Base.metadata.create_all(engine)
  DBSession.configure(bind=engine)
  return DBSession

class IntegrationTestBase(unittest.TestCase):
  def setUp(self):
    from emissary import main
    app = main({}, **settings)
    from webtest import TestApp
    self.testapp = TestApp(app)
    _initTestingDB()

  def tearDown(self):
    del self.testapp
    from emissary.models import DBSession
    DBSession.remove()
