#!/bin/bash

echo "Obtener el nombre del primer usuario creado en el sistema:"

USER_1000=$(cat /etc/passwd | grep 1000 | cut -d: -f1) ; echo
$USER_1000
USER_1001=$(cat /etc/passwd | grep 1001 | cut -d: -f1) ; echo
$USER_1001

USER_1000=$(cat /etc/passwd | grep 1000 | cut -d: -f1) ;
HOME_USER_1000=/home/$USER_1000 ; echo $HOME_USER_1000
USER_1001=$(cat /etc/passwd | grep 1001 | cut -d: -f1) ;
HOME_USER_1001=/home/$USER_1001 ; echo $HOME_USER_1001


echo "Comprobar la Fecha actual del Equipo:"

FECHA_ACTUAL=$(date +"%d %b %y") ; echo $FECHA_ACTUAL


echo "Comprobar la Hora actual del Equipo:"

HORA_ACTUAL=$(date +"%H:%M") ; echo $HORA_ACTUAL


echo "Comprobar si el Host tiene conexión a Internet:"

if ping -c 1 8.8.8.8 &> /dev/null; then CONEXION_INTERNET=Habilitado;
else CONEXION_INTERNET=Deshabilitado; fi ; echo $CONEXION_INTERNET
TEST_PING=$(ping 192.168.3.249 -c 5 | grep packet | awk '{print $6}'
| cut -f1 -d%) ; echo $TEST_PING % de Perdida de paquetes
TEST_LATENCIA=$(ping 8.8.8.8 -c 5 | grep packet | awk '{print $10}' |
cut -f1 -d%) ; echo $TEST_LATENCIA de Latencia del Enlace


echo "Comprobar el tipo de Sistema Operativo:"

SISTEMA_OPERATIVO=$(uname -o) ; echo $SISTEMA_OPERATIVO


echo "Comprobar el nombre, versión y subversión del Sistema Operativo:"

NOMBRE_SISTEMA=$(cat /etc/os-release | grep NAME | grep -v "VERSION"
| sed -n '2p' | cut -f2 -d\") ; echo $NOMBRE_SISTEMA
VERSION_SISTEMA=$(cat /etc/os-release | grep VERSION= | sed -n '1p' |
sed 's/VERSION=//' | sed 's/"//g') ; echo $VERSION_SISTEMA
SUBVERSION_SISTEMA=$(lsb_release -d | awk '{print $4}') ; echo
$SUBVERSION_SISTEMA


echo "Comprobar la arquitectura del Sistema Operativo:"

ARQUITECTURA=$(uname -m) ; echo $ARQUITECTURA
ARQUITECTURA=$(uname -m) ; if [[ "$ARQUITECTURA" = "x86" ]]; then
ARQ_SISTEMA=32; else ARQ_SISTEMA=64; fi ; echo $ARQ_SISTEMA


echo "Comprobar la versión del kernel del Sistema Operativo:"

VERSION_KERNEL=$(uname -r) ; echo $VERSION_KERNEL


echo "Comprobar el nombre del Host:"

NOMBRE_HOST=$(cat /etc/hostname) ; echo $NOMBRE_HOST


echo "Comprobar IP Interna y Externa (Principal de Salida a Internet):"

IP_INTERNA=$(hostname -I) ; echo $IP_INTERNA
IP_EXTERNA=$(curl -s ipecho.net/plain;echo) ; echo $IP_EXTERNA


echo "Comprobar Valores (IP / MAC) de las Interfaces de Red:"

IP_ETH0=$(ifconfig eth0 | grep inet | grep -v inet6 | cut -d ":" -f 2
| cut -d " " -f 1) ; echo $IP_ETH0
MAC_ETH0=$(ifconfig eth0 | sed -n '1p' | awk '{print $5}') ; echo
$MAC_ETH0
IP_WLAN0=$(ifconfig wlan0 | grep inet | grep -v inet6 | cut -d ":" -f
2 | cut -d " " -f 1) ; echo $IP_WLAN0
MAC_WLAN0=$(ifconfig wlan0 | sed -n '1p' | awk '{print $5}') ; echo
$MAC_WLAN0


echo "Comprobar el Proxy / Gateway del Sistema Operativo:"

PROXY_GATEWAY=$(route -n | sed -n '3p' | awk '{print $2}') ; echo
$PROXY_GATEWAY


echo "Comprobar el Nombre de Dominio de Red del Host:"

DOMINIO=$(cat /etc/resolv.conf | sed '2 d' | grep search | sed -n
'1p' | awk '{print $2}') ; echo $DOMINIO


echo "Comprobar la Dirección de Red (IP) del Servidor DNS del Host:"

IP_SERVIDOR_DNS=$(cat /etc/resolv.conf | sed '1 d' | awk '{print
$2}') ; echo $IP_SERVIDOR_DNS


echo "Comprobar usuarios conectados al Host:"

who>/tmp/who ; echo -e "Usuarios conectados al Host :" && echo "" &&
echo "Usuarios Puertos
Fecha
Hora Pantalla" ; echo
"*************************************************************************"
&& cat /tmp/who

USUARIOS_CONECTADOS=$(who | awk '{print $1}') ; echo
$USUARIOS_CONECTADOS
USER_ONLINE1=$(who | awk '{print $1}') ; echo $USER_ONLINE1 | wc -w
USER_ONLINE2=$(top -n 1 -b | grep "load average:" | awk '{print $6}')
; echo $USER_ONLINE2


echo "Comprobar Carpeta de Usuario con más data (# de Archivos / Tamaño en Bytes) en el Sistema
Operativo:"

CARPETA_USUARIO1=$(ls -l /home | sed '1 d' | sort -k2 | sed q | awk
'{print $9}') ; echo $CARPETA_USUARIO1
DATA_USUARIO1=$(du -sh /home/* | sort -r | sed q | awk '{print $1}')
; echo $DATA_USUARIO1


echo "Comprobar Tamaño en Bytes de Carpeta de Superusuario u otra Carpeta del Sistema
Operativo:"

DATA_ROOT=$(du -sh /root | awk '{print $1}') ; echo $DATA_ROOT
DATA_CARPETA1=$(du -sh /var | awk '{print $1}') ; echo $DATA_CARPETA1
NOMBRES_CARPETAS=$(ls -l /home | sed '1 d' | awk '{print $9}') ; echo
$NOMBRES_CARPETAS
NUMERO_CARPETAS=$(ls -l /home | sed '1 d' | awk '{print $9}') ; echo
$NUMERO_CARPETAS | wc -w


echo "Comprobar Usuarios con UID 0 Y GID 0 (SUPERUSUARIOS) creados:"

SUPERUSUARIOS_UID=$(awk -F: '{if ($3==0) print $1}' /etc/passwd) ;
echo $SUPERUSUARIOS_UID
SUPERUSUARIOS_GID=$(awk -F: '{if ($3==0) print $1}' /etc/passwd) ;
echo $SUPERUSUARIOS_GID


echo "Comprobar estado de la Memoria RAM y Swap:"

MEM_TOTAL=$(free -h | sed '1 d' | grep Mem: | awk '{print $2}') ;
echo $MEM_TOTAL
MEM_USADA=$(free -h | sed '1 d' | grep Mem: | awk '{print $3}') ;
echo $MEM_USADA
MEM_LIBRE=$(free -h | sed '1 d' | grep Mem: | awk '{print $4}') ;
echo $MEM_LIBRE
MEM_COMPARTIDA=$(free -h | sed '1 d' | grep Mem: | awk '{print $5}')
; echo $MEM_COMPARTIDA
MEM_ALMACENADA=$(free -h | sed '1 d' | grep Mem: | awk '{print $6}')
; echo $MEM_ALMACENADA
MEM_CACHEADA=$(free -h | sed '1 d' | grep Mem: | awk '{print $7}') ;
echo $MEM_CACHEADA
SWAP_TOTAL=$(free -h | sed '1 d' | grep Swap: | awk '{print $2}') ;
echo $SWAP_TOTAL
SWAP_USADA=$(free -h | sed '1 d' | grep Swap: | awk '{print $3}') ;
echo $SWAP_USADA
SWAP_LIBRE=$(free -h | sed '1 d' | grep Swap: | awk '{print $4}') ;
echo $SWAP_LIBRE


echo "Comprobar Estado de las particiones / punto de montaje de un Disco SATA:"

PART1_TOTAL=$(df -h | sed '1 d' | grep /dev/sda5 | awk '{print $2}')
; echo $PART1_TOTAL
PART1_USADO=$(df -h | sed '1 d' | grep /dev/sda5 | awk '{print $3}')
; echo $PART1_USADO
PART1_DISPONIBLE=$(df -h | sed '1 d' | grep /dev/sda5 | awk '{print
$4}') ; echo $PART1_DISPONIBLE
PART1_PORCENTAJE=$(df -h | sed '1 d' | grep /dev/sda5 | awk '{print
$5}') ; echo $PART1_PORCENTAJE
PART1_PUNTOMONTAJE=$(df -h | sed '1 d' | grep /dev/sda5 | awk
'{print $6}') ; echo $PART1_PUNTOMONTAJE


echo "Comprobar la Carga promedio del Sistema (Procesos encolados):"

CARGA_1MIN=$(top -n 1 -b | grep "load average:" | awk '{print $10}'
| sed 's/,//2') ; echo $CARGA_1MIN
CARGA_5MIN=$(top -n 1 -b | grep "load average:" | awk '{print $11}'
| sed 's/,//2') ; echo $CARGA_5MIN
CARGA_15MIN=$(top -n 1 -b | grep "load average:" | awk '{print $12}'
| sed 's/,//2') ; echo $CARGA_15MIN
CARGA_1MIN=$(uptime | awk '{print $8}' | sed 's/,//2') ; echo
$CARGA_1MIN
CARGA_5MIN=$(uptime | awk '{print $9}' | sed 's/,//2') ; echo
$CARGA_5MIN
CARGA_15MIN=$(uptime | awk '{print $10}' | sed 's/,//2') ; echo
$CARGA_15MIN


echo "Comprobar procesos Zombies en el Sistema Operativo:"

PROC_ZOMBIE=$(top -n 1 -b | grep "zombie" | awk '{print $10}') ;
echo $PROC_ZOMBIE


echo "Comprobar el Tiempo de Total de Trabajo (Arranque/Encendido):"

TIEMPO_ENCENDIDO=$(uptime | awk '{print $3,$4}' | cut -f1 -d,) ; echo
$TIEMPO_ENCENDIDO


echo "Comprobar parámetros de la tarjeta de Vídeo:"

Fabricante:

FAB_TVIDEO=$(lspci -v | grep "VGA" | cut -d " " -f05) ; echo
$FAB_TVIDEO

echo "Memoria RAM:"

MEM_TVIDEO=$(lspci -v -s `lspci | awk '/VGA/{print $1}'` | sed -n
'/Memory.*, prefetchable/s/.*\[size=\([^]]\+\)M\]/\1/p') ; echo
$MEM_TVIDEO

echo "Modulo (Driver):"

DRV_TVIDEO=$(lspci -nnk | grep -i vga -A3 | grep 'in use' | cut -d "
" -f05) ; echo $DRV_TVIDEO

echo "Aceleración 3D:"

A3D_TVIDEO=$(glxinfo | grep "direct rendering: Yes" | awk '{print
$3}') ; echo $A3D_TVIDEO


echo "Comprobar parámetros del Procesador (CPU):"

echo "Fabricante:"

FABRICANTE_CPU=$(grep "vendor_id" /proc/cpuinfo | sed q | awk
'{print $3}') ; echo $FABRICANTE_CPU

echo "Modelo:"

MODELO_CPU=$(grep "model name" /proc/cpuinfo | sed q | cut -d ":" -f
2 | awk '{print $0}') ; echo $MODELO_CPU

echo "Cantidad:"

NUM_CPU=$(grep "processor" /proc/cpuinfo | sort -r | sed q | awk
'{print $3}') ; TOTAL_CPU=$((`expr $NUM_CPU + 1`)) ; echo $TOTAL_CPU

echo "Nucleos por CPU:"

NUCLEO_CPU=$(grep "cpu cores" /proc/cpuinfo | sed q | awk '{print
$4}') ; echo $NUCLEO_CPU

echo "Total de Nucleos por CPUs:"

NUM_CPU=$(grep "processor" /proc/cpuinfo | sort -r | sed q | awk
'{print $3}') ; TOTAL_CPU=$((`expr $NUM_CPU + 1`)) ;
NUCLEO_CPU=$(grep "cpu cores" /proc/cpuinfo | sed q | awk '{print
$4}') ; TOTAL_NUCLEO_CPU=$((`expr $TOTAL_CPU \* $NUCLEO_CPU`)) ; echo
$TOTAL_NUCLEO_CPU

echo "Memoria caché del CPU:"

CACHE_CPU=$(grep "cache size" /proc/cpuinfo | sed q | cut -d ":" -f
2 | awk '{print $0}') ; echo $CACHE_CPU


