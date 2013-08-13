from sqlalchemy import (
    Column,
    Integer,
    Text,
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

class User(Base):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True)
    email = Column(Text, unique=True)
    password = Column(Text)

    def __init__(self, email, password):
        print mc
        self.email = email
        self.password = password

class BetaUser(Base):
    __tablename__ = 'beta_user'
    id = Column(Integer, primary_key=True)
    email = Column(Text, unique=True)

    def __init__(self, email):
        self.email = email
