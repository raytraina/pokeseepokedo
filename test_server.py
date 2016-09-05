"""Pokesee Pokedo - Tests"""

from model import connect_to_db, db, example_data, Encounter, Location, User, Gym, PokeType, PokeBase, TypeBase
import unittest
from server import app
import server
import json


##########################################

class FlaskRoutes(unittest.TestCase):
    """Testing Flask Routes regardless of login/logout."""

    def setUp(self):
        self.client = app.test_client()
        app.config['TESTING'] = True


###########################
#TEST - HOMEPAGE
###########################

    def test_index(self): #passed
        result = self.client.get('/')
        self.assertIn('"/poke-map.json"', result.data)


##########################################

class FlaskTestsLoggedIn(unittest.TestCase):
    """Flask tests with user logged into session."""

    def setUp(self):
        app.config['TESTING'] = True
        app.config['SECRET_KEY'] = 'secret'
        self.client = app.test_client()

        with self.client as c:
            with c.session_transaction() as sess:
                sess['user_id'] = 2


###########################
#TEST - LOGOUT/FLASH
###########################

    def test_logout(self): #passed
        result = self.client.get('/logout',
                                follow_redirects=True)
        self.assertIn('You have been logged out.', result.data)


###########################
#TEST - USER PROFILE
###########################

# want to test against database instead
    def test_show_user_info(self):
        result = self.client.get('/user-profile',
                                data={'first_name':"Jane", 'username':"testuser1", 'last_name':"Doe", 'user_since':"Today"})
        self.assertIn('Welcome, Jane!', result.data)


##########################################

class FlaskTestsLoggedOut(unittest.TestCase):
    """Flask tests with user logged out of session."""

    def setUp(self):
        app.config['TESTING'] = True
        self.client = app.test_client()


###########################
#TEST - REGISTRATION PAGE
###########################

    def test_register_form(self): #passed
        result = self.client.get('/register')
        self.assertIn('<form id="registration" action="/register" method="post" class="form-inline" style="background-color:rgba(255,255,255,.9); width:35%; margin: 0 auto; padding:2%;">', result.data) 


###########################
#TEST - LOGIN PAGE
###########################

    def test_login_form(self): #passed
        result = self.client.get('/login')
        self.assertIn('<form action="/login" method="POST" class="form-inline" style="background-color:rgba(255,255,255,.9); width:35%; margin: 0 auto; padding:2%;">', result.data)


########################################## NOT WORKING

class FlaskTestsDatabase(unittest.TestCase):
    """Flask tests that use the database."""

    def setUp(self):
        self.client = app.test_client()
        app.config['TESTING'] = True

        # connect to test database
        connect_to_db(app, "postgresql:///testdb")

        # create tables and add encounter (pokemon=psyduck) and user data from model
        db.create_all()
        example_data()

        with self.client as c:
                    with c.session_transaction() as sess:
                        sess['catch_em'] = 54

    def tearDown(self):
        db.session.close()
        db.drop_all()


###########################
#TEST - MAP
###########################

# IndexError: list index out of range - { enc_poke = pokemon[poke_id - 1] }
    def test_results(self):
        result = self.client.get('/poke-map.json')
        self.assertIn('"encounters"', result.data)


###########################
#TEST - REGISTRATION
###########################

# 400 Bad Request
    def test_register_process(self):
        result = self.client.post('/register',
                                data={'email':"test1@ex.com", 'username':"testuser1", 'password':"secretthing", 'first_name':"Jane", 'last_name':"Doe"},
                                follow_redirects=True)
        self.assertIn('<form id="dest-details" action="/poke-map.json" method="GET">', result.data)  


###########################
#TEST - LOGIN/FLASH
###########################

    def test_login(self): #passed
        result = self.client.post('/login',
                                data={'username':"testuser2", 'password':"secretthing"},
                                follow_redirects=True)
        self.assertIn('Welcome, Jen!', result.data)


###########################
#TEST - CATCHING/FLASH
###########################

# want to test the full catching path
    def test_catch_pokemon(self):
        result = self.client.get('/catch-pokemon/<int:id>')
        self.assertIn('Congratulations!', result.data)

# TypeError: 'int' object is not iterable - { for poke_id in raw_poke_ids: }
    def test_show_caught(self):
        result = self.client.get('/caught')
        self.assertIn('<img src="https://raw.githubusercontent.com/designsbytraina/pokeseepokedo_0.5/master/assets_icons/psyduck.png" alt="caught pokemon picture" style="height:5%; width:auto;">', result.data) 


##########################################

if __name__ == '__main__':

    unittest.main()
