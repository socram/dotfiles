#!/bin/bash


imageName=$(tr -dc '1234567890+ABCDEFGHIJLMNOPQRSTUVXZabcdefghijlmnopqrstuvxz' < /dev/urandom | head -c 5 | sed 's/$/.png/g')
gnome-screenshot -acf /home/mconceicao/Desktop/imagens-spc/${imageName}
