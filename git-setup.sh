#!/bin/bash
set -e
echo ""
# ===== INPUT DO USUÁRIO =====
read -p "👤 Seu nome de usuário (Github): " GIT_NAME
while [ -z "$GIT_NAME" ]; do
  read -p "❌ Nome não pode ser vazio. Digite novamente: " GIT_NAME
done

read -p "📧 Seu email (GitHub): " GIT_EMAIL
while [ -z "$GIT_EMAIL" ]; do
  read -p "❌ Email não pode ser vazio. Digite novamente: " GIT_EMAIL
done

clear

echo ""

SSH_KEY="$HOME/.ssh/id_ed25519"

echo "+--------------------------------------------------------------+"
echo "+                GIT SETUP AUTOMÁTICO INICIADO                 +"
echo "+                                                              +"
echo "+--------------------------------------------------------------+"
echo "+                  CONFIGURAÇÕES FEITAS PARA:                   "
echo "+                                                               "
echo "+      👤 Nome : $GIT_NAME                                      "
echo "+      📧 Email: $GIT_EMAIL                                     "
echo "+--------------------------------------------------------------+"
echo ""

# ===== GIT =====
if ! command -v git &>/dev/null; then
  echo "📦 INSTALANDO GIT, POR FAVOR AGUARDE..."
  echo ""
  sudo apt update && sudo apt install git -y
  echo ""
  echo ""
fi

git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global color.ui auto
git config --global core.editor nano

git config --global alias.s "status -sb"
git config --global alias.lol "log --oneline --graph --decorate --all"
git config --global alias.undo "reset --soft HEAD~1"

# ===== SSH =====
echo "🔐 CONFIGURANDO CHAVE SSH..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh

if [ ! -f "$SSH_KEY" ]; then
  ssh-keygen -t ed25519 -C "$GIT_EMAIL" -f "$SSH_KEY" -N ""
  echo "🔑 CHAVE SSH CRIADA!"
else
  echo "🔑 CHAVE SSH JÁ EXISTENTE. (REUTILIZANDO)"
fi

# ===== SSH AGENT =====
eval "$(ssh-agent -s)"
ssh-add "$SSH_KEY" >/dev/null 2>&1

# ===== AUTO SSH NO TERMINAL =====
if ! grep -q "id_ed25519" ~/.bashrc; then
  echo 'eval "$(ssh-agent -s)" >/dev/null
ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1' >> ~/.bashrc
fi

echo ""
echo ""
echo "+--------------------------------------------------------------+"
echo "+                ✅ GIT CONFIGURADO COM SUCESSO!               +"
echo "+--------------------------------------------------------------+"
echo ""
echo "      >  COPIE A CHAVE SSH ABAIXO E CADASTRE NO GITHUB  <       "
echo "               https://github.com/settings/keys"
echo ""
echo "🔑 Sua Chave SSH: (copie inteiramente) " & cat "$SSH_KEY.pub"
echo ""
