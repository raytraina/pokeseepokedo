from model import connect_to_db, db, Encounter, Location, User, Gym, PokeType, PokeBase, TypeBase

import unittest
import server

class IntegrationTest(unittest.TestCase):
    """ Testing """

    def setUp(self):
        # setting up a testing client
        self.client = server.app.test_client()
        server.app.config['TESTING'] = True

    def test_home(self):
        # result contains the html returned from the '/' route
        result = self.client.get('/')
        # checking for the presence of an element we expect to see in the home page
        self.assertIn('<form id="dest-details" action="/poke-map.json" method="GET">', result.data)

    def test_json(self):
        result = self.client.get("/poke-map.json")
        self.assertIn('"encounters"', result.data)

    def test_login(self):

    def test_logout(self):

    def test_register(self):

    def test_catching(self):

    def test_caught(self):


##########################################


if __name__ == '__main__':

    # This runs all of or tests
    unittest.main()
