# Changelog

## [qemu-0.5.0] - 2023-06-20
### Changed
- Update .NET to 4.8

## [qemu-0.4.2] - 2023-02-23
### Changed
- Use newer Windows ISO
- Use newer cloudbase-init 1.1.4
- Enables disk performance counters [(Issue #3)](https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/issues/3)

## [qemu-0.4.1] - 2022-10-11
### Changed
- No changes, new build to install more windows updates

## [vbox-0.3.0], [qemu-0.4.0] - 2021-09-30
### Changed
- Set NTP server to ntp1.muni.cz

## [vbox-0.2.0] - 2021-07-29
### Changed
- Allowed basic auth and http listener for winrm

## [vbox-0.1.0] - 2021-04-13
### Changed
- Disabled basic auth and http listener for winrm
- More windows updates will be installed
- Allowed ICMP ping for IPv4 and IPv6

## [qemu-0.3.0] - 2021-04-10
### Changed
- Disabled basic auth and http listener for winrm
- More windows updates will be installed
### Fixed
- Issue with password being changed on every reboot for `windows` user

## [qemu-0.2.0] - 2021-02-15
### Changed
- Allowed ICMP ping for IPv4 and IPv6
### Added
- This CHANGELOG file and versioning

## [qemu-0.1.0] - 2020-10-11
### Changed
- Started using [sysprep](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/sysprep--generalize--a-windows-installation)


[qemu-0.1.0]: https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/tree/eb4a46ac34d2013967e73b3d7193c1624b6698a4
[qemu-0.2.0]: https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/tree/qemu-0.2.0
[qemu-0.3.0]: https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/tree/qemu-0.3.0
[qemu-0.4.0]: https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/tree/qemu-0.4.0
[qemu-0.4.1]: https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/tree/qemu-0.4.1
[qemu-0.4.2]: https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/tree/qemu-0.4.2
[qemu-0.5.0]: https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/tree/qemu-0.5.0
[vbox-0.1.0]: https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/tree/vbox-0.1.0
[vbox-0.2.0]: https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/tree/vbox-0.2.0
[vbox-0.3.0]: https://gitlab.ics.muni.cz/muni-kypo-images/windows-server-2019/-/tree/vbox-0.3.0
