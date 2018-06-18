#!/bin/bash

amixer get Master -M | grep -oE "[[:digit:]]*%" -m 1
