# Basic Docker security

## DockerShield and Linux Hardening: Making Docker Safer by Design

### Introduction

Modern infrastructure relies heavily on containers, and Docker has become the default platform for deploying services quickly and consistently. However, convenience often comes with trade-offs. Default Docker configurations are not always secure, and when combined with a minimally hardened Linux host, they can unintentionally expose critical services to the internet.

### The Hardening Concept

**Hardening** can be understood as an *enforcer strategy*: increasing the complexity required for third parties to gain unauthorized access to a system.

The goal is not to make systems impossible to attack, but to:

- Reduce the attack surface
  
- Remove unsafe defaults
  
- Force attackers to face multiple defensive layers

This is especially important because **default configurations are designed for usability, not security**. Docker is no exception.

### The Docker Security Issue

#### Docker and Firewall Bypass

One of the most common surprises for system administrators is that **Docker can bypass UFW (and similar firewall rules)**. When Docker publishes a port, it uses `iptables` rules that may allow inbound traffic even when the firewall appears locked down.

#### Exposed Ports in Practice

This often leads to situations such as:

- PostgreSQL exposed on port `5432`

- Redis, MongoDB, or admin panels reachable from the public internet

- Services exposed despite explicit firewall deny rules

#### Why This Matters

These exposures are rarely intentional. They happen because:

- Port bindings default to `0.0.0.0`

- Firewall assumptions do not hold in containerized environments

- Protection must be **container-aware**, not just host-aware

**DockerShield** exists to make these problems visible.

### DockerShield

#### What is Dockershield?

DockerShield, a **security auditing tool for Docker and Linux environments**, designed to be simple, fast, and practical.

**DockerShield** is a lightweight, focused security tool designed to help administrators **see what Docker is really exposing**, understand the risks, and apply practical hardening measures. This text explains DockerShield through the lens of Linux hardening and container security, following a structured and iterative approach.

DockerShield fills an important niche: it makes Docker’s hidden exposure risks visible and understandable. Combined with Linux hardening practices, it helps administrators move from **assumed security** to **verified security**.

Rather than replacing firewalls or intrusion detection systems, DockerShield complements them by focusing on a critical reality:

> A secure Docker host requires container-aware security.

For anyone running Docker on a VPS, home server, or production environment, DockerShield is a practical first step toward safer container deployments.

References:  
Official DockerShield repository.  
<https://github.com/adrian13508/dockershield>

#### Key Characteristics

- **Language:** Go

- **Binary size:** ~8 MB

- **Dependencies:** Docker only

- **Platform:** Linux

- **Focus:** Scan and audit Docker exposures and host security posture

Its minimal footprint makes it suitable for:

- VPS environments

- Self-hosted servers

- CI or periodic security checks

### Core Capabilities

DockerShield focuses on *observation and guidance*, not automatic enforcement.

#### Scanning and Auditing

It analyzes:

- Published container ports

- Publicly accessible services

- Risk levels associated with exposures

- Linux host security settings related to Docker

The result is a clear overview of **what is exposed, why it matters, and what to fix first**.

### Installation

DockerShield is intentionally easy to install, typically via a `curl`-based installation script. This lowers the barrier to adoption and encourages frequent use, even on temporary servers.

```shell
curl -sSL https://raw.githubusercontent.com/adrian13508/dockershield/main/install.sh | bash
```

### Core Commands

DockerShield provides a small but effective command set.

Together, these commands support both quick checks and deep inspections.

#### dockershield status

Gives an overall security score and high-level summary of your system’s posture.

```shell
sudo dockershield status
```

#### dockershield doctor

Performs a server health check and provides **actionable improvement tips**, especially for common misconfigurations.

```shell
sudo dockershield doctor
```

#### dockershield scan

Runs a detailed analysis of Docker exposures and Linux hardening issues.

You need to have at least a container for the scanning process to begin. With a running container, you get much more information.

```shell
sudo dockershield scan
```

You can get the next error when executing this command:

```output
Connecting to Docker... ✗
Error: failed to connect to Docker: failed to connect to Docker daemon (is Docker running?): Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
failed to connect to Docker: failed to connect to Docker daemon (is Docker running?): Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```

In that case, you are probably using a Docker context, such as `desktop-linux` which is used by **Docker Desktop**.

```shell
docker context ls  # or run with `sudo`
```

```output
NAME              DESCRIPTION                               DOCKER ENDPOINT                                    ERROR
default           Current DOCKER_HOST based configuration   unix:///var/run/docker.sock                        
desktop-linux *   Docker Desktop                            unix:///home/esteban/.docker/desktop/docker.sock   
rootless          Rootless mode                             unix:///run/user/1000/docker.sock  
```

**Docker Desktop** does not use the system `docker.service`.

That’s why `systemctl` shows Docker as `inactive`/`disabled`, even though Docker actually works.

```shell
systemctl status docker.service
```

```bash
systemctl status docker.service
○ docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; preset: enabled)
     Active: inactive (dead)
TriggeredBy: ○ docker.socket
       Docs: https://docs.docker.com
```

Remember that on Linux there are two different Docker setups:

- Docker Engine (system service)

- Docker Desktop (does NOT rely on docker.service)

DockerShield expects `unix:///var/run/docker.sock`, but Docker Desktop uses a user-level socket, usually `unix://$HOME/.docker/desktop/docker.sock`. As a result, DockerShield cannot find Docker via systemd.

**How to fix DockerShield with Docker Desktop**

Option 1 (recommended): set DOCKER_HOST

To do not change your configuration with **Docker Desktop** you can make **DockerShield** work like this:

```shell
export DOCKER_HOST=unix://$HOME/.docker/desktop/docker.sock
```

Test:

```shell
docker ps  # or run with `sudo`
```

And then run DockerShield (no `sudo` required; runs in user space):

```shell
dockershield scan
```

If it works, you can persist it:

```shell
echo 'export DOCKER_HOST=unix://$HOME/.docker/desktop/docker.sock' >> ~/.bashrc
```

Option 2: use Docker Engine instead of Desktop

If DockerShield requires system Docker:

```shell
sudo systemctl enable --now docker
```

And stop Docker Desktop to avoid conflicts.

### Other commands

#### Check specific category

```shell
sudo dockershield check ports
sudo dockershield check networks
```

** Valid options: ports, networks, firewall, containers, all.

#### Verbose output with network info

```shell
sudo dockershield scan --verbose
```

#### JSON output for automation

```shell
sudo dockershield scan --json --output report.json
```

#### Upgrade to latest version

```shell
sudo dockershield upgrade
```

#### Display all the commands and options

```shell
dockershield --help
```

### Hardening Actions Beyond DockerShield

DockerShield highlights problems, but **hardening is a broader process**.

#### Recommended Security Tools

- **Fail2Ban** – Log monitoring and automatic IP blocking

- **RKHunter** – Rootkit detection

- **CHKRootkit** – Additional rootkit scanning

- **AIDE** – File integrity monitoring

These tools protect the host, while DockerShield focuses on container-related exposure.

### System Configuration Hardening

Beyond tools, configuration matters.

Key actions include:

- Enabling **automatic security updates**

- Reviewing and tightening **AppArmor profiles**

- Hardening network parameters via `/etc/sysctl.conf` or `/etc/sysctl.d/` 

```shell
sysctl -h
```

- Enabling **anti-spoofing protections**

- Disabling **ICMP redirects**

These measures reduce the risk that a single exposed container leads to full system compromise.

### An Iterative Implementation Process

Hardening is not a one-time task. DockerShield supports an **iterative security workflow**:

1. Scan the system

2. Identify vulnerabilities

3. Apply temporary fixes via command line

4. Persist fixes in configuration files

5. Rescan and reassess

This loop ensures improvements are measurable and sustainable.

## References

Security Module from the book: DIY Linux.  
<https://github.com/estebantechdev/diy-linux-book/tree/main/Module7>

Linux Enterprise Sci-Fi book and video course.  
<https://github.com/estebantechdev/Linux-Enterprise-Sci-Fi-book>

Docker installation, from the book: DIY Linux.  
<https://github.com/estebantechdev/diy-linux-book/tree/main/Module5/Docker>
