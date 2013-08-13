from pyramid.response import Response
from pyramid.view import view_config
from email.utils import parseaddr
from . import *

from emissary.models import BetaUser, DBSession
class Account(BaseController):

    @view_config(renderer='json', route_name='account', match_param='action=create', decorator=api)
    def create(self):
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
