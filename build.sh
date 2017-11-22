
set -e

NUMBER=$(cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | sed -e 's/^0*//' | head --bytes 5)
if [ "$NUMBER" == "" ]; then
  NUMBER=0
fi

IMAGE_NAME="go_build_image$NUMBER"

docker build -t $IMAGE_NAME --build-arg project_name=${PWD##*/} .
docker run --rm -it -v ${PWD}:/gobuild $IMAGE_NAME cp /app /gobuild/
docker rmi $IMAGE_NAME