"""Pokesee Pokedo"""

import os
from flask import Flask, render_template, request, flash, redirect, session, jsonify
from flask_debugtoolbar import DebugToolbarExtension
from jinja2 import StrictUndefined
from random import choice
import hashlib, datetime

from model import connect_to_db, db, Encounter, Location, User, Gym, PokeType, PokeBase, TypeBase


app = Flask(__name__)
app.secret_key = '%g%y1\xf5\xa9\x91R\xc9\x88\x97\xdf$\xab\x86\xe9\x84\xb8<m:\xcb\xbf\xb0\x83\x93'

app.jinja_env.undefined = StrictUndefined


###########################
#RENDER HOMEPAGE + MAP
###########################

@app.route('/')
def index():
    """Render homepage."""

    return render_template('index.html') # pragma: no cover


###########################
#HANDLE LOGIN/LOGOUT
###########################

@app.route('/login', methods=['GET'])
def login_form():
    """Show login form."""

    return render_template('login.html') # pragma: no cover


@app.route('/login', methods=['POST'])
def login():
    """Processes login from login.html."""

    # get form variables
    username = request.form.get('username')
    password = request.form.get('password')

    # query db for user matching the username entered
    user = User.query.filter_by(username=username).first()

    # if the user's credentials are incorrect
    if not user:
        flash('We are sorry, your username/password do not match our records. Please try again, or register.')
        return redirect('/login')

    session['user_id'] = user.user_id

    flash('Welcome back, %s!' % username) 
    return redirect('/user-profile')


@app.route('/logout')
def logout():
    """Log out user."""

    # remove the user_id from the session
    del session['user_id']
    flash('You have been logged out.')
    return redirect('/')


###########################
#REGISTER NEW USER
###########################

@app.route('/register', methods=['GET'])
def register_form():
    """Show form for user signup."""

    return render_template('registration_form.html') # pragma: no cover


@app.route('/register', methods=['POST'])
def register_process():
    """Process registration."""

    # get form variables
    username = request.form['username']
    email = request.form['email']
    password = request.form['new-password']
    first_name = request.form['first-name']
    last_name = request.form['last-name']

    # hash password for storing in db
    h = hashlib.md5(password.encode())
    h_password = h.hexdigest()

    user_since = datetime.datetime.strftime(datetime.datetime.now(), '%Y-%m-%d %H:%M:%S')

    new_user = User(username=username, email=email, password=h_password, first_name=first_name, last_name=last_name, user_since=user_since)

    db.session.add(new_user)
    db.session.commit()

    session['user_id'] = new_user.user_id

    flash('Welcome, %s. Happy catching!' % username)
    return redirect('/')


###########################
#USER PROFILE
###########################

@app.route('/user-profile')
def show_user_info():
    """Show user's information on a splash page."""

    # query db for session['user_id'], then chain attributes
    user_id = session['user_id']
    current_user = User.query.get(user_id)

    username = current_user.username
    first_name = current_user.first_name
    last_name = current_user.last_name
    user_since = current_user.user_since

    return render_template('user_profile.html',
                            username=username,
                            first_name=first_name,
                            last_name=last_name,
                            user_since=user_since)


###########################
#CATCH POKEMON
###########################

@app.route('/catch-pokemon/<int:id>', methods=['GET'])
def catch_pokemon(id):
    """Add pokemon to caught list."""

    # check if catch_em list already exists in session; if not, add it to session
    if 'catch_em' in session:
        catch_em = session['catch_em']
    else:
        catch_em = session['catch_em'] = []

    # add pokemon to user's caught list
    catch_em.append(id)

    # show success message upon adding/catching pokemon
    flash('Congratulations!')

    # return results from query/do not change pages
    return redirect('/caught')


@app.route('/caught')
def show_caught():
    """Display all pokemon the user has caught."""

    # initiate total counter at 0
    pokemon_total = 0

    # get all caught pokemon, or bind to empty list if none added yet
    raw_poke_ids = session.get('catch_em', [])

    # dictionary where ids of caught pokemon will be added
    caught = {}

    for poke_id in raw_poke_ids:
        if poke_id in caught:
            pokemon_info = caught[poke_id]
        else:
            pokemon = PokeBase.query.get(poke_id)
            species_info = caught[poke_id] = {'name':pokemon.identifier,
                                        'height':pokemon.height,
                                        'weight':pokemon.weight,
                                        'nature':pokemon.nature,
                                        'num_caught':0}
        
        # increase num_caught for this pokemon by 1
        species_info['num_caught'] += 1
        # increase the amount of pokemon caught by the num_caught
        pokemon_total += species_info['num_caught']

    caught = caught.values()

    return render_template('caught.html', caught=caught, pokemon_total=pokemon_total)


# @app.route('/poke-map.json', methods=['GET'])
# def results():
#     """Show map and directions based on user input.

#     This function will also jsonify data to pass pokemon and locations
#     to front end."""

#     # get form variables (not using them in demo)
#     start_point = request.args.get('start-point')
#     end_point = request.args.get('end-point')
#     activity = request.args.get('user-activity')
#     departure = request.args.get('departure')

#     ##########

#     # query all encounters in db
#     encounters = Encounter.query.all() #yields a list of objects
#     pokemon = PokeBase.query.all() #get all pokemon
#     poke_types = PokeType.query.all() #get all poketypes for cross-ref
#     types = TypeBase.query.all() #get all types

#     # loop through encounters and add items to encounter_dict
#     encounter_dict = {}
#     for encounter in encounters:
#         poke_id = encounter.pokemon_id
#         enc_poke = pokemon[poke_id - 1] #index pokemon for encountered pokemon
        
#         # COME BACK TO THIS:
#         # TODO: need to iterate through list
#         # [type_id = enc_poke.type_id

#         # join on type_id = pokemon.types(orsomething).type_id
#         # for i in poke_types:
#         #     type_id = poke_types[i].type_id
#         #     poke_type = types[type_id - 1].identifier]


#         type_id = poke_types[poke_id - 1].type_id
#         poke_type = types[type_id - 1].identifier

#         encounter_dict[encounter.encounter_id] = {"pokemon_id":poke_id,
#                                                     "name":enc_poke.identifier,
#                                                     "latitude":encounter.latitude,
#                                                     "longitude":encounter.longitude,
#                                                     "height":enc_poke.height,
#                                                     "weight":enc_poke.weight,
#                                                     "type":poke_type,
#                                                     "nature":enc_poke.nature}

#     ##########

#     # query all locations in db
#     locations = Location.query.all() #yields a list of objects

#     # loop through locations and add items to location_dict
#     location_dict = {}
#     for location in locations:
#         location_dict[location.location_id] = {"name":location.name,
#                                                 "latitude":location.latitude,
#                                                 "longitude":location.longitude,
#                                                 "rating":location.rating,
#                                                 "url":location.url,
#                                                 "category":location.category}

#     ##########

#     # query all gyms in db
#     gyms = Gym.query.all() #yields a list of objects

#     # loop through gyms and add items to gym_dict
#     gym_dict = {}
#     for gym in gyms:
#         gym_dict[gym.gym_id] = {"name":gym.name,
#                                 "latitude":gym.latitude,
#                                 "longitude":gym.longitude}

#     # combine dictionaries into dictionary of dictionaries
#     dictionary = {"encounters": encounter_dict, "locations": location_dict, "gyms": gym_dict}

#     # return jsonified dictionary that will be accessible at front-end
#     return jsonify(dictionary)
    # return "<h1>this works!</h1>"

############################################

if __name__ == '__main__':

    connect_to_db(app)

    #use the debug toolbar
    # DebugToolbarExtension(app)

    #run application
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port, debug=False)
