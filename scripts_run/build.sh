#! /bin/sh
set -e
if [ -f ./.env ]
then
  export $(cat ./.env | xargs)
fi
printenv
echo "env variables imported"

image_name="${IMAGE_NAME:-"el-flask-kustomize-test"}"
tag_name="${TAG_NAME:-"gunicorn"}"
use_tag="$image_name:${tag_name}-0.1"

DOCKERFILE="${tag_name}.dockerfile"
docker build -t "$use_tag" --file "./flask_app_internal/${DOCKERFILE}" ./flask_app_internal/