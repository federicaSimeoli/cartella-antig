#!/bin/bash

# Script per automatizzare commit e push su GitHub

# Verifica se siamo in un repository git
if [ ! -d .git ]; then
    echo "Errore: Questa cartella non è un repository Git."
    exit 1
fi

# Aggiunge tutti i file modificati/nuovi
git add .

# Chiede un messaggio di commit (opzionale, default: 'update')
read -p "Inserisci il messaggio di commit [Update]: " message
message=${message:-Update}

# Esegue il commit
git commit -m "$message"

# Esegue il push
echo "Invio dei dati a GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ Successo! Le modifiche sono state caricate su GitHub."
else
    echo "❌ Errore durante il push. Verifica la tua connessione o le credenziali."
fi
