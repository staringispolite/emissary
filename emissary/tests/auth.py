import transaction
from emissary.tests import IntegrationTestBase

class AuthTest(IntegrationTestBase):
  def test_root(self):
    res = self.testapp.get('/', status=200)

  def test_create_api(self):
    test_email = 'test123@asdfa.com'
    test_password = 'test123e'
    res = self.testapp.post('/account/create', dict(email=test_email, password=test_password))
    self.assertFalse(res.json.get('error'))
    from emissary.models import DBSession, User
    user = DBSession.query(User).filter(User.email==test_email).first()
    self.assertTrue(user)
    self.assertEqual(test_email, user.email)

    res = self.testapp.post('/account/login', dict(email=test_email, password=test_password))
    self.assertTrue(res.json['response']['token'])
    res = self.testapp.post('/account/login', dict(email=test_email, password='test123edd'))
    self.assertTrue(res.json['error'])
    DBSession.delete(user)
    transaction.commit()
