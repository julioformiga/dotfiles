#!/bin/bash
# Verifica se o wf-recorder está em execução e exibe o tempo de gravação

if pgrep -x "wf-recorder" > /dev/null; then
    tempo=$(ps -o etime= -p $(pgrep -x "wf-recorder") | tr -d ' ')
    echo '{"text": " ['$tempo']", "tooltip": "Gravação em andamento", "class": "recording-active"}'  # JSON com ícone e tooltip
else
    echo '{"text": " ", "tooltip": "", "class": "recording-inactive"}'  # JSON vazio se não estiver gravando
fi
