#PokeSee, PokeDo - Seed File

from sqlalchemy import func

import json

from model import connect_to_db, db, Encounter, Location, User, Gym

from server import app

#########################


def load_encounters(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('/seed_data/encounter.json') as pokeloc_file:
            pokeloc_data = json.load(pokeloc_file)
            data_list = pokeloc_data.get('data') #now this is a list instead of a dict w/ 'data' as key

            encounter1 = data_list[0]
            encounter2 = data_list[1]
            encounter3 = data_list[2]
            encounter4 = data_list[3]
            encounter5 = data_list[4]
            encounter6 = data_list[5]
            encounter7 = data_list[6]
            encounter8 = data_list[7]
            encounter9 = data_list[8]
            encounter10 = data_list[9]

            encounter1, encounter2, encounter3, encounter4, encounter5, encounter6, encounter7, encounter8, encounter9, encounter10 = Encounter(
                latitude=latitude, pokemon_id=pokemonId, encounter_id=id, longitude=longitude)

            db.session.add(encounter1, encounter2, encounter3, encounter4, encounter5, encounter6, encounter7, encounter8, encounter9, encounter10)
            db.session.commit()


def load_b_rest():
    """Loads data from yelp for B Restaurant."""

    print 'Locations'

    with open('/seed_data/b_restaurant.json') as loc_file:
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
    db.commit()


def load_brickhouse():
    """Loads data from yelp for Brickhouse."""

    print 'Locations'

    with open('/seed_data/brickhouse.json') as loc_file:
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
    db.commit()


def load_lava_lounge():
    """Loads data from yelp for Lava Lounge."""

    print 'Locations'

    with open('/seed_data/lava_lounge.json') as loc_file:
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
    db.commit()


def load_local_tap():
    """Loads data from yelp for Local Tap."""

    print 'Locations'

    with open('/seed_data/local_tap.json') as loc_file:
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
    db.commit()


def load_lucky_strike():
    """Loads data from yelp for Lucky Strike."""

    print 'Locations'

    with open('/seed_data/lucky_strike.json') as loc_file:
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
    db.commit()


def load_momos():
    """Loads data from yelp for Momo's."""

    print 'Locations'

    with open('/seed_data/momos.json') as loc_file:
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
    db.commit()


def load_osha_thai():
    """Loads data from yelp for Osha Thai."""

    print 'Locations'

    with open('/seed_data/osha_thai.json') as loc_file:
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
    db.commit()


def load_victory_hall():
    """Loads data from yelp for Victory Hall."""

    print 'Locations'

    with open('/seed_data/victory_hall.json') as loc_file:
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
    db.commit()


def load_wine_down():
    """Loads data from yelp for Wine Down."""

    print 'Locations'

    with open('/seed_data/wine_down.json') as loc_file:
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
    db.commit()


def yerba_buena_gym():
    """Add gym to database."""

    print 'Gyms'

    latitude = #GET THIS
    longitude = #GET THIS
    name = 'Yerba Buena Gardens Gym'

    gym = Gym(latitude=latitude, longitude=longitude, name=name)

    db.session.add(gym)
    db.commit()


#################


# def load_yelp(): #TODO SECOND SPRINT
#     """Iterates through yelp_locations directory and adds to database."""

#     #TODO
#     #want to figure out how to iterate over files in the yelp_locations directory
#     #longform code for now

#     #####TODO#####
#     #need to determine which restaurants are useful/viable, especially which are actual pokestops/gyms
#     #might actually want to do a restaurant/bar search to get best bars on the route




###############################################


# if __name__ == "__main__":
#     connect_to_db(app)
#     db.create_all()

    # load_encounters()
    # load_b_rest()
    # load_brickhouse()
    # load_lava_lounge()
    # load_local_tap()
    # load_lucky_strike()
    # load_momos()
    # load_osha_thai()
    # load_victory_hall()
    # load_wine_down()
    # yerba_buena_gym()
    # load_yelp() - second sprint
