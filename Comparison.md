# ❄️ Nix Development Environment Comparison

<div align="center">

> *A comprehensive comparison of Nix-based development environment tools*

</div>

---

## 📋 Requirements (R1–R8)

<table>
<tr>
<th style="background: #1e1e2e; color: #cdd6f4;">ID</th>
<th style="background: #1e1e2e; color: #cdd6f4;">Requirement</th>
</tr>
<tr>
<td><code style="color: #89b4fa;">R1</code></td>
<td><b>Cross-platform operability</b> — The software shall be compatible with the major OS platforms—Linux, macOS, and Windows.</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R2</code></td>
<td><b>Container-friendly usage</b> — The software shall be usable inside containers — both via official container images and by installation inside custom containers. <em>Rationale: Ensures research accessibility when a containerized environment is preferred or required.</em></td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R3</code></td>
<td><b>Versioned self-installation</b> — The tool must support the installation of a user-selected version of the tool itself, enabling reproducible deployments across heterogeneous environments.</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R4</code></td>
<td><b>Versioned package installation</b> — The framework shall allow explicit selection of package versions during installation, ensuring deterministic dependency resolution.</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R5</code></td>
<td><b>Transparent retrieval of package-version metadata</b> — The exact versions of all packages employed in a given project shall be readily obtainable, enabling rapid assessment of the project's dependency composition.</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R6</code></td>
<td><b>Support for global package management</b> — The tool shall be capable of managing dependencies at a system-wide scope, allowing users to install and resolve packages globally rather than only in project-specific environments.</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R7</code></td>
<td><b>Automatic containerization</b> — Based on the defined configuration, the tool should be able to automatically generate a container image—or, preferentially, a Dockerfile, and optionally a corresponding devcontainer specification.</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R8</code></td>
<td><b>Usability</b> — The design must accommodate users with limited familiarity with the Nix language, thereby lowering the entry barrier and smoothing the learning curve.</td>
</tr>
</table>

---

## ✅ Requirement Compliance Matrix

<table>
<tr>
<th style="background: #1e1e2e; color: #cdd6f4;">ID</th>
<th style="background: #1e1e2e; color: #f9e2af;">🐚 nix-shell</th>
<th style="background: #1e1e2e; color: #fab387;">🦊 flox</th>
<th style="background: #1e1e2e; color: #a6e3a1;">🌿 devenv</th>
<th style="background: #1e1e2e; color: #89b4fa;">📦 devbox</th>
<th style="background: #1e1e2e; color: #cba6f7;">❄️ Flakes</th>
</tr>
<tr>
<td><code style="color: #89b4fa;">R1</code> Cross-platform</td>
<td>✅</td>
<td>✅</td>
<td>✅</td>
<td>✅</td>
<td>✅</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R2</code> Container-friendly</td>
<td>✅</td>
<td>✅</td>
<td>✅</td>
<td>✅</td>
<td>✅</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R3</code> Versioned self-install</td>
<td>⚠️</td>
<td>✅</td>
<td>✅</td>
<td>✅</td>
<td>⚠️</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R4</code> Versioned packages</td>
<td>✅</td>
<td>✅</td>
<td>⚠️</td>
<td>✅</td>
<td>✅</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R5</code> Package metadata</td>
<td><span style="color: #f38ba8;">Low</span></td>
<td><span style="color: #f9e2af;">Medium</span></td>
<td><span style="color: #f9e2af;">Medium</span></td>
<td><span style="color: #a6e3a1;">High</span></td>
<td><span style="color: #f38ba8;">Low</span></td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R6</code> Global package mgmt</td>
<td><span style="color: #6c7086;">N/A</span></td>
<td>✅</td>
<td>❌</td>
<td>✅</td>
<td>❌</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R7</code> Auto containerization</td>
<td>❌</td>
<td>✅</td>
<td>✅</td>
<td>✅ <span style="color: #a6e3a1;"><b>(Best)</b></span></td>
<td>❌</td>
</tr>
<tr>
<td><code style="color: #89b4fa;">R8</code> Usability</td>
<td><span style="color: #f38ba8;">Low</span></td>
<td><span style="color: #a6e3a1;">High</span></td>
<td><span style="color: #f9e2af;">Medium</span></td>
<td><span style="color: #a6e3a1;"><b>Very High</b></span></td>
<td><span style="color: #f38ba8;">Low</span></td>
</tr>
</table>

<br>

> [NOTE]:
> **nix-shell:** The ability to install specific package versions is limited (requires pinning multiple nix channels) and package version information is not easy to retrieve. nix-shell does not provide automatic containerization and the concept of a global package manager does not apply to it.
>
> **devenv:** Installing specific package versions and retrieving package version information is limited to most popular programming languages, and automatic containerization is limited — it requires adding additional inputs.

When it comes to getting the info of packages you can use `devenv info`
The same for `flox list` and `devbox list`

---

## 🎯 Action Matrix

<table>
<tr>
<th style="background: #1e1e2e; color: #cdd6f4;">Action</th>
<th style="background: #1e1e2e; color: #f9e2af;">🐚 nix-shell</th>
<th style="background: #1e1e2e; color: #fab387;">🦊 flox</th>
<th style="background: #1e1e2e; color: #a6e3a1;">🌿 devenv</th>
<th style="background: #1e1e2e; color: #89b4fa;">📦 devbox</th>
<th style="background: #1e1e2e; color: #cba6f7;">❄️ Flakes</th>
</tr>
<tr>
<td><b>📋 List packages & versions</b></td>
<td><code style="color: #f9e2af;">nix repl</code><br><code style="color: #f9e2af;">:l shell.nix</code><br><code style="color: #f9e2af;">buildInputs</code></td>
<td><code style="color: #fab387;">flox list</code></td>
<td><code style="color: #a6e3a1;">devenv info</code></td>
<td><code style="color: #89b4fa;">devbox list</code></td>
<td><code style="color: #cba6f7;">nix repl</code><br><code style="color: #cba6f7;">:lf .</code><br><code style="color: #cba6f7;">devShells.&lt;system&gt;.default.buildInputs</code></td>
</tr>
<tr>
<td><b>➕ Add package</b></td>
<td>Add to <code style="color: #f9e2af;">shell.nix</code></td>
<td><code style="color: #fab387;">flox install &lt;pkg&gt;</code><br><em>or edit <code>flox.toml</code></em></td>
<td>Add to <code style="color: #a6e3a1;">devenv.yaml</code>/config</td>
<td><code style="color: #89b4fa;">devbox add &lt;pkg&gt;</code><br><em>or edit <code>devbox.json</code></em></td>
<td>Add to <code style="color: #cba6f7;">flake.nix</code><br><em>(e.g., <code>devShells</code> or <code>inputs</code>)</em></td>
</tr>
<tr>
<td><b>🚀 Enter shell</b></td>
<td><code style="color: #f9e2af;">nix-shell</code></td>
<td><code style="color: #fab387;">flox activate</code></td>
<td><code style="color: #a6e3a1;">devenv shell</code></td>
<td><code style="color: #89b4fa;">devbox shell</code></td>
<td><code style="color: #cba6f7;">nix develop</code></td>
</tr>
<tr>
<td><b>🐳 Container support</b></td>
<td>✅ <em>Install Nix or use official images</em></td>
<td>✅ <em>Official images / installable</em></td>
<td>✅ <em>Official images / installable</em></td>
<td>✅ <em>Official images available / installable</em></td>
<td><span style="color: #6c7086;">TBD</span></td>
</tr>
</table>

> [!NOTE]
> For Flakes, replace `<system>` with your platform identifier, e.g., `x86_64-linux`, `aarch64-linux`, `x86_64-darwin`, or `aarch64-darwin`.

---

## 🔧 nix-shell Additional Tools

Enhance your `nix-shell` experience with these community tools:

| Tool | Description |
|------|-------------|
| [**Lorri**](https://github.com/nix-community/lorri) | Daemon for faster `nix-shell` rebuilds |
| [**cached-nix-shell**](https://github.com/xzfc/cached-nix-shell) | Caching layer for instant shell startup |


> These tools do not change the functionalities of `nix-shell` — they only offer enhancements in terms of performance.

---

<div align="center">
<sub>🌙 Styled with <b>Catppuccin Mocha</b> theme</sub>
</div>
