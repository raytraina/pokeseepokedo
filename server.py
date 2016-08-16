"""pokeseepokedo"""

from jinja2 import StrictUndefined

from flask import Flask, render_template, request, flash, redirect, session
from flask_debugtoolbar import DebugToolbarExtension

from model import connect_to_db, db, User, Movie, Rating

# from yelp.client import Client
# from yelp.oauth1_authenticator import Oauth1Authenticator


app = Flask(__name__)

app.secret_key = "SOMETHINGHERELATER"

app.jinja_env.undefined = StrictUndefined

# #######YELP#######
# auth = Oauth1Authenticator(
#     consumer_key=YOUR_CONSUMER_KEY,
#     consumer_secret=YOUR_CONSUMER_SECRET,
#     token=YOUR_TOKEN,
#     token_secret=YOUR_TOKEN_SECRET
# )

# client = Client(auth)
# ##################


@app.route('/')
def index():
    """Render homepage."""

    return render_template('index.html')


@app.route('/poke-map', methods=['GET'])
def results():
    """Show map and directions based on user input."""

    #SOMETHINGHERELATER

    return render_template('results.html')


@app.route('/register', methods=['GET'])
def register_form():
    """Show form for user signup."""

    #SOMETHINGHERELATER

    return render_template("registration_form.html")


@app.route('/register', methods=['POST'])
def register_process():
    """Process registration."""

    #SOMETHINGHERELATER

    email = request.form['email']
    password = request.form['new-password']
    first_name = request.form['first-name']
    last_name = request.form['last-name']

    new_user = User(email=email, password=password, first_name=first_name, last_name=last_name)

    # db.session.add(new_user)
    # db.session.commit()

    # flash("User %s added." % email)
    # return redirect("/")


@app.route('/login', methods=['GET'])
def login_form():
    """Show login form."""

    #SOMETHINGHERELATER

    return render_template("login_form.html")


@app.route('/login', methods=['POST'])
def login_process():
    """Process login."""

    #SOMETHINGHERELATER

    # # Get form variables
    # email = request.form["email"]
    # password = request.form["password"]

    # user = User.query.filter_by(email=email).first()

    # if not user:
    #     flash("No such user")
    #     return redirect("/login")

    # if user.password != password:
    #     flash("Incorrect password")
    #     return redirect("/login")

    # session["user_id"] = user.user_id

    # flash("Logged in")
    # return redirect("/users/%s" % user.user_id)


@app.route('/logout')
def logout():
    """Log out."""

    del session["user_id"]
    flash("Logged Out.")
    return redirect("/")

    #VERIFY

####TEST#################

@app.route('/maps-test')
def map():
    """Test map, DELETE PRE-PRODUCTION ."""

    #SOMETHINGHERELATER

    return render_template("gmaps-test.html")
    
############################################


if __name__ == "__main__":
    #must be true for debug toolbar
    app.debug = True

    connect_to_db(app)

    #use the debug toolbar
    DebugToolbarExtension(app)

    app.run()
