## Pokésee Pokédo

Pokésee Pokédo is a companion application for Pokémon GO which allows users to plan an optimized route for catching Pokémon, while visiting local points of interest and having fun with friends. Users enter a start point, an end point, desired activity, and desired departure time and the app returns the ideal route to take based on Google Maps data. As the user traverses zir path, Pokémon can be marked as “caught" and added to zir collection of Pokémon, which can later be accessed from the user’s profile page.

### Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

#### Prerequisities

Before you begin, be sure to install all requirements within a virtual environment. To learn more about Python's virtualenv tool, [read the documentation](https://virtualenv.pypa.io/en/stable/).

Initiate a virtualenv:

```
$ virtualenv venv
```

Source the virtualenv:

```
$ source venv/bin/activate
```

Install requirements:

```
(venv)$ pip install -r requirements.txt
```

Then, run the application with ```python server.py```:

```
(venv)$ python server.py
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
 * Restarting with stat
```
You should see similar success messages in the console. If you have any issues getting up and running, please contact the author on Twitter @designsbytraina, or via email.

### Running Demo
Once it is up and running on your local machine, continue to run the demo freely, paying particular attention to the below pages.

#### Let's GO
Users can enter a start and end point, desired activity, and departure time for zir Pokémon catching trip. Upon submission, an AJAX request is made to the server, where a query is made to the database for seed data and returns JSON to the front-end. 

![homepage](https://raw.githubusercontent.com/designsbytraina/pokeseepokedo_0.5/master/readme-screenshots/home.png "Homepage")

The parsed JSON is then passed to the Google Maps API where latitude/longitude objects are created and processed as either waypoints or markers on the map.

![rendered map](https://raw.githubusercontent.com/designsbytraina/pokeseepokedo_0.5/master/readme-screenshots/map.png "Rendered Google Map")

Walking directions are rendered below the map.

#### Gotta Catch 'Em All
By clicking on any returned Pokémon, an info window displays with some details about it, including nature, type, height and weight. Within this window, users can mark Pokémon as caught by clicking the "gotcha" button.

![pokemon information](https://raw.githubusercontent.com/designsbytraina/pokeseepokedo_0.5/master/readme-screenshots/infowindow.png "Pokemon Info Window")

On click, the Pokémon ID is added to the user's session and zie is brought to a page which displays all Pokémon caught.

![caught page](https://raw.githubusercontent.com/designsbytraina/pokeseepokedo_0.5/master/readme-screenshots/caught.png "Caught Page")

#### Join In
Users can save caught Pokémon when logged in or logged out, but the only way to save those Pokémon to zir user profile is to create an account.

![registration page](https://raw.githubusercontent.com/designsbytraina/pokeseepokedo_0.5/master/readme-screenshots/registration.png "Registration Page")

Registration is handled by submitting an AJAX post request to the server, where the data is processed, a new user is created, and is then added to the database.

### Running Tests

The development of this application includes testing features interactively before implementation. Integration tests for all endpoints have also been included and details for running are below.

#### Integration Testing

Endpoints defined in Flask can be tested by running the test file:
```
$ python test_server.py
```

#### Test Coverage

The current percentage of test coverage can be calculated using these steps, as long as the python ```coverage``` module has already been installed. For more details on installation and usage, [read the documentation](https://coverage.readthedocs.io/en/coverage-4.2/).

To begin, simply run coverage on the test file:
```
$ coverage run test_server.py
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
 * Restarting with stat
 ```
 Now it is possible to access the report in the console with:
 ```
 $ coverage report -m
 Name              Stmts   Miss   Cover
----------------------------------------
 model.py           75      3      96%
 server.py          99      43     57%
 test_server.py     66      3      95%
```
_Note: The above figures represent the test coverage as of September 6, 2016._

It is also possible to view in alternate formats. Please refer to the ```coverage``` documentation for more options.

### General Information

#### Technologies Used

* Python
* Javascript and [jQuery](https://jquery.com/)
* HTML5 and CSS3
* [Flask](http://flask.pocoo.org/)
* [Flask-SQLAlchemy](http://flask-sqlalchemy.pocoo.org/2.1/)
* [PostgresSQL](https://www.postgresql.org/docs/)
* [Jinja2](http://jinja.pocoo.org/docs/dev/)
* [AJAX/JSON](https://api.jquery.com/category/ajax/)
* [Bootstrap](http://getbootstrap.com/2.3.2/)
* [Google Maps API](https://developers.google.com/maps/documentation/javascript/reference)
* [Yelp API](https://github.com/Yelp/yelp-api-v3)
* [PokéAPI](https://pokeapi.co/docsv2/)

#### Authors

Rachel Traina-Grandon | [@designsbytraina](https://twitter.com/designsbytraina)

##### Future Development

* Mobile-optimization
* Saving maps to user profile
* Social media components
* Event coordinating tools
* Incorporate integration with Niantic API/Pokemon GO API (as available)

##### Deployment

This application has not been deployed yet. Contact the author for details.

##### Permissions

Contact the author for permissions.

##### Acknowledgments

* Tomas Gonzalez
* Colin Rigby
* Hackbright Academy
