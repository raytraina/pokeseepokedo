#PokeSee, PokeDo - Server

"""pokeseepokedo"""

from jinja2 import StrictUndefined

from flask import Flask, render_template, request, flash, redirect, session
from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db, Encounter, Location, Gym, User


app = Flask(__name__)

app.secret_key = "SOMETHINGHERELATER"

app.jinja_env.undefined = StrictUndefined


@app.route('/')
def index():
    """Render homepage."""

    # return render_template('index.html')


# @app.route('/poke-map', methods=['GET'])
# def results():
#     """Show map and directions based on user input."""

#     #TODO - work on map

    # start_point = request.args['start-point']
    # end_point = request.args['end-point']
    # departure = request.args['departure']

    return render_template('results.html')
                            # start_point=start_point,
                            # end_point=end_point,
                            # departure=departure)


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

#     #VERIFY
    
############################################


if __name__ == "__main__":
    #must be true for debug toolbar
    app.debug = True

    connect_to_db(app)

    #use the debug toolbar
    DebugToolbarExtension(app)

    app.run()
