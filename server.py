"""PokeSee, PokeDo"""

from jinja2 import StrictUndefined

from flask import Flask, render_template, request, flash, redirect, session, jsonify
from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db, Encounter, Location, User, Gym, PokeType, PokeBase, TypeBase


app = Flask(__name__)
app.secret_key = "XQRSK"

app.jinja_env.undefined = StrictUndefined


@app.route('/')
def index():
    """Render homepage."""

    return render_template('results.html')


@app.route('/poke-map.json', methods=['GET'])
def results():
    """Show map and directions based on user input."""

    # get form variables
    start_point = request.args.get('start-point')
    end_point = request.args.get('end-point')
    departure = request.args.get('departure')

    ##########

    # query all encounters in db
    encounters = Encounter.query.all() #yields a list of objects

    # loop through encounters and add items to encounter_dict
    encounter_dict = {}
    for encounter in encounters:
        encounter_dict[encounter.encounter_id] = {"pokemon_id":encounter.pokemon_id,
                                                    "latitude":encounter.latitude,
                                                    "longitude":encounter.longitude}

    ##########

    # query all locations in db
    locations = Location.query.all() #yields a list of objects

    # loop through locations and add items to location_dict
    location_dict = {}
    for location in locations:
        location_dict[location.location_id] = {"name":location.name,
                                                "latitude":location.latitude,
                                                "longitude":location.longitude,
                                                "rating":location.rating,
                                                "url":location.url,
                                                "category":location.category}

    ##########

    # query all gyms in db
    gyms = Gym.query.all() #yields a list of objects

    # loop through gyms and add items to gym_dict
    gym_dict = {}
    for gym in gyms:
        gym_dict[gym.gym_id] = {"name":gym.name,
                                "latitude":gym.latitude,
                                "longitude":gym.longitude}

    # gym_dict = {"gym1": {
    #                 "gym_id":gym[0].gym_id,
    #                 "name":gym[0].name,
    #                 "latitude":gym[0].latitude,
    #                 "longitude":gym[0].longitude
    #                 }
    #             }

    # combine dictionaries into dictionary of dictionaries
    dictionary = {"encounters": encounter_dict, "locations": location_dict, "gyms": gym_dict}

    # return jsonified dictionary that will be accessible in JS
    return jsonify(dictionary)


# TODO - SECOND SPRINT #########################################################


# @app.route('/register', methods=['GET'])
# def register_form():
#     """Show form for user signup."""

#     return render_template("registration_form.html")


# @app.route('/register', methods=['POST'])
# def register_process():
#     """Process registration."""

#     email = request.form['email']
#     password = request.form['new-password']
#     first_name = request.form['first-name']
#     last_name = request.form['last-name']

#     new_user = User(email=email, password=password, first_name=first_name, last_name=last_name)

#     db.session.add(new_user)
#     db.session.commit()

#     flash("Welcome, %s. Happy catching!" % first_name)
#     #return redirect("/")
#     #TODO - add a homepage for users that shows their information, maybe timestamp for when registered??


# @app.route('/login', methods=['GET'])
# def login_form():
#     """Show login form."""

#     #SOMETHINGHERELATER

#     return render_template("login_form.html")


# @app.route('/login', methods=['POST'])
# def login_process():
#     """Process login."""

#     #SOMETHINGHERELATER

#     # # Get form variables
#     # email = request.form["email"]
#     # password = request.form["password"]

#     # user = User.query.filter_by(email=email).first()

#     # if not user:
#     #     flash("No such user")
#     #     return redirect("/login")

#     # if user.password != password:
#     #     flash("Incorrect password")
#     #     return redirect("/login")

#     # session["user_id"] = user.user_id

#     # flash("Logged in")
#     # return redirect("/users/%s" % user.user_id)


# @app.route('/logout')
# def logout():
#     """Log out."""

#     del session["user_id"]
#     flash("Logged Out.")
#     return redirect("/")

##VERIFY ^^^
    
############################################


if __name__ == "__main__":
    #must be true for debug toolbar
    app.debug = True

    connect_to_db(app)

    #use the debug toolbar
    DebugToolbarExtension(app)

    # doesn't work on localhost - REMOVE
    # app.run()

    #run application
    app.run(host='0.0.0.0', port=5000)
