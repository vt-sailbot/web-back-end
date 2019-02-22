from flask import Flask

from flask_app.routes import apply_routes


def create_app(test_config=None):
    """Builds the Flask app

    Keyword arguments:
    test_config -- The test configuration, if one exists
    """
    app = Flask(__name__)

    if test_config is None:
        app.config.from_pyfile('config.py', silent=True)
    else:
        app.config.from_mapping(test_config)

    # Sets up application routes
    apply_routes(app)

    return app
