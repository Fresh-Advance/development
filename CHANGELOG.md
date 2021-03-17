# Change Log for Sieg Development base

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [v1.2.0] - Unreleased

### Added
- Mailhog container preconfigured in docker-compose
- Example with php sending email added

### Changed
- Reconfigured php log and profiler paths to be always available and no additional configuration required. Available in data/php directory.

## [v1.1.0] - 2020-03-16

### Added
- Makefile with main commands:
    - preconfigure with ``make setup``
    - start containers with ``make up``
    - stop containers with ``make down``

## [v1.0.0] - 2019-10-23

[v1.2.0]: https://github.com/Sieg/development/compare/v1.1.0...master
[v1.1.0]: https://github.com/Sieg/development/compare/v1.0.0...v1.1.0
[v1.0.0]: https://github.com/Sieg/development/compare/020f452b2a...v1.0.0