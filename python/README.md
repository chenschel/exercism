# Run pytest from docker

```docker run -it --rm --name python-exercism -v "$PWD"/python:/usr/src/app chenschel/exercism/python python -m pytest hello-world/hello_world_test.py```
