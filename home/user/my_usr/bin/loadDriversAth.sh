#!/bin/bash

modprobe  ath9k_htc; modprobe  ath9k; modprobe  ath ; lsmod | grep ath

exit 0
