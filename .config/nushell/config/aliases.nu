# ls aliases
alias ll = ls -l
alias la = ls -a
alias lla = ls -l -a

# programs
alias lg = lazygit

# ollama

def create-ollama [] {
    podman run --pull newer --detach --security-opt label=type:container_runtime_t --replace --device /dev/kfd --device /dev/dri -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama:rocm;
    podman run --replace --pull newer -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main
}

def start-ollama [] {
    podman start ollama;
    podman start open-webui
}

def stop-ollama [] {
    podman stop ollama;
    podman stop open-webui
}

def update-ollama [] {
    podman stop ollama;
    podman stop open-webui;
    podman pull ollama/ollama:rocm;
    podman pull ghcr.io/open-webui/open-webui:main;
    podman start ollama;
    podman start open-webui
}

# create a python venv
def venv [] {
    bash -c "virtualenv .venv"
    echo '{"venvPath": ".", "venv": ".venv"}' | from json | to json | save pyrightconfig.json
}

# decomment a config file
alias decomment = grep -v -E "^[[:space:]]*((#|;|//).*)?$"

# check justfile
alias check-just = just --unstable --fmt --check -f
