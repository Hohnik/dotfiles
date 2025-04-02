# My Dotfiles

Configuration files managed using [GNU Stow](https://www.gnu.org/software/stow/).
Install `oh-my-zsh` and 

## Installation

1.  **Prerequisites:** Ensure you have `git` and `stow` installed.
    *   *macOS (Homebrew):* `brew install stow`
    *   *Debian/Ubuntu:* `sudo apt update && sudo apt install stow`
    *   *Arch Linux:* `sudo pacman -S stow`
    *   *(Other systems: Check your package manager)*

2.  **Clone the repository:**
    ```bash
    git clone <your-repo-url> ~/.dotfiles
    ```
    *(Replace `<your-repo-url>` with your actual repository URL. Using `~/.dotfiles` is conventional.)*

3.  **Navigate into the directory:**
    ```bash
    cd ~/.dotfiles
    ```

4.  **Stow the desired configurations:**
    *   To install all configurations:
        ```bash
        # List directories (packages) here first to see what's available
        ls -d */

        # Stow all packages (use directory names)
        stow */
        # Or specify packages:
        # stow nvim zsh git
        ```
    *   Stow will create symbolic links in your home directory (`~`) pointing to the files within this repository.

## Usage (Stow Cheatsheet)

Run these commands from *within* the `~/.dotfiles` directory:

*   **`stow <package_name>`**: Create links for a package (e.g., `stow nvim`).
*   **`stow -D <package_name>`**: Delete links for a package (e.g., `stow -D nvim`).
*   **`stow -R <package_name>`**: Restow - delete existing links and create new ones (useful after changing file structure within a package) (e.g., `stow -R nvim`).
*   **`stow -n <package_name>`**: Dry run - show what would be done without actually doing it (e.g., `stow -n nvim`).
*   **`stow */`**: Stow all packages (directories) in the current directory.

*(Remember: `<package_name>` corresponds to the directory names within `~/.dotfiles`, like `nvim`, `zsh`, `git`, etc.)*

