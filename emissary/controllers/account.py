from pyramid_handlers import action

from pyramid.response import Response
from . import *
from emissary.lib import account, auth

class Account(BaseController):

    @action(renderer='json')
    @api
    def create(self):
        email = self.request.params.get('email')
        password = self.request.params.get('password')

    @action(renderer='json')
    @api
    def get(self):
        pass
