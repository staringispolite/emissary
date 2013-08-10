import os
from pyramid.view import view_config
from pyramid.response import Response
from . import *

here = os.path.dirname(os.path.abspath(__file__))
class Home(BaseController):

    @view_config(route_name='home', renderer='home/index.mako')
    def index(self):
        sign_up_text = """
        """
        return {'description_text': sign_up_text}

    def launchrock(request):
        _robots = open(os.path.join(
                  here, '../static', 'index.html')).read()
        _robots_response = Response(content_type='text/html',
                                body=_robots)
        return _robots_response

