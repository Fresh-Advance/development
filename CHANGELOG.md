# Change Log for Sieg Development base

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [v3.0.0] - Unreleased

### Added
- PHP_VERSION as environment variable
- Example recipe to install example scripts :) The idea is to create multiple different recipes in the future
- Possibility to build specific docker-compose.yml file with console command!
  - The file can be build by merging separate smaller chunks (services) together
  - The ``make addservice`` command introduced. Example of usage: ``make file=services/apache.yml addservice``

### Changed
- Example files moved to `recipes/default/examples` directory
  - Files will be copied during the example recipe - ``make example``.
- Default docker-compose.yml.dist have been split to multiple service files and moved to services directory
  - Now, no services are installed by default anymore, but rather, use the ``make addservice`` to add specific services
  - To add all basic services (php, mysql and apache), the ``make addbasicservices`` command can be used

### Fixed
- Readme adjusted by latest changes, please, read from the start, again.

## [v2.0.0] - 2021-12-12

### Added
- PHP 8.0 and PHP 8.1 containers!
- Register a link to apache container for the php container (so its possible to ping one by url)

### Changed
- Base container repositories renamed to siegfuse/php-fpm-X.X-base where (X.X is php version)
- ``latest`` tag of base container is used by default
- Move SPX package installation to base php container. 
  - 7.4 base container rebuilt with latest dependencies and spx.
  - It will allow faster start of the environment.
- ``containers/php-fpm/user.ini`` is renamed to custom.ini.dist. Setup copies it to custom.ini 

### Fixed
- Fix wrong rights for ~/.composer directory. Now composer commands will work properly.

## [v1.4.0] - 2021-11-20

### Added
- Copy ``containers/httpd/project.conf.dist`` to ``containers/httpd/project.conf`` during ``make setup``
- Copy ``docker-compose.yml.dist`` to ``docker-compose.yml`` during ``make setup``

### Changed
- Rename project.conf to project.conf.dist
- Updated the php-fpm image, so it have:
  - composer version 2
  - xDebug 3
- Use node latest

### Fixed
- Configure remote debugging on xDebug 3
- Fix wrong rights on volume synced directory in home of php container
- Update default server for adminer
- Remove node container after use

## [v1.3.0] - 2021-06-04

### Added
- Preconfigure SPX - simple php profiler

### Changed
- Mysql data is now saved between session. Mysql databases are synced to the host system in `data/mysql` directory

## [v1.2.0] - 2021-03-18

### Added
- Mailhog container preconfigured in docker-compose
- Example with php sending email added
- Makefile command ``make php`` to access bash on php container

### Changed
- Reconfigured php log and profiler paths to be always available and no additional configuration required. Available in `data/php` directory.

## [v1.1.0] - 2021-03-16

### Added
- Makefile with main commands:
    - preconfigure with ``make setup``
    - start containers with ``make up``
    - stop containers with ``make down``

## [v1.0.0] - 2019-10-23

[v2.1.0]: https://github.com/Sieg/development/compare/v2.0.0...v2.1.0
[v2.0.0]: https://github.com/Sieg/development/compare/v1.4.0...v2.0.0
[v1.4.0]: https://github.com/Sieg/development/compare/v1.3.0...v1.4.0
[v1.3.0]: https://github.com/Sieg/development/compare/v1.2.0...v1.3.0
[v1.2.0]: https://github.com/Sieg/development/compare/v1.1.0...v1.2.0
[v1.1.0]: https://github.com/Sieg/development/compare/v1.0.0...v1.1.0
[v1.0.0]: https://github.com/Sieg/development/compare/020f452b2a...v1.0.0
