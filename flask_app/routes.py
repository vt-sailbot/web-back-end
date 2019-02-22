def apply_routes(app):
    """Sets up the API endpoints for HTTP requests

    Keyword arguments:
    app -- The Flask app
    """

    @app.route('/')
    def hello_world():
        return 'Hello, world!'
