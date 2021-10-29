#! /bin/sh
set -e

if [ -f ./.env ]
then
  export $(cat ./.env | xargs)
fi
echo "env variables exported"
printenv

bash ./flask_app_external/entrypoint.sh
bash ./flask_app_external/start_gunicorn.sh