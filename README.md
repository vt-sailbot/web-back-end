# web-back-end

[![Build status](https://travis-ci.com/vt-sailbot/web-back-end.svg?branch=master)](https://travis-ci.com/vt-sailbot/web-back-end)
[![Coverage Status](https://coveralls.io/repos/github/vt-sailbot/web-back-end/badge.svg?branch=master)](https://coveralls.io/github/vt-sailbot/web-back-end?branch=master)
[![License information](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/vt-sailbot/web-back-end/blob/master/LICENSE)

### Installation Instructions

Clone the repository, and run `make init`.

### Testing Instructions

Run `make test` to run the tests. Run `coverage report` (in the context of the `p3_7env` virtual environment) to see test coverage metrics.

### Development Build

To run the build for testing purposes during development, run `make dev`. This will start a development server listening on `127.0.0.1:5000`. Use `ctrl C` to stop the server. The development server will watch the source files and automatically reload changes, so you don't have to manually restart every time you change something (although if something isn't working, that's still a good strategy).