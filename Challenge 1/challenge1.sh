#!/bin/bash

# Verificar si se han proporcionado suficientes argumentos
if [ "$#" -ne 8 ]; then
    echo "Uso: $0 <nombre_vm> <tipo_so> <cpus> <ram_gb> <vram_mb> <tamano_disco_gb> <controlador_sata> <controlador_ide>"
    exit 1
fi

# Asignación de argumentos a variables
NOMBRE_VM=$1
TIPO_SO=$2
CPUS=$3
RAM_GB=$4
VRAM_MB=$5
TAMANO_DISCO_GB=$6
CONTROLADOR_SATA=$7
CONTROLADOR_IDE=$8

# Crear la máquina virtual
VBoxManage createvm --name "$NOMBRE_VM" --ostype "$TIPO_SO" --register

# Configurar la máquina virtual
VBoxManage modifyvm "$NOMBRE_VM" --cpus "$CPUS" --memory "$((RAM_GB * 1024))" --vram "$VRAM_MB"

# Crear disco duro virtual
VBoxManage createhd --filename "${NOMBRE_VM}.vdi" --size "$((TAMANO_DISCO_GB * 1024))"

# Añadir controlador SATA
VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR_SATA" --add sata --controller IntelAhci

# Añadir disco duro al controlador SATA
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR_SATA" --port 0 --device 0 --type hdd --medium "${NOMBRE_VM}.vdi"

# Añadir controlador IDE
VBoxManage storagectl "$NOMBRE_VM" --name "$CONTROLADOR_IDE" --add ide

# Asociar el controlador IDE a un CD/DVD (por defecto está vacío)
VBoxManage storageattach "$NOMBRE_VM" --storagectl "$CONTROLADOR_IDE" --port 0 --device 0 --type dvddrive --medium emptydrive

# Mostrar configuración final
echo "Configuración de la máquina virtual $NOMBRE_VM:"
VBoxManage showvminfo "$NOMBRE_VM"

echo "Máquina virtual creada y configurada exitosamente."
