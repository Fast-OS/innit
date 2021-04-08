#!/bin/bash
udevd --daemon
udevadm trigger --attr-match=dev --action=add
udevadm trigger --subsystem-match=net --action=add
udevadm trigger --type=subsystems --action=add
udevadm trigger --type=devices --action=add