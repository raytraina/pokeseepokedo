"""Pokesee Pokedo - Tests"""

from model import connect_to_db, db, Encounter, Location, User, Gym, PokeType, PokeBase, TypeBase
import unittest
from server import app
import server
import json


class IntegrationTest(unittest.TestCase):
    """Testing Flask Routes"""

    def setUp(self):
        # setting up a testing client
        self.client = server.app.test_client()
        server.app.config['TESTING'] = True

###########################
#TEST - HOMEPAGE + MAP
###########################

    def test_home(self):
        # result contains the html returned from the '/' route
        result = self.client.get('/')
        # checking for the presence of an element we expect to see in the home page
        self.assertIn('<form id="dest-details" action="/poke-map.json" method="GET">', result.data)

    def test_json(self):
        result = self.client.get('/poke-map.json')
        self.assertIn('"encounters"', result.data)

###########################
#TEST - LOGIN/LOGOUT
###########################

    def test_login_page(self):
        result = self.client.get('/login')
        self.assertIn('', result.data)

    def test_login_action(self):
        result = self.client.post('/login') #is this correct notation? need to verify
        self.assertIn('', result.data)  

    def test_flash_login(self):
        ######################      

    def test_logout(self):
        result = self.client.get('/logout')
        self.assertIn('', result.data)

    def test_flash_logout(self):
        ######################

###########################
#TEST - REGISTER
###########################

    def test_register_page(self):
        result = self.client.get('/register')
        self.assertIn('', result.data)

    def test_register_action(self):
        result = self.client.post('/register') #is this correct notation? need to verify
        self.assertIn('', result.data)  

###########################
#TEST - USER PROFILE
###########################

    def test_user_profile(self):
        result = self.client.get('/user-profile')
        self.assertIn('', result.data)

###########################
#TEST - CATCHING
###########################

    def test_catching(self):
        result = self.client.get('/catch-pokemon<int:id>') #is this correct notation? need to verify
        self.assertIn('', result.data)

    def test_flash_catch(self):
        ######################

    def test_caught(self):
        result = self.client.post('/caught')
        self.assertIn('', result.data)  


##########################################


if __name__ == '__main__':

    # This runs all of or tests
    unittest.main()
