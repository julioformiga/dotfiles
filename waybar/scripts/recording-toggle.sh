#!/bin/bash
# Script para iniciar/parar a gravação e abrir o vídeo

temp_file="/tmp/recording_file.txt"

if pgrep -x "wf-recorder" > /dev/null; then
    pkill -f wf-recorder
    if [[ -f "$temp_file" ]]; then
        arquivo=$(cat "$temp_file")
        notify-send "Gravação Parada" "Vídeo salvo em: $arquivo"
        vlc "$arquivo" &
        rm "$temp_file"
    else
        notify-send "Erro" "Arquivo de gravação não encontrado!"
    fi
else
    arquivo="$HOME/Videos/recording_$(date +%Y-%m-%d_%H-%M-%S).mp4"
    echo "$arquivo" > "$temp_file"
    wf-recorder -c libx265 -o HDMI-A-1 -f "$arquivo" &
    notify-send "Gravação Iniciada" "Gravando em: $arquivo"
fi
