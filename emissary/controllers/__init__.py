import time

from pyramid.response import Response
from emissary.models import mc
from emissary import models
from emissary.lib import auth

class ApiException(Exception):
  pass

class BaseController(object):
  def __init__(self, request):
    self.request = request
    self.user_id = None

  def required_params(self, required):
    for p in required:
      v = self.request.params.get(p)
      if v is None:
        raise ApiException('Missing parameter: %s' % p)
      yield v

  def optional_params(self, optional):
    for p in optional:
      v = self.request.params.get(p)
      yield v

def api(f):
  def _wrap(context, request):
    try:
      # rate limit
      ip = request.remote_addr
      minute = time.time() // 60
      key = 'rate_limite_%s_%s' % (ip, minute)
      rate = models.mc.incr(key)
      if rate > 200:
        raise ApiException("Too many requests")
      if not rate:
        models.mc.set(key, 1)
      response = f(context, request)
      body = response.body
      response.body = '{"response": %s}' % body
      return response
    except ApiException, e:
      return Response(body='{"response":"", "error": "%s"}' % str(e), content_type='application/json', charset='UTF-8')
  return _wrap

def authed_api(f):
  def _wrap(context, request):
    try:
      if (request and request.params.get('token')) or request.cookies.get('token'):
        token = request.params.get('token')
        if not token:
          token = request.cookies.get('token')
        user_id = auth.decode_token(token).split('|')[0]
        request.user_id = user_id
        response = f(context, request)
        body = response.body
        response.body = '{"response": %s}' % body
        return response
      else:
        raise ApiException('Auth token required for this api call')
    except ApiException, e:
      return Response(body='{"response":"", "error": "%s"}' % str(e), content_type='application/json', charset='UTF-8')
  return _wrap
