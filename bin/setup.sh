#!/bin/bash

set -euo pipefail

HEROKU_PRIVATE_SPACE=devspotlight-private

heroku create --space ${HEROKU_PRIVATE_SPACE}

APP=$(heroku apps:info | head -1 | sed 's/=== //')

heroku addons:create heroku-postgresql:hobby-dev --confirm ${APP}
git push heroku master
heroku run make setup-db
heroku open

