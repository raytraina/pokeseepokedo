"""Pokesee Pokedo - Seed File"""

from sqlalchemy import func
from random import choice
import json

from model import connect_to_db, db, Encounter, Location, User, Gym, PokeType, PokeBase, TypeBase
from server import app

# list of possible pokemon natures, to be assigned at random
NATURES = ['bashful','docile','hardy','quirky','serious','adamant',
    'lonely','modest','mild','bold','relaxed','calm','sassy','jolly','hasty']


###########################
#PROCESS CSV FILES
###########################

def load_pokebase():
    """Load pokemon.csv"""

    print 'PokeBase'

    for i, row in enumerate(open('seed_data/csv/pokemon.csv')):
        row = row.rstrip()
        pokemon_id, identifier, species_id, height, weight = row.split(",") [:5]
        
        pokemon_id = int(pokemon_id)
        height = int(height)
        weight = int(weight)

        nature = choice(NATURES)

        pokebase = PokeBase(pokemon_id=pokemon_id, identifier=identifier, height=height, weight=weight, nature=nature)

        db.session.add(pokebase)

    db.session.commit()


def load_poketype():
    """Load pokemon_types.csv"""

    print 'PokeType'

    for i, row in enumerate(open('seed_data/csv/pokemon_types.csv')):
        row = row.rstrip()
        pokemon_id, type_id = row.split(",") [:2]
        
        pokemon_id = int(pokemon_id)
        type_id = int(type_id)

        poketype = PokeType(pokemon_id=pokemon_id, type_id=type_id)

        db.session.add(poketype)

    db.session.commit()


def load_typebase():
    """Load pokemon_types.csv"""

    print 'TypeBase'

    for i, row in enumerate(open('seed_data/csv/types.csv')):
        row = row.rstrip()
        type_id, identifier = row.split(",") [:2]
        
        type_id = int(type_id)

        typebase = TypeBase(type_id=type_id, identifier=identifier)

        db.session.add(typebase)

    db.session.commit()


###########################
#SEED ENCOUNTERS
###########################

def load_encounters(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/pokesee-pokedo/seed_data/encounters/encounter.json') as pokeloc_file:
        data = json.load(pokeloc_file)
        data_list = data['data']

    for objects in data_list:
        latitude = objects['latitude']
        pokemon_id = objects['pokemonId']
        encounter_id = objects['id']
        longitude = objects['longitude']

        encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

        db.session.add(encounter)
    db.session.commit()


###########################
#SEED LOCATIONS
###########################

def load_locations():
    """Loads data from yelp for Brickhouse."""

    print 'Locations'

    with open('/home/vagrant/src/pokesee-pokedo/seed_data/locations/location.json') as loc_file:
        data=json.load(loc_file)
        data_list = data['data']

    for objects in data_list:
        latitude = objects['coordinates']['latitude']
        longitude = objects['coordinates']['longitude']
        rating = objects['rating']
        name = objects['name']
        url = objects['url']
        category = objects['categories'][0]['title']

        restaurant = Location(
                latitude=latitude, longitude=longitude, rating=rating, name=name, url=url, category=category)

        db.session.add(restaurant)
    db.session.commit()


###########################
#SEED GYMS
###########################

def yerba_buena_gym():
    """Add gym to database."""

    print 'Gyms'

    latitude = 37.7848382
    longitude = -122.40267
    name = 'Yerba Buena Gardens Gym'

    gym = Gym(latitude=latitude, longitude=longitude, name=name)

    db.session.add(gym)
    db.session.commit()


###############################################

if __name__ == "__main__":
    connect_to_db(app)
    db.create_all()

    load_typebase()
    load_pokebase()
    load_poketype()

    load_encounters()
    load_locations()
    yerba_buena_gym()
