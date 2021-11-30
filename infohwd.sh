#! /bin/bash

#---------------------------------------------------------------------------------------------------------------

# Script to make individual or full reports about the hardware use and stats of the server or desktop computer.
# It only works over Debian or derivate Linux distributions.
# License: MIT

#---------------------------------------------------------------------------------------------------------------

function instalaraplic # function to install libraries 
    {

        sudo apt-get install hwinfo
        sudo apt-get install pydf

    }

function informetotal # function to make a full report of the computer's hardware
    {

        lscpu
        lshw
        lshw -short
        hwinfo
        hwinfo -short
        lspci
        lsscsi
        lsusb
        lsusb -v
        inxi -fx
        lsblk
        df
        df -h
        pydf
        fdisk -l
        mount | column -t
        free -m
        dmidecode
        hdparm -i /dev/sda
        bash infohwd.sh
    
    }

function cpu1 # function to make a report over the cpu use and stats
    {
        
        echo '.......Informacion de CPU.......'
        echo 
        echo
        echo
        lscpu
        echo
        echo
        echo
        bash infohwd.sh
    
    }

function hard1 # function to make a report over the HDD use and stats
    {

        echo '.......Informacion de Hardware.......'
        echo
        echo
        echo
        lshw
        lshw -short
        hwinfo
        hwinfo -short
        echo
        echo
        bash infohwd.sh

    }

function pci # function to make a report over the PCI uses and stats
    {

        echo '.......Dispositivos PCI.......'
        echo
        echo
        echo
        lspci
        echo
        echo
        echo
        bash infohwd.sh

    }

function diskos # function to make a report over the HDD but about the space and use of the different sectors in the disk
    {

        echo '.......Informacion de Disco/s'
        echo
        echo
        echo
        lsscsi
        lsblk
        df
        pydf
        fdisk -l
        mount | column -t
        hdparm -I /dev/sda
        echo
        echo
        echo
        bash infohwd.sh

    }

function usbint1 # function to make a report over the USB use and stats
    {

        echo '.......Dispositivos USB.......'
        echo
        echo
        echo
        lsusb
        lsusb -v
        echo
        echo
        bash infohwd.sh

    }

function infomobobios # function to make a report about the status of the BIOS and MOBO.
    {

        echo '.......Informacion del Mother y BIOS.......'
        echo
        echo
        echo
        inxi -fx
        free -m
        dmidecode
        echo
        echo
        echo
        bash infohwd.sh

    }

# The menu to select the function that we want to run.
echo
echo
echo '-------INFORMACION DE HARDWARE-------'
echo
echo
echo
echo 'Informacion del CPU.......1'
echo
echo 'Informacion de Hardware en uso.......2'
echo
echo 'Informacion de dispositivos PCI.......3'
echo
echo 'Informacion de Discos......4'
echo
echo 'Informacion de dispositivos USB.......5'
echo
echo 'Informacion de MOTHER y BIOS.......6'
echo
echo 'Informe Completo (Incluye todo el menu).......7'
echo
echo 'Instalar aplicaciones de diagnostico.......8'
echo
echo 'Salir.......9'
echo
echo
read opcion # We input the value in the variable 'opcion'
# A case option is created to start the functions called by the read statement over the ones printed in the menu
case $opcion in
    1)
        cpu1
    ;;
    2)
        hard1
    ;;
    3)
        pci
    ;;
    4)
        diskos
    ;;
    5)
        usbin1
    ;;
    6)
        infomobobios
    ;;
    7)
        informetotal
    ;;
    8)
        instalaraplic
    ;;
    9)
        exit
        exit
    ;;
    *)
        echo 'Desconozco esa opcion'
        bash infohwd.sh
    ;;
esac
