import os

from pyramid.config import Configurator
from sqlalchemy import engine_from_config

from .models import (
    DBSession,
    Base,
    )

from .controllers import (
    Account,
    Home
    )


def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    engine = engine_from_config(settings, 'sqlalchemy.')
    print engine
    DBSession.configure(bind=engine)
    Base.metadata.bind = engine
    config = Configurator(settings=settings)
    config.add_static_view('static', 'static', cache_max_age=3600)
    config.include('pyramid_handlers')
    config.scan()
    config.add_handler('account', 'account/{action}', handler=Account)
    config.add_handler('home', '/', handler=Home, action='index')
    return config.make_wsgi_app()
