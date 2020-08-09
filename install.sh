#!/bin/bash

##################################################################
################  DETTE SKRIPT VIL INSTALLERE NETTO ##############
##################################################################
flag=0
install=0
clear
echo "NETTO INSTALLER (ALPHA 0.23)"
echo ""
(sudo cp -i  -v netto /usr/bin/netto)
echo ""
echo "DETTE SKRIPTS FUNKTIONALITET ER BASERET PÅ NETWORKMANAGER (nmcli)."
echo "HVIS NETWORKMANAGER IKKE ER DIN PRIMÆRE NETVÆRKSDRIVER, VIL DELE"
echo "AF SKRIPTET IKKE FUNGERE."
echo ""
echo "HVIS DER MANGLER PAKKER, DER ER NØDVENDIGE FOR SKRIPTETS FULDE"
echo "FUNKTIONALITET, LISTES DISSE HER UNDER:"
echo ""
if ! command -v nmcli &> /dev/null; then
	echo "(!) NETWORKMANAGER IKKE INSTALLERET ELLER IKKE TILSTRÆKKELIGT OPSAT."
	echo "(!) Skriptet har muligvis meget begrænset funktion."
	echo ""
	flag=$((flag+1))
elif ! command -v openvpn &> /dev/null; then
	echo "(!) OPENVPN IKKE INSTALLERET ELLER IKKE TILSTRÆKKELIGT OPSAT."
	echo "    Skriptets funktion er begrænset."
	echo ""
	flag=$((flag+1))
elif ! command -v aircrack-ng &> /dev/null; then
	echo "(!) AIRCRACK-NG IKKE INSTALLERET ELLER IKKE TILSTRÆKKELIGT OPSAT."
	echo "    Skriptets funktion er begrænset."
	echo ""
	flag=$((flag+1))
elif ! command -v hashcat &> /dev/null; then
	echo "(!) HASHCAT IKKE INSTALLERET ELLER IKKE TILSTRÆKKELIGT OPSAT."
	echo "    Skriptets funtion er begrænset."
	echo ""
	flag=$((flag+1))
elif  ! command -v ifconfig &> /dev/null; then
	echo "(!) IFCONFIG IKKE INSTALLERET ELLER IKKE TILSTRÆKELIGT OPSAT."
	echo "    skriptets funtion er begrænset."
	echo ""
	flag=$((flag+1))
elif  ! command -v lsusb &> /dev/null; then
	echo "(!) LSUSB IKKE INSTALLERET ELLER IKKE TILSTRÆKELIGT OPSAT."
	echo "    skriptets funtion er begrænset."
	echo ""
	flag=$((flag+1))
fi
if [ ! $flag == 0 ]; then
	echo "SKRIPTET MANGLER MINIMUM $flag INSTALLATIONER."
	echo "DISSE KAN INSTALLERES VED BRUG AF DISTRIBUTIONENS"
	echo "PAKKEHÅNDTERING."
elif [ $flag == 0 ]; then
	echo "(!) INGEN MANGLENDE PAKKER FUNDET."
fi
pathd="${HOME}/dicts"
pathr="${HOME}/rules"
patov="/etc/openvpn"
if [ ! -d $pathd ]; then
	echo "(!) ORDBØGER RELATERET TIL AIRCRACK-NG OG HASHCAT PLACERES I $pathd."
	echo ""
elif [ ! -d $pathr ]; then
	echo "(!) REGEL LISTER RELATERET TIL AIRCRACK-NG OG HASHCAT PLACERES I $pathr."
	echo ""
elif [ ! -d $patov ]; then
	echo "(!) OPENVPN KONFIGURATIONS -OG ADGANGSKODEFILER PLACERES I $pathr."
	echo ""
fi
exit
