#!/bin/bash

echo '1-5' | sudo -A tee /sys/bus/usb/drivers/usb/unbind > /dev/null
