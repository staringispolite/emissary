import uuid
import json
from hashlib import sha512

from sqlalchemy import (
  Column,
  Integer,
  Text,
  ForeignKey,
  DateTime,
  )

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.orm import (
  scoped_session,
  sessionmaker,
  )

from zope.sqlalchemy import ZopeTransactionExtension

DBSession = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
Base = declarative_base()
mc = None
class EventType(Base):
  __tablename__ = 'event_type'
  id = Column(Integer, primary_key=True)
  ident = Column(Text)
  name = Column(Text)

class Event(Base):
  __tablename__ = 'event'
  id = Column(Integer, primary_key=True)
  event_type_id = Column(Integer, ForeignKey('event_type.id'))
  user_id = Column(Integer, ForeignKey('user.id'))
  time = Column(Integer)
  notes = Column(Text)
  def __json__(self, request):
    return {
        'id': self.id,
        'event_type_id': self.event_type_id,
        'user_id': self.user_id,
        'time': self.time,
        'notes': json.loads(self.notes),
        }
class User(Base):
  __tablename__ = 'user'
  id = Column(Integer, primary_key=True)
  email = Column(Text, unique=True)
  password = Column(Text)
  salt = Column(Text)
  SUPERSALT = 'fasdi4n9(NN)nuiedn*U'

  def __init__(self, email, password):
    self.email = email
    self.salt = str(uuid.uuid4())
    self.password = sha512(self.salt + password + self.SUPERSALT).hexdigest()

  @classmethod
  def get_authed(self, email, password):
    user = DBSession.query(User).filter(User.email==email).first()
    if user and user.password == sha512(user.salt + password + self.SUPERSALT).hexdigest():
      return user
    else:
      return None

class BetaUser(Base):
  __tablename__ = 'beta_user'
  id = Column(Integer, primary_key=True)
  email = Column(Text, unique=True)

  def __init__(self, email):
    self.email = email
