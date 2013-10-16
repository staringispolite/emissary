from pyramid.response import Response
from pyramid.view import view_config
from email.utils import parseaddr
from . import *

from emissary.models import BetaUser, DBSession, User
class Event(BaseController):
  @view_config(renderer='json', route_name='event', match_param='action=get_all', decorator=authed_api)
  def get_events(self):
    events = models.DBSession.query(models.Event).filter(models.Event.user_id==self.request.user_id).all()
    print events
    return events
