#!/bin/bash
# Proper header for a Bash script.

if [ -w "./nginx_default_conf" ] && [ -w "./nginx_default_conf_fixed" ] && [ -w "/etc/nginx/sites-available/default" ]; then 
  sudo rm ./nginx_default_conf
  sudo cp ./nginx_default_conf_fixed ./nginx_default_conf
  sudo rm /etc/nginx/sites-available/default
  sudo cp ./nginx_default_conf_fixed /etc/nginx/sites-available/default
  sudo service nginx restart
  echo "SUCCESS!!! :)"
else
  echo "ERROR: Something went wrong."
  echo "Make sure you downloaded BOTH files, and put them in same folder your 'Vagrantfile' is in."
  echo "Also make sure you are running this INSIDE vagrant (so you'll have to do vagrant ssh first)"
  echo "Make sure you ran the script with sudo!! 'sudo ./nginx_rails_fix.sh'"
fi