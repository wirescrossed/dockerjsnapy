docker run -i -t -e PYTHONWARNINGS="ignore" -v $PWD/snapshots:/root/jsnapy/snapshots/ -v $PWD/tests:/usr/src/app wirescrossed/jsnapy:latest "$@"
