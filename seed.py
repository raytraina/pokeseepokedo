#PokeSee, PokeDo - Seed File

from sqlalchemy import func

import json

from model import connect_to_db, db, Encounter, Location, User, Gym, PokeType, PokeBase, TypeBase

from server import app

#########################
# Processing CSVs

def load_pokebase():
    """Load pokemon.csv"""

    print 'PokeBase'

    for i, row in enumerate(open('seed_data/csv/pokemon.csv')):
        row = row.rstrip()
        pokemon_id, identifier, species_id, height, weight = row.split(",") [:5]
        
        pokemon_id = int(pokemon_id)
        height = int(height)
        weight = int(weight)

        pokebase = PokeBase(pokemon_id=pokemon_id, identifier=identifier, height=height, weight=weight)

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


#########################

def load_encounter1(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/project/seed_data/encounters/encounter1.json') as pokeloc_file:
        data = json.load(pokeloc_file)

    latitude = data['latitude']
    pokemon_id = data['pokemonId']
    encounter_id = data['id']
    longitude = data['longitude']

    encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

    db.session.add(encounter)
    db.session.commit()


def load_encounter2(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/project/seed_data/encounters/encounter2.json') as pokeloc_file:
        data = json.load(pokeloc_file)

    latitude = data['latitude']
    pokemon_id = data['pokemonId']
    encounter_id = data['id']
    longitude = data['longitude']

    encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

    db.session.add(encounter)
    db.session.commit()


def load_encounter3(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/project/seed_data/encounters/encounter3.json') as pokeloc_file:
        data = json.load(pokeloc_file)

    latitude = data['latitude']
    pokemon_id = data['pokemonId']
    encounter_id = data['id']
    longitude = data['longitude']

    encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

    db.session.add(encounter)
    db.session.commit()


def load_encounter4(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/project/seed_data/encounters/encounter4.json') as pokeloc_file:
        data = json.load(pokeloc_file)

    latitude = data['latitude']
    pokemon_id = data['pokemonId']
    encounter_id = data['id']
    longitude = data['longitude']

    encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

    db.session.add(encounter)
    db.session.commit()


def load_encounter5(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/project/seed_data/encounters/encounter5.json') as pokeloc_file:
        data = json.load(pokeloc_file)

    latitude = data['latitude']
    pokemon_id = data['pokemonId']
    encounter_id = data['id']
    longitude = data['longitude']

    encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

    db.session.add(encounter)
    db.session.commit()


def load_encounter6(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/project/seed_data/encounters/encounter6.json') as pokeloc_file:
        data = json.load(pokeloc_file)

    latitude = data['latitude']
    pokemon_id = data['pokemonId']
    encounter_id = data['id']
    longitude = data['longitude']

    encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

    db.session.add(encounter)
    db.session.commit()


def load_encounter7(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/project/seed_data/encounters/encounter7.json') as pokeloc_file:
        data = json.load(pokeloc_file)

    latitude = data['latitude']
    pokemon_id = data['pokemonId']
    encounter_id = data['id']
    longitude = data['longitude']

    encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

    db.session.add(encounter)
    db.session.commit()


def load_encounter8(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/project/seed_data/encounters/encounter8.json') as pokeloc_file:
        data = json.load(pokeloc_file)

    latitude = data['latitude']
    pokemon_id = data['pokemonId']
    encounter_id = data['id']
    longitude = data['longitude']

    encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

    db.session.add(encounter)
    db.session.commit()


def load_encounter9(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/project/seed_data/encounters/encounter9.json') as pokeloc_file:
        data = json.load(pokeloc_file)

    latitude = data['latitude']
    pokemon_id = data['pokemonId']
    encounter_id = data['id']
    longitude = data['longitude']

    encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

    db.session.add(encounter)
    db.session.commit()


def load_encounter10(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/home/vagrant/src/project/seed_data/encounters/encounter10.json') as pokeloc_file:
        data = json.load(pokeloc_file)

    latitude = data['latitude']
    pokemon_id = data['pokemonId']
    encounter_id = data['id']
    longitude = data['longitude']

    encounter = Encounter(latitude=latitude, pokemon_id=pokemon_id, encounter_id=encounter_id, longitude=longitude)

    db.session.add(encounter)
    db.session.commit()


def load_b_rest():
    """Loads data from yelp for B Restaurant."""

    print 'Locations'

    with open('/home/vagrant/src/project/seed_data/locations/b_restaurant.json') as loc_file:
        data=json.load(loc_file)

    latitude = data['coordinates']['latitude']
    longitude = data['coordinates']['longitude']

    rating = data['rating'] #value for rating as integer
    name = data['name'] #value unicode string
    url = data['url'] #value unicode string

    category = data['categories'][0]['title']

    restaurant = Location(
                latitude=latitude, longitude=longitude, rating=rating, name=name, url=url, category=category)

    db.session.add(restaurant)
    db.session.commit()


def load_brickhouse():
    """Loads data from yelp for Brickhouse."""

    print 'Locations'

    with open('/home/vagrant/src/project/seed_data/locations/brickhouse.json') as loc_file:
        data=json.load(loc_file)

    latitude = data['coordinates']['latitude']
    longitude = data['coordinates']['longitude']

    rating = data['rating'] #value for rating as integer
    name = data['name'] #value unicode string
    url = data['url'] #value unicode string

    category = data['categories'][0]['title']

    restaurant = Location(
                latitude=latitude, longitude=longitude, rating=rating, name=name, url=url, category=category)

    db.session.add(restaurant)
    db.session.commit()


def load_lava_lounge():
    """Loads data from yelp for Lava Lounge."""

    print 'Locations'

    with open('/home/vagrant/src/project/seed_data/locations/lava_lounge.json') as loc_file:
        data=json.load(loc_file)

    latitude = data['coordinates']['latitude']
    longitude = data['coordinates']['longitude']

    rating = data['rating'] #value for rating as integer
    name = data['name'] #value unicode string
    url = data['url'] #value unicode string

    category = data['categories'][0]['title']

    restaurant = Location(
                latitude=latitude, longitude=longitude, rating=rating, name=name, url=url, category=category)

    db.session.add(restaurant)
    db.session.commit()


def load_local_tap():
    """Loads data from yelp for Local Tap."""

    print 'Locations'

    with open('/home/vagrant/src/project/seed_data/locations/local_tap.json') as loc_file:
        data=json.load(loc_file)

    latitude = data['coordinates']['latitude']
    longitude = data['coordinates']['longitude']

    rating = data['rating'] #value for rating as integer
    name = data['name'] #value unicode string
    url = data['url'] #value unicode string

    category = data['categories'][0]['title']

    restaurant = Location(
                latitude=latitude, longitude=longitude, rating=rating, name=name, url=url, category=category)

    db.session.add(restaurant)
    db.session.commit()


def load_lucky_strike():
    """Loads data from yelp for Lucky Strike."""

    print 'Locations'

    with open('/home/vagrant/src/project/seed_data/locations/lucky_strike.json') as loc_file:
        data=json.load(loc_file)

    latitude = data['coordinates']['latitude']
    longitude = data['coordinates']['longitude']

    rating = data['rating'] #value for rating as integer
    name = data['name'] #value unicode string
    url = data['url'] #value unicode string

    category = data['categories'][0]['title']

    restaurant = Location(
                latitude=latitude, longitude=longitude, rating=rating, name=name, url=url, category=category)

    db.session.add(restaurant)
    db.session.commit()


def load_momos():
    """Loads data from yelp for Momo's."""

    print 'Locations'

    with open('/home/vagrant/src/project/seed_data/locations/momos.json') as loc_file:
        data=json.load(loc_file)

    latitude = data['coordinates']['latitude']
    longitude = data['coordinates']['longitude']

    rating = data['rating'] #value for rating as integer
    name = data['name'] #value unicode string
    url = data['url'] #value unicode string

    category = data['categories'][0]['title']

    restaurant = Location(
                latitude=latitude, longitude=longitude, rating=rating, name=name, url=url, category=category)

    db.session.add(restaurant)
    db.session.commit()


def load_osha_thai():
    """Loads data from yelp for Osha Thai."""

    print 'Locations'

    with open('/home/vagrant/src/project/seed_data/locations/osha_thai.json') as loc_file:
        data=json.load(loc_file)

    latitude = data['coordinates']['latitude']
    longitude = data['coordinates']['longitude']

    rating = data['rating'] #value for rating as integer
    name = data['name'] #value unicode string
    url = data['url'] #value unicode string

    category = data['categories'][0]['title']

    restaurant = Location(
                latitude=latitude, longitude=longitude, rating=rating, name=name, url=url, category=category)

    db.session.add(restaurant)
    db.session.commit()


def load_victory_hall():
    """Loads data from yelp for Victory Hall."""

    print 'Locations'

    with open('/home/vagrant/src/project/seed_data/locations/victory_hall.json') as loc_file:
        data=json.load(loc_file)

    latitude = data['coordinates']['latitude']
    longitude = data['coordinates']['longitude']

    rating = data['rating'] #value for rating as integer
    name = data['name'] #value unicode string
    url = data['url'] #value unicode string

    category = data['categories'][0]['title']

    restaurant = Location(
                latitude=latitude, longitude=longitude, rating=rating, name=name, url=url, category=category)

    db.session.add(restaurant)
    db.session.commit()


def load_wine_down():
    """Loads data from yelp for Wine Down."""

    print 'Locations'

    with open('/home/vagrant/src/project/seed_data/locations/wine_down.json') as loc_file:
        data=json.load(loc_file)

    latitude = data['coordinates']['latitude']
    longitude = data['coordinates']['longitude']

    rating = data['rating'] #value for rating as integer
    name = data['name'] #value unicode string
    url = data['url'] #value unicode string

    category = data['categories'][0]['title']

    restaurant = Location(
                latitude=latitude, longitude=longitude, rating=rating, name=name, url=url, category=category)

    db.session.add(restaurant)
    db.session.commit()


def yerba_buena_gym():
    """Add gym to database."""

    print 'Gyms'

    latitude = 37.7848382
    longitude = -122.40267
    name = 'Yerba Buena Gardens Gym'

    gym = Gym(latitude=latitude, longitude=longitude, name=name)

    db.session.add(gym)
    db.session.commit()


#TODO SECOND SPRINT#################


# def set_val_user_id(): #TODO SECOND SPRINT
#     """Set value for the next user_id after seeding database"""

#     # Get the Max user_id in the database
#     result = db.session.query(func.max(User.user_id)).one()
#     max_id = int(result[0])

#     # Set the value for the next user_id to be max_id + 1
#     query = "SELECT setval('users_user_id_seq', :new_id)"
#     db.session.execute(query, {'new_id': max_id + 1})
#     db.session.commit()


# def load_yelp(): #TODO SECOND SPRINT
#     """Iterates through yelp_locations directory and adds to database."""

#     #TODO
#     #want to figure out how to iterate over files in the yelp_locations directory
#     #longform code for now

#     #####TODO#####
#     #need to determine which restaurants are useful/viable, especially which are actual pokestops/gyms
#     #might actually want to do a restaurant/bar search to get best bars on the route




###############################################


if __name__ == "__main__":
    connect_to_db(app)
    db.create_all()

    load_typebase()
    load_pokebase()
    load_poketype()


    load_encounter1()
    load_encounter2()
    load_encounter3()
    load_encounter4()
    load_encounter5()
    load_encounter6()
    load_encounter7()
    load_encounter8()
    load_encounter9()
    load_encounter10()

    load_b_rest()
    load_brickhouse()
    load_lava_lounge()
    load_local_tap()
    load_lucky_strike()
    load_momos()
    load_osha_thai()
    load_victory_hall()
    load_wine_down()

    yerba_buena_gym()

    # set_val_user_id() - second sprint

    # load_yelp() - second sprint
