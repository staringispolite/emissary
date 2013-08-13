from pyramid.response import Response
from pyramid.view import view_config
from email.utils import parseaddr
from . import *

from emissary.models import BetaUser

class Account(BaseController):

    @view_config(renderer='json', route_name='account', match_param='action=create')
    @api
    def create(self):
        email = parseaddr(self.request.params.get('email'))
        if email and email[1]:
            new_user = BetaUser(email[1])
            DBSession.add(new_user)
        return True
