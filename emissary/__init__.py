import os
import memcache

from pyramid.config import Configurator
from sqlalchemy import engine_from_config

from .models import (
  DBSession,
  Base,
  )

from .controllers.account import Account
from .controllers.home import Home

def main(global_config, **settings):
  """ This function returns a Pyramid WSGI application.
  """
  engine = engine_from_config(settings, 'sqlalchemy.')
  DBSession.configure(bind=engine)
  Base.metadata.bind = engine
  here = os.path.dirname(os.path.abspath(__file__))
  settings['mako.directories'] = os.path.join(here, 'templates')
  config = Configurator(settings=settings)
  config.add_static_view('static', 'static', cache_max_age=3600)
  config.scan()
  config.add_route('home', '/')
  config.add_route('account', '/account/{action}')
  models.mc = memcache.Client([settings['memcached.url']], debug=0)

  return config.make_wsgi_app()
