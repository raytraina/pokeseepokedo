from flask_sqlalchemy import SQLAlchemy
from random import random, choice, randint

db = SQLAlchemy()


###########################################


class Encounter(db.Model):
    """Create an encounter instance given a pokemon and a location.

        Encounters is the primary view that will be used in application.
        Each encounter represents a waypoint on the map."""

    __tablename__='encounters'

    {"latitude":37.777450,"pokemonId":118,"id":9,"longitude":-122.391696}

    encounter_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    latitude = db.Column(db.Float(precision=(13,9)))
    pokemon_id = db.Column(db.Integer)
    longitude = db.Column(db.Float(precision=(13,9)))

    def __repr__(self):
            """Provide helpful representation when printed."""

            return "<Encounter encounter_id=%s pokemon_id=%s latitude=%s longitude=%s>" % (self.encounter_id, self.pokemon_id, self.latitude, self.longitude)


class Location(db.Model):
    """Location records from Yelp.

        Each location represents a waypoint on the map."""

    __tablename__='locations'

    real_location_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    is_pokestop = db.Column(db.Boolean) #need to make some locations not pokestops, add attr to yelp data
    latitude = db.Column(db.Float(precision=(13,9))) #will need to get from LOCATION>COORDINATE attr
    longitude = db.Column(db.Float(precision=(13,9))) #same as above
    rating = db.Column(db.Integer)
    review_count = db.Column(db.Integer)
    name = db.Column(db.String(100), nullable=False)
    snippet_image_url = db.Column(db.String(300))
    url = db.Column(db.String(200))
    display_phone = db.Column(db.String(15)) #poor handling if integer
    category = db.Column(db.String(50)) #need to parse through list of categories and take first result as category


    def __repr__(self):
            """Provide helpful representation when printed."""

            return "<Location name=%s is_pokestop=%s latitude=%s longitude=%s>" % (self.name, self.is_pokestop, self.latitude, self.longitude)


class User(db.Model):
    """User of PokeSee PokeDo."""

    __tablename__ = "users"

    user_id = db.Column(db.Integer,
                        autoincrement=True,
                        primary_key=True)
    email = db.Column(db.String(64), nullable=True)
    password = db.Column(db.String(64), nullable=True)
    first_name = db.Column(db.String(64), nullable=True)
    last_name = db.Column(db.String(64), nullable=True)

    def __repr__(self):
        """Provide helpful representation when printed."""

        return "<User user_id=%s email=%s first_name=%s last_name=%s>" % (self.user_id, self.email, self.first_name, self.last_name)


#####################################################################
# Helper functions


def connect_to_db(app):
    """Connect the database to Flask app."""

    # Configure to use PostgreSQL database
    app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///pokeseedo'
    db.app = app
    db.init_app(app)


if __name__ == "__main__":

    from server import app
    connect_to_db(app)
    print "Connected to DB."
