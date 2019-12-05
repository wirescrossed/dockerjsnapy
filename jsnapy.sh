docker run -i -t -v $PWD/snapshots:/root/jsnapy/snapshots/ -v $PWD/tests:/usr/src/app wirescrossed/jsnapy:latest "$@"
