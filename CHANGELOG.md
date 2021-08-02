# Change Log for Sieg Development base

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [v1.4.0] - Unreleased

### Added
- Copy ``containers/httpd/project.conf.dist`` to ``containers/httpd/project.conf`` during ``make setup``

### Changed
- Rename project.conf to project.conf.dist

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

[v1.4.0]: https://github.com/Sieg/development/compare/v1.3.0...master
[v1.3.0]: https://github.com/Sieg/development/compare/v1.2.0...v1.3.0
[v1.2.0]: https://github.com/Sieg/development/compare/v1.1.0...v1.2.0
[v1.1.0]: https://github.com/Sieg/development/compare/v1.0.0...v1.1.0
[v1.0.0]: https://github.com/Sieg/development/compare/020f452b2a...v1.0.0
