#!/bin/bash
# restart docker service because it hangs in vm with dhcp
sudo systemctl restart docker
# build search_engine_ui_container
docker build -t coolf124/search_engine_ui:1.0 ./search_engine_ui
