#!/bin/bash
# Script para capturar uma área da tela e copiar para a área de transferência

# Caminho do arquivo de screenshot
arquivo="$HOME/Pictures/Screenshots/Screenshot-$(date +'%Y-%m-%d_%H-%M-%S').png"

# Captura a área selecionada com o slurp
grim -g "$(slurp -b 00000077 -c ffffffff)" - | tee "$arquivo" | wl-copy --type image/png

# Exibe uma notificação
notify-send "Captura de Tela" "Screenshot salvo em: $arquivo"
