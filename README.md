# Title
Project description

## Project
This project running on Laravel 7.x, using docker as the development
environment setup.

> In order to get the very same environment local as production, and amongst the developers, we use docker to emulate the prod server environment!

You can learn more about docker and its possibilities at: [Docker.com](https://store.docker.com/search?type=edition&offering=community)


## Information
Specs:

- php 7.4
- apache 2.4
- mysql 5.7

## Requirements

- [Docker](https://store.docker.com/search?type=edition&offering=community)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Any bash terminal
- Windows 10 / Linux / MacOS

## Getting started

### Containers

**Note**: 
If you are on windows, you need to add the C:\\ drive to the resource settings 
in docker. See _FAQ_  @ `Windows: "Filesharing has been cancelled"`at the bottom of the readme for instructions.

**To start containers**, simply run:

`$ docker-compose up -d`

The `-d` flag will run the containers as a daemon in the background.

**To stop**:

`$ docker-compose stop`

Stopping can be likened to putting the containers to sleep.

## Dev script
This project consists of a various set of third-party dependency package managers and et cetera. 
Since we run the project in the Docker container, we need to run them all from inside the container. 
For convenience there's a script made to help with this for each package:

> **Tip**: Create an alias for `dev.sh` in bashrc!


> **Windows devs**: If you are on Windows, you need to use a bash terminal in order to run the script.


### Composer
Dependencies are managed through composer.

`$ ./dev.sh composer install`


### Artisan
Artisan is a CLI tool to help with common Laravel tasks.

`$ ./dev.sh artisan`

### PHP CodeSniffer
PHPCS is a package to help enforce clean code base. The rules are specified in `phpcs.xml`
and can be altered at any time.

`$ ./dev.sh phpcs`

To automatic fix all errors:

`$ ./dev.sh phpcbf`


### Container scripts
Sometimes you maybe wish to enter the container to verify, check or execute commands
from there within instead of using the dev script.

`$ ./dev.sh bash`

`$ ./dev.sh root`


## Initial Setup
To install neccesary development tools and first instance of website, run the
suitable commands:


> docker-compose build && docker-compose up -d && ./dev.sh composer install

### Laravel

In a laravel project you will need to set the `.env` file and generate a key. 
There's an example file of the environment file that has been altered in order to minimize
amount of required manual editing. 

`cp laravel/.env.example laravel/.env && ./dev.sh artisan key:generate`

### Done!

You can now visit the project at http://localhost/ .

### Additional

## Mails within the application on local environment (Mailhog)
The docker setup includes a Mailhog installation, for you to test the mail functionalities (if any)
within your local environment. 

> http://localhost:8025/

## FAQ

### How do I connect to the database?
Using any database GUI software, use the following credentials in order to connect to
the local database in your environment that's set up from docker.

* Host: 0.0.0.0 (or localhost)
* User: laravel
* Password: laravel
* Database: laravel

### Is the production also within a container?
Due to (docker being a performance issue)[https://docs.docker.com/config/containers/runmetrics/], 
the project uses it only for local environments.

### How do I enter the container?
The dev.sh script has the answer!

`./dev.sh bash`

alternatively, enter as root

`./dev.sh root`

### I got permission issues?
Depending on OS, it can give these mysterious problems for some.

Fix it by:

`./dev.sh root`


`$ chown -R www-data:www-data /var/www`

### Windows: "Filesharing has been cancelled"

Add the C:\\ drive to the resource settings in docker.

![Windows fileshare issue](help/windows-docker-help.png)

### On Windows, can I set an alias for the dev script?

Of course! Using bash, you can simply create an `.bashrc` file with your aliases
within. Some good aliases would be `d` for `dev.sh` and `dc` for `docker-compose`.
