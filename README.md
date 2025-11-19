# Arduino CLI DevContainer

A pre-configured **VS Code DevContainer** environment optimized for developing Arduino projects using VSCode with Arduino extension (**Arduino Community Edition**) and **Arduino CLI**.  

This setup provides:

- Persistent Arduino configuration and caches
- Automatic Arduino CLI initialization inside the container
- Clean separation between the DevContainer environment and your Arduino project directories
- Zero impact on your host system — everything stays inside Docker

## Features

### Fully containerized Arduino CLI environment

- Arduino CLI installed via the official installation script
- `~/bin` added to PATH for `arduino-cli` command through Dockerfile
- Configuration initialized automatically with `init_arduino-cli.sh`

### Persistent data

The directory `/home/vscode/.arduino15` is stored in a Docker volume named `arduino15-data`.
The build cache is also stored inside this volume at `/home/vscode/.arduino15/BUILD_CACHE`.

## Usage

### 1. Clone this repository

```sh
git clone https://github.com/tomka2n/arduino-cli-devcontainer
cd arduino-cli-devcontainer
```

### 2. Open in VS Code

Execute `Dev Containers: Reopen in Container` with Command Pallete

### 3. Create Arduino project directories (on your host machine)

Please manage your Arduino projects in separate Git repositories.

Directory structure example:

```text
arduino-cli-devcontainer/
  .devcontainer/
    devcontainer.json
    Dockerfile
    scripts/
      init_arduino-cli.sh
  sample-prj/        # Ignored by Git for devcontainer
  my-led-test/       # Ignored by Git for devcontainer
```

## License

MIT License
