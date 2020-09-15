# Smallest PHP 7.4 container using multi-threaded PHP Built-in web server

Built image size: 14.8 MB (!)

### Run with docker-compose

```
docker-compose up
```

Go to: http://localhost:4000/

`webroot/` will be mounted inside the container for easy development.

### Build and run manually

```
docker build . -t pico-php
```

This will bake the files from `webroot/` into your image.

Run manually

```
docker run -p 4000:4000 pico-php
```

Now you can visit http://localhost:4000/ to see your build in action!

# Use in your application:

Either start from existing image and add your project files and dependencies:

```
FROM ...
```

Or fork this image and use the included GitHub workflow to publish it yourself.