# Dotfiles

Конфигурация окружения, управляемая с помощью [GNU Stow](https://www.gnu.org/software/stow/).
Основной Wayland-сеанс можно запускать на Niri или Umbriel; панель, launcher,
экран блокировки и управление системными функциями предоставляет Noctalia Shell.

## Установка

Понадобятся `git`, `make` и `stow`. Для полного окружения также должны быть
установлены используемые программы: Niri или Umbriel, Noctalia Shell, Foot,
Alacritty, Helix, Neovim, tmux, Yazi, btop и Hyprwhspr.

Клонируйте репозиторий, соберите конфигурацию Helix и создайте ссылки в
домашнем каталоге:

```sh
git clone https://github.com/Nemagu/dotfiles.git "$HOME/.dotfiles"
cd "$HOME/.dotfiles"
make -C .config/helix
stow --target="$HOME" .
```

Файлы `README.md`, `.gitignore`, `.stow-local-ignore`, локальные артефакты и каталоги внешних репозиториев не добавляются в `$HOME`. Это задаёт `.stow-local-ignore`.

## Helix

Конфигурация Helix разделена на небольшие TOML-файлы в каталогах
`~/.config/helix/config/` и `~/.config/helix/languages/`. После их изменения
пересоберите итоговые `config.toml` и `languages.toml`:

```sh
make -C "$HOME/.config/helix"
```

Итоговые файлы генерируются локально и не отслеживаются Git.

## Wayland-сеанс

Конфигурация Niri разбита на файлы в `~/.config/niri/`; точкой входа служит
`config.kdl`. Noctalia запускается автоматически и обрабатывает launcher,
блокировку экрана, мультимедийные клавиши, яркость и снимки экрана.

Альтернативная конфигурация Umbriel находится в `~/.config/umbriel/` и
собирается через секцию `include` в `config.toml`. Перед запуском её можно
проверить без старта compositor-а:

```sh
umbriel validate -c "$HOME/.config/umbriel/config.toml"
```

Конфигурации содержат параметры конкретного компьютера: выход `eDP-1` и
устройство `TPPS/2 Elan TrackPoint`. На другом оборудовании скорректируйте
`outputs.toml` и `input.toml`.

## Noctalia и темы

Палитра Noctalia используется в Foot, Alacritty, Helix, Neovim, tmux, Yazi,
btop, Niri и Umbriel. Сгенерированные или синхронизируемые темы имеют имя
`noctalia`; часть готовых файлов хранится в репозитории, а каталоги внешних тем
Alacritty и Yazi остаются локальными и игнорируются Git.

Neovim загружает палитру через `base16-nvim`. После обновления темы модуль
`matugen.lua` может перечитать цвета по сигналу `SIGUSR1` без перезапуска
редактора.

Для Alacritty установите внешний набор тем; его каталог намеренно не
отслеживается:

```sh
git clone https://github.com/alacritty/alacritty-theme \
  "$HOME/.config/alacritty/themes"
```

## Плагины

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

Установите TPM, затем перечисленные в `tmux.conf` плагины:

```sh
git clone https://github.com/tmux-plugins/tpm \
  "$HOME/.config/tmux/plugins/tpm"
"$HOME/.config/tmux/plugins/tpm/bin/install_plugins"
```

Установите зафиксированные зависимости Yazi из `package.toml`:

```sh
ya pkg install
```

После установки перезапустите терминал и tmux.

## Голосовой ввод

Hyprwhspr настроен в `~/.config/hyprwhspr/config.json`: используется малая
модель, Vulkan backend и копирование результата в буфер обмена. В Niri и
Umbriel запись переключается сочетанием `Mod+Ctrl+R`, отмена —
`Mod+Ctrl+C`.

## Проверка конфигурации

Доступные локальные проверки перед применением изменений:

```sh
make -C "$HOME/.config/helix"
niri validate -c "$HOME/.config/niri/config.kdl"
umbriel validate -c "$HOME/.config/umbriel/config.toml"
foot -C -c "$HOME/.config/foot/foot.ini"
```

## Обновление ссылок

После изменения состава файлов повторно примените пакет:

```sh
cd "$HOME/.dotfiles"
stow --restow --target="$HOME" .
```
