"""Pokesee Pokedo - Tests"""

from model import connect_to_db, db, Encounter, Location, User, Gym, PokeType, PokeBase, TypeBase
import unittest
from server import app
import server
import json


##########################################

class FlaskRoutes(unittest.TestCase):
    """Testing Flask Routes"""

    def setUp(self):
        # setting up a testing client
        self.client = app.test_client()
        app.config['TESTING'] = True


###########################
#TEST - HOMEPAGE
###########################

    def test_home(self):
        # result contains the html returned from the '/' route
        result = self.client.get('/')
        # checking for the presence of an element we expect to see in the home page
        self.assertIn('<form id="dest-details" action="/poke-map.json" method="GET">', result.data)


##########################################

class FlaskTestsLoggedIn(unittest.TestCase):
    """Flask tests with user logged into session."""

    def setUp(self):

        app.config['TESTING'] = True
        app.config['SECRET_KEY'] = 'secret'
        self.client = app.test_client()

        with self.client as c:
            with c.session_transaction() as sess:
                sess['user_id'] = 1


###########################
#TEST - LOGIN
###########################

    def test_login_page(self):
        result = self.client.get('/login')

        # TODO

        self.assertIn('', result.data)

    def test_login_action(self):
        result = self.client.post('/login') #is this correct notation? need to verify

        # TODO

        self.assertIn('', result.data)  

    def test_flash_login(self):
        ######################

        # TODO


###########################
#TEST - USER PROFILE
###########################

    def test_user_profile(self):
        result = self.client.get('/user-profile')

        # TODO

        self.assertIn('', result.data)


###########################
#TEST - CATCHING
###########################

    def test_catching(self):
        result = self.client.get('/catch-pokemon<int:id>') #is this correct notation? need to verify

        # TODO

        self.assertIn('', result.data)



    def test_flash_catch(self):
        ######################

        # TODO

    def test_caught(self):
        result = self.client.post('/caught')

        # TODO

        self.assertIn('', result.data)  


##########################################

class FlaskTestsLoggedOut(unittest.TestCase):
    """Flask tests with user logged in to session."""

    def setUp(self):
        """Stuff to do before every test."""

        app.config['TESTING'] = True
        self.client = app.test_client()

    def test_important_page(self):
        """Test that user can't see important page when logged out."""

        # TODO

        result = self.client.get("/important", follow_redirects=True)
        self.assertNotIn("You are a valued user", result.data)
        self.assertIn("You must be logged in", result.data)



###########################
#TEST - LOGOUT
###########################

    def test_logout(self):
        result = self.client.get('/logout')

        # TODO

        self.assertIn('', result.data)

    def test_flash_logout(self):
        ######################

        # TODO


###########################
#TEST - REGISTRATION PAGE
###########################

    def test_register_page(self):
        result = self.client.get('/register')

        # TODO

        self.assertIn('', result.data)


###########################
#TEST - CATCHING
###########################

    def test_catching(self):
        result = self.client.get('/catch-pokemon<int:id>') #is this correct notation? need to verify

        # TODO

        self.assertIn('', result.data)

    def test_flash_catch(self):
        ######################

        # TODO

    def test_caught(self):
        result = self.client.post('/caught')

        # TODO

        self.assertIn('', result.data)  


##########################################

class FlaskTestsDatabase(unittest.TestCase):
    """Flask tests that use the database."""

    def setUp(self):

        self.client = app.test_client()
        app.config['TESTING'] = True

        # Connect to test database
        connect_to_db(app, "postgresql:///testpoke")

        # Create tables and add sample data
        db.create_all()
        example_data()

    def tearDown(self):
        db.session.close()
        db.drop_all()


###########################
#TEST - MAP
###########################

    def test_json(self):
        result = self.client.get('/poke-map.json')
        self.assertIn('"encounters"', result.data)

###########################
#TEST - REGISTRATION
###########################

    def test_register_action(self):
        result = self.client.post('/register') #is this correct notation? need to verify

        # TODO
        
        self.assertIn('', result.data)  


##########################################

if __name__ == '__main__':

    unittest.main()
