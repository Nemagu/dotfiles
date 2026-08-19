# Dotfiles

Конфигурация окружения, управляемая с помощью [GNU Stow](https://www.gnu.org/software/stow/).

## Установка

Понадобятся `git` и `stow`. Клонируйте репозиторий и создайте ссылки в домашнем каталоге:

```sh
git clone https://github.com/Nemagu/dotfiles.git "$HOME/.dotfiles"
cd "$HOME/.dotfiles"
stow --target="$HOME" .
```

Файлы `README.md`, `.gitignore`, `.stow-local-ignore`, локальные артефакты и каталоги внешних репозиториев не добавляются в `$HOME`. Это задаёт `.stow-local-ignore`.

## Темы и плагины

После применения Stow установите тему Alacritty:

```sh
git clone https://github.com/alacritty/alacritty-theme \
  "$HOME/.config/alacritty/themes"
```

Установите Oh My Zsh и плагины, используемые в `.zshrc`:

```sh
git clone https://github.com/ohmyzsh/ohmyzsh.git \
  "$HOME/.config/zsh/oh-my-zsh"

git clone https://github.com/Aloxaf/fzf-tab \
  "$HOME/.config/zsh/oh-my-zsh/custom/plugins/fzf-tab"
git clone https://github.com/zsh-users/zsh-autosuggestions \
  "$HOME/.config/zsh/oh-my-zsh/custom/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  "$HOME/.config/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-history-substring-search \
  "$HOME/.config/zsh/oh-my-zsh/custom/plugins/zsh-history-substring-search"
```

Установите TPM, затем перечисленные в `tmux.conf` плагины и тему Catppuccin:

```sh
git clone https://github.com/tmux-plugins/tpm \
  "$HOME/.config/tmux/plugins/tpm"
"$HOME/.config/tmux/plugins/tpm/bin/install_plugins"
```

Установите тему Yazi из зафиксированного `package.toml`:

```sh
ya pkg install
```

### Варианты Catppuccin

Catppuccin доступен в четырёх вариантах:

| Вариант | Значение в конфигурации |
| --- | --- |
| Latte | `latte` |
| Frappé | `frappe` |
| Macchiato | `macchiato` |
| Mocha | `mocha` |

По умолчанию используется Frappé.

Основной терминал в этой конфигурации — Foot. Он использует темы, поставляемые вместе с Foot. Для переключения измените строку `include` в `~/.config/foot/foot.ini`:

```ini
include=/usr/share/foot/themes/catppuccin-frappe
```

Доступны `catppuccin-latte`, `catppuccin-frappe`, `catppuccin-macchiato` и `catppuccin-mocha`.

Если используется Alacritty, измените имя импортируемого файла в `~/.config/alacritty/alacritty.toml`:

```toml
[general]
import = ["~/.config/alacritty/themes/themes/catppuccin_frappe.toml"]
```

Доступны файлы `catppuccin_latte.toml`, `catppuccin_frappe.toml`, `catppuccin_macchiato.toml` и `catppuccin_mocha.toml`.

Для tmux измените значение `@catppuccin_flavor` в `~/.config/tmux/tmux.conf` и перезагрузите конфигурацию сочетанием `prefix + r`:

```tmux
set -g @catppuccin_flavor 'frappe'
```

Для Yazi укажите нужный пакет и то же значение в `~/.config/yazi/theme.toml`. Идентификаторы всех вариантов:

```text
yazi-rs/flavors:catppuccin-latte
yazi-rs/flavors:catppuccin-frappe
yazi-rs/flavors:catppuccin-macchiato
yazi-rs/flavors:catppuccin-mocha
```

Например, переключение с Frappé на Macchiato:

```sh
ya pkg delete --discard yazi-rs/flavors:catppuccin-frappe
ya pkg add yazi-rs/flavors:catppuccin-macchiato
```

```toml
[flavor]
dark = "catppuccin-macchiato"
```

Для Waybar измените импорт в `~/.config/waybar/style.css`. В репозитории есть `latte.css`, `frappe.css`, `macchiato.css` и `mocha.css`:

```css
@import url("themes/frappe.css");
```

Для Swaylock переключите ссылку `~/.config/swaylock/config` на один из файлов `catppuccin_latte`, `catppuccin_frappe`, `catppuccin_macchiato` или `catppuccin_mocha` в каталоге `themes`.

После установки перезапустите терминал и tmux.

## Обновление ссылок

После изменения состава файлов повторно примените пакет:

```sh
cd "$HOME/.dotfiles"
stow --restow --target="$HOME" .
```
