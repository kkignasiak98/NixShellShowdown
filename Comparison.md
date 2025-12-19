
---

## Requirements (R1–R8) ✅

| ID | Requirement |
| --- | --- |
| **R1 (Cross-platform operability)** | The software shall be compatible with the major OS platforms—Linux, macOS, and Windows. |
| **R2 (Container-friendly usage)** | The software shall be usable inside containers — both via official container images and by installation inside custom containers. **Rationale:** Ensures research accessibility when a containerized environment is preferred or required. |
| **R3 (Versioned self-installation)** | The tool must support the installation of a user-selected version of the tool itself, enabling reproducible deployments across heterogeneous environments. |
| **R4 (Versioned package installation)** | The framework shall allow explicit selection of package versions during installation, ensuring deterministic dependency resolution. |
| **R5 (Transparent retrieval of package-version metadata)** | The exact versions of all packages employed in a given project shall be readily obtainable, enabling rapid assessment of the project’s dependency composition. |
| **R6 (Support for global package management)** | The tool shall be capable of managing dependencies at a system-wide scope, allowing users to install and resolve packages globally rather than only in project-specific environments. |
| **R7 (Automatic containerization)** | Based on the defined configuration, the tool should be able to automatically generate a container image—or, preferentially, a Dockerfile, and optionally a corresponding devcontainer specification. |
| **R8 (Usability)** | The design must accommodate users with limited familiarity with the Nix language, thereby lowering the entry barrier and smoothing the learning curve. |


## Requirement compliance matrix

| ID | nix-shell | flox | devenv | devbox |
| --- | --- | --- | --- | --- |
| **R1 (Cross-platform operability)** | ✅ | ✅ | ✅ | ✅ |
| **R2 (Container-friendly usage)** | ✅ | ✅ | ✅ | ✅ |
| **R3 (Versioned self-installation)** | ⚠️ | ✅ | ✅ | ✅ |
| **R4 (Versioned package installation)** | ✅ | ✅ | ⚠️ | ✅ |
| **R5 (Transparent retrieval of package-version metadata)** | Low | Medium | Medium | High |
| **R6 (Support for global package management)** | `Not applicable` | ✅ | ❌ | ✅ |
| **R7 (Automatic containerization)** | ❌ | ✅ | ✅ | ✅ (Best) |
| **R8 (Usability)** | Low | High | Medium | Very high |




> **Note:** For `nix-shell` the ability to install specific package versions is limited (requires pinning multiple nix channels) and package version information is not easy to retrieve. `nix-shell` does not provide automatic containerization and the concept of a global package manager does not apply to it. For `devenv` installing specific package versions and retrieving package version information is limited to most popular programming languages, and automatic containerization is limited — it requires adding additional inputs; 

When it comes to getting the info of packages you can use `devenv info`
The same for `flox list` and `devbox list`

## Action matrix

| Action | `nix-shell` | `flox` | `devenv` | `devbox` |
| --- | --- | --- | --- | --- |
| **list all packages and their versions** | TBD | `flox list` | `devenv info` | `devbox list` |
| **adding package** | Add the package to `shell.nix` | Use `flox install` <pkg> (or edit `flox.toml`) | Add the package to `devenv.yaml`/config. | Use `devbox add <pkg>` (or edit `devbox.json`) |
| **enter shell** | Run `nix-shell` | Use `flox activate` | Run `devenv shell` | Run `devbox shell` |
| **usable inside containers** | ✅ (usable inside containers; install Nix or use official images) | ✅ (official images / installable) | ✅ (official images / installable) | ✅ (official images available / installable) |


## nix-shell additional tools
- [Lorri](https://github.com/nix-community/lorri)
- [cached nix-shell](https://github.com/xzfc/cached-nix-shell)

The do not change the functionalities of `nix-shell` only offer some enhacement in terms of performance.