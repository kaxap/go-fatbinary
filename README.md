# go-fatbinary

Build Go fat binary without installing Go on your machine.
This requires Docker though.

1. Copy `go-build.sh` and `Dockerfile` to your project's root folder.
2. Run `./go-build.sh` (this may require `chmod +x go-build.sh`)

After successfull execution a file named `app` should appear in your project's root folder.

## Pros:
1. Doesn't require a Go installation on the machine.
2. By changing Go image version in the `Dockerfile` it is possible to build your sources with different versions of Go.
3. Randomized image names allow to run two or more builds simultaniously.

## Cons:
1. Requires Docker installed.
2. May result in garbage docker images if `docker run` within build.sh has failed for some reason (never happened to me). It is possible to check for such images by running `docker images | grep go_build_image`
