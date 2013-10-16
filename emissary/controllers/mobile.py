from pyramid.view import view_config
from pyramid.response import Response
from . import *

class Mobile(BaseController):
  @view_config(route_name='mobile', renderer='mobileapp.mako')
  def index(self):
    return {}

