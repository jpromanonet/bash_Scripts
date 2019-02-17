#!/bin/bash

echo "Actualizando repositorios"
slpkg update

echo "Seleccionando respositorios activos"
n=$( slpkg repo-list | grep enabled | wc -l )
list=$( slpkg repo-list | grep enabled | head -n $(( n-1 )) | cut -d " " -f 3 )

echo "Actualizando sistema"
for reposerver in $list; do 
	slpkg -c $reposerver --upgrade
done

exit 0
