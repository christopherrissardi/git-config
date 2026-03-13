## 🇺🇸 English Version

# 🚀 Auto Git & SSH Setup Script

A fast, interactive, and automated bash script to configure Git and generate SSH keys for GitHub on Debian/Ubuntu-based systems.

This script eliminates the manual setup process for new environments, ensuring your Git identity is configured, useful aliases are set, and your SSH key is ready for secure communication with GitHub.

## ✨ Features
* **Interactive Prompt:** Asks for your GitHub Username and Email with validation.
* **Auto-Installation:** Checks if Git is installed and installs it automatically via `apt` if missing.
* **Global Configuration:** Sets your Git name, email, UI colors, and sets `nano` as the default editor.
* **Smart Aliases:** Pre-configures productivity-boosting Git aliases.
* **SSH Key Generation:** Automatically generates a secure `ed25519` SSH key (if one doesn't already exist).
* **Agent Persistence:** Starts the `ssh-agent` and adds it to your `~/.bashrc` so you don't have to type your passphrase every time you open a new terminal.

## 🛠️ Prerequisites
* A Debian/Ubuntu-based Linux distribution (uses `apt` package manager).
* `sudo` privileges (only required if Git needs to be installed).

## 🚀 How to Use

### 1. Download the script
Save the script to your machine as `git_setup.sh`.

### 2. Grant execution permissions
Make the script executable by running the following command in your terminal:
```bash
chmod +x git_setup.sh

```

### 3. Run the script

Execute the script and follow the on-screen prompts:

```bash
./git_setup.sh

```

### 4. Add the SSH key to GitHub

Once the script finishes, it will print your new public SSH key to the terminal.
Copy the entire key and paste it into your [GitHub SSH Settings](https://github.com/settings/keys).

## 💡 Configured Git Aliases

This script sets up the following handy shortcuts to speed up your workflow:

* `git s` - Displays a short, concise status (`git status -sb`).
* `git lol` - Displays a clean, colorful, and graphical log history (`git log --oneline --graph --decorate --all`).
* `git undo` - Undos the last commit while keeping the changes in your staging area (`git reset --soft HEAD~1`).

---

## 🇧🇷 Versão em Português

# 🚀 Script de Configuração Automática do Git & SSH

Um script bash rápido, interativo e automatizado para configurar o Git e gerar chaves SSH para o GitHub em sistemas baseados em Debian/Ubuntu.

Este script elimina o processo manual de configuração em novos ambientes, garantindo que sua identidade do Git seja configurada, aliases úteis sejam criados e sua chave SSH fique pronta para comunicação segura com o GitHub.

## ✨ Funcionalidades
* **Prompt Interativo:** Solicita seu Nome de Usuário e Email do GitHub com validação.
* **Instalação Automática:** Verifica se o Git está instalado e faz a instalação via `apt` caso necessário.
* **Configuração Global:** Define seu nome, email, cores da interface e o `nano` como editor padrão do Git.
* **Aliases Inteligentes:** Pré-configura atalhos de produtividade para o Git.
* **Geração de Chave SSH:** Gera automaticamente uma chave SSH `ed25519` super segura (se ainda não existir uma).
* **Persistência do Agent:** Inicia o `ssh-agent` e o adiciona ao seu `~/.bashrc` para que a chave seja carregada automaticamente em novos terminais.

## 🛠️ Pré-requisitos
* Uma distribuição Linux baseada em Debian/Ubuntu (utiliza o gerenciador de pacotes `apt`).
* Privilégios de `sudo` (necessário apenas se o Git precisar ser instalado).

## 🚀 Como Usar

### 1. Baixe o script
Salve o script na sua máquina com o nome `git_setup.sh`.

### 2. Dê permissão de execução
Torne o script executável rodando o comando abaixo no terminal:
```bash
chmod +x git_setup.sh

```

### 3. Execute o script

Rode o script e siga as instruções na tela:

```bash
./git_setup.sh

```

### 4. Adicione a chave SSH no GitHub

Quando o script terminar, ele vai imprimir a sua nova chave SSH pública no terminal.
Copie a chave inteira e cole nas suas [Configurações de SSH do GitHub](https://github.com/settings/keys).

## 💡 Aliases do Git Configurados

Este script configura os seguintes atalhos práticos para acelerar seu fluxo de trabalho:

* `git s` - Exibe um status curto e direto ao ponto (`git status -sb`).
* `git lol` - Exibe o histórico de commits em formato de gráfico colorido e limpo (`git log --oneline --graph --decorate --all`).
* `git undo` - Desfaz o último commit, mas mantém as alterações nos seus arquivos (`git reset --soft HEAD~1`).
