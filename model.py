"""Pokesee Pokedo - Data Model"""

import os
from flask_sqlalchemy import SQLAlchemy
import datetime

db = SQLAlchemy()

SQLALCHEMY_DATABASE_URI = os.environ['DATABASE_URL']

###########################
#DECLARE BASE MODELS
###########################

class Encounter(db.Model):
    """Create an encounter instance given a pokemon and a location.

        Encounters is the primary view that will be used in application.
        Each encounter represents a waypoint on the map."""

    __tablename__='encounters'

    encounter_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    latitude = db.Column(db.Float)
    pokemon_id = db.Column(db.Integer, db.ForeignKey('poke_base.pokemon_id'))
    longitude = db.Column(db.Float)

    pokebase = db.relationship('PokeBase')

    def __repr__(self): # pragma: no cover
            """Provide helpful representation when printed."""

            return '<Encounter encounter_id=%s pokemon_id=%s latitude=%s longitude=%s>' % (self.encounter_id, self.pokemon_id, self.latitude, self.longitude)


class Location(db.Model):
    """Location records from Yelp.

        Each location represents a waypoint on the map."""

    __tablename__='locations'

    location_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    latitude = db.Column(db.Float)
    longitude = db.Column(db.Float)
    rating = db.Column(db.Integer)
    name = db.Column(db.String(100), nullable=False)
    url = db.Column(db.String(200))
    # display_phone = db.Column(db.String(15)) #poor handling if integer
    category = db.Column(db.String(50))

    def __repr__(self): # pragma: no cover
            """Provide helpful representation when printed."""

            return '<Location name=%s rating=%s latitude=%s longitude=%s>' % (self.name, self.rating, self.latitude, self.longitude)


class Gym(db.Model):
    """Location for Pokemon Gym."""

    __tablename__='gyms'

    gym_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    latitude = db.Column(db.Float)
    longitude = db.Column(db.Float)
    name = db.Column(db.String(100), nullable=False)

    def __repr__(self): # pragma: no cover
            """Provide helpful representation when printed."""

            return '<Gym name=%s latitude=%s longitude=%s>' % (self.name, self.latitude, self.longitude)


class User(db.Model):
    """User of PokeSee PokeDo."""

    __tablename__ = 'users'

    user_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    username = db.Column(db.String(64), nullable=True)
    email = db.Column(db.String(64), nullable=True)
    password = db.Column(db.String(64), nullable=True)
    first_name = db.Column(db.String(64), nullable=True)
    last_name = db.Column(db.String(64), nullable=True)
    user_since = db.Column(db.DateTime, nullable=False)

    def __repr__(self): # pragma: no cover
        """Provide helpful representation when printed."""

        return '<User user_id=%s username=%s email=%s first_name=%s last_name=%s>' % (self.user_id, self.username, self.email, self.first_name, self.last_name)


###########################
#HANDLE CSV FILES
###########################

class PokeType(db.Model):
    """CSV Import"""

    __tablename__='poketypes'

    poketype_id = db.Column(db.Integer, 
                        autoincrement=True, 
                        primary_key=True)
    pokemon_id = db.Column(db.Integer, db.ForeignKey('poke_base.pokemon_id'))
    type_id = db.Column(db.Integer, db.ForeignKey('type_base.type_id'))

    pokebase = db.relationship('PokeBase')
    typebase = db.relationship('TypeBase')

    def __repr__(self): # pragma: no cover
            """Provide helpful representation when printed."""

            return '<PokeType pokemon_id=%s type_id=%s>' % (self.pokemon_id, self.type_id)


class PokeBase(db.Model):
    """CSV Import"""

    __tablename__='poke_base'

    pokemon_id = db.Column(db.Integer, primary_key=True)
    identifier = db.Column(db.String(60), nullable=False)
    # species_id = db.Column(db.Integer)
    height = db.Column(db.Integer, nullable=False)
    weight = db.Column(db.Integer, nullable=False)
    nature = db.Column(db.String(60), nullable=False)

    encounter = db.relationship('Encounter')
    poketype = db.relationship('PokeType')

    def __repr__(self): # pragma: no cover
            """Provide helpful representation when printed."""

            return '<PokeBase pokemon_id=%s identifier=%s>' % (self.pokemon_id, self.identifier)


class TypeBase(db.Model):
    """CSV Import"""

    __tablename__='type_base'

    type_id = db.Column(db.Integer, primary_key=True)
    identifier = db.Column(db.String(60), nullable=False)

    poketype = db.relationship('PokeType')

    def __repr__(self): # pragma: no cover
            """Provide helpful representation when printed."""

            return '<TypeBase type_id=%s identifier=%s>' % (self.type_id, self.identifier)


#####################################################################

def example_data():
    """Sample data for testing."""

    # in case this is run more than once, empty out existing data
    Encounter.query.delete()
    User.query.delete()

    user_since = datetime.datetime.strftime(datetime.datetime.now(), '%Y-%m-%d %H:%M:%S')

    # add sample encounters, users, and pokemon
    encounter1 = Encounter(latitude=37.777450, longitude=-122.391696, pokemon_id=54)
    encounter2 = Encounter(latitude=37.784160, longitude=-122.398884, pokemon_id=13)

    user2 = User(username='testuser2', email='test2@ex.com', password='secretthing', first_name='Jen', last_name='Dough', user_since=user_since)
    user3 = User(username='testuser3', email='test3@ex.com', password='secretthing', first_name='Jan', last_name='Doh', user_since=user_since)

    pokemon1 = PokeBase(pokemon_id=54, identifier='Psyduck', height=10, weight=60, nature='well-tempered')
    pokemon2 = PokeBase(pokemon_id=13, identifier='Weedle', height=5, weight=40, nature='kind')

    db.session.add_all([encounter1, encounter2, user2, user3, pokemon1, pokemon2])
    db.session.commit()


def connect_to_db(app, db_uri=SQLALCHEMY_DATABASE_URI):
    """Connect the database to Flask app."""

    # configure to use postgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
    db.app = app
    db.init_app(app)


if __name__ == "__main__":

    from server import app
    connect_to_db(app)
    print "Connected to DB."
