import unittest
from flask_app import create_app


class TestHelloWorld(unittest.TestCase):
    """Tests the hello_world method."""
    def setUp(self):
        self.client = create_app({'TESTING': True}).test_client()

    def test_hello_world(self):
        string = self.client.get('/').data

        assert string == b'Hello, world!'


if __name__ == '__main__':
    unittest.main()
