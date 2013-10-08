from pyramid.response import Response
from pyramid.view import view_config
from email.utils import parseaddr
from . import *

from emissary.models import BetaUser, DBSession, User
class Account(BaseController):

  @view_config(renderer='json', route_name='account', match_param='action=create', decorator=api)
  def create(self):
    email, password = self.required_params(['email','password'])
    email = parseaddr(email)
    if email and email[1]:
      old_user = DBSession.query(User).filter(User.email==email[1]).first()
      if not old_user:
        new_user = User(email[1], password)
        DBSession.add(new_user)
        return {'token': auth.issue_token(new_user.id)}
      else:
        raise ApiException('The e-mail you have entered already exists in our system.')
    else:
      raise ApiException('Invalid Email')

    return False

  @view_config(renderer='json', route_name='account', match_param='action=login', decorator=api)
  def login(self):
    email, password = self.required_params(['email','password'])
    user = User.get_authed(email, password)
    if user:
      return {'token': auth.issue_token(user.id)}
    else:
      raise(ApiException('Login Failed'))

  @view_config(renderer='json', route_name='account', match_param='action=create_beta', decorator=api)
  def create_beta(self):
    email, = self.required_params(['email'])
    email = parseaddr(self.request.params.get('email'))
    if email and email[1]:
      old_user = DBSession.query(BetaUser).filter(BetaUser.email==email[1]).first()
      if not old_user:
        new_user = BetaUser(email[1])
        DBSession.add(new_user)
        return True
      else:
        raise ApiException('The e-mail you have entered already exists in our system.')
    return False
