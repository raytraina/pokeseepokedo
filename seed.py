# """ADD SOME CONTEXT HERE"""
# """VERIFY ALL IMPORTS ARE CORRECT"""

from sqlalchemy import func

from pprint import pprint

import json
import csv

from model import connect_to_db, db, Encounter, Location, User #(Gym?)

from server import app

#########################


def load_encounters(): #TESTED
    """Load encounter locations with Pokemon."""

    print 'Encounters'

    with open('encounter.json') as pokeloc_file:
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


###############################################


if __name__ == "__main__":
    connect_to_db(app)
    db.create_all()

    load_users()
    load_movies()
    load_ratings()
    set_val_user_id()
