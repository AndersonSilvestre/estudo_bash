#!/bin/bash

# Programa para verificar se o Anydesk está ativo
# E caso não esteja inicializa-lo

name_service='anydesk'
status_off='SERVICE_NOT_RUNNING'
status=$($name_service '--get-status')

if [ $status = $status_off ]
	then
		sudo systemctl 'start' $name_service 
		notify-send -i dialog-warning -t 10000 'Iniciando Anydesk' 'O serviço Anydesk está sendo iniciado'
	else
		echo "ta rodando"
		# sudo -u user DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus \ 
 		notify-send 'Anydesk Ativo' 'O serviço Anydesk já está ativo.'
fi