# Moneta
<p align="center">
    <a href="https://appcenter.elementary.io/com.github.matfantinel.moneta" target="_blank">
        <img src="https://appcenter.elementary.io/badge.svg">
    </a>
    <a href='https://flathub.org/apps/details/com.github.matfantinel.moneta' target="_blank"><img width='150' alt='Download on Flathub' src='https://flathub.org/assets/badges/flathub-badge-en.png'/></a>
</p>

<p align="center">
  <a href="https://github.com/matfantinel/moneta/blob/master/COPYING">
    <img src="https://img.shields.io/badge/License-GPL%20v3-blue.svg">
  </a>
  <a href="https://travis-ci.com/matfantinel/moneta">
    <img src="https://travis-ci.org/matfantinel/moneta.svg?branch=master">
  </a>
</p>

<p align="center">
    <img src="data/screenshots/Main.png" alt="Screenshot" />
</p>

Moneta is a handy applet that stays on your desktop and updates the exchange rate of currencies of your choice. It is a fork from the app [Coin](https://github.com/lainsce/coin/) by @lainsce, just adapted to handle real-world currencies instead of virtual ones.

Most of the code, design and icon is copied/based on his. So if you like this, consider sponsoring him on GitHub!

## Built for elementary OS

While Moneta can run in any Linux distribution, it was built with [elementary OS] in mind. It runs perfectly on other distributions like Ubuntu, Fedora, etc. though. Download it on Flathub if you want to use Moneta everywhere!

## Translating

You can help translating this app with the following steps:

* Add the language you want to translate to in the `po/LINGUAS` file (if it's already there, you can skip this step);
* Then, make sure the translation files are updated:
```shell
cd build
ninja com.github.matfantinel.moneta-pot
ninja com.github.matfantinel.moneta-update-po
```
* Then, update your language file in `po` folder with your translations. For example, portuguese (pt) translation file is `po/pt.po`;
* Some additional translation files can be found in `po/extra/` (stuff for the xml and .desktop files)
* You might want to update these files as well:
  
  ```shell
  # we're still in ./build
  ninja extra-pot
  ninja extra-update-po
  ```
* Fork this repo, commit to your repo and then open a Pull Request to this one.

## Developing and building

If you want to go ahead and compile Moneta yourself, you'll need the following dependencies:

* libgranite-dev
* libgtk-3-dev
* meson
* valac
* libsoup2.4-dev
* libjson-glib-dev

You can install them on elementary OS Juno with:

```shell
sudo apt install elementary-sdk
```

And on other Ubuntu-based distributions with:

```shell
sudo apt install libgranite-dev libgtk-3-dev meson valac libsoup2.4-dev libjson-glib-dev
```

Run `meson build` to configure the build environment and run `ninja install`
to install:

```shell
meson build --prefix=/usr
cd build
sudo ninja install
```

Then run it with:

```shell
com.github.matfantinel.moneta
```

## Flatpak

Moneta is also available as a Flatpak. To build/install it locally, first you have to install the necessary runtimes:

```shell
sudo apt install flatpak-builder
flatpak install flathub org.freedesktop.Sdk/x86_64/19.08
flatpak install flathub org.freedesktop.Platform/x86_64/19.08
flatpak install flathub io.elementary.BaseApp/x86_64/juno-19.08
```

Then, from the project root:

```shell
flatpak-builder --install repo com.github.matfantinel.moneta.json --force-clean --user
```

The app should be displayed on your apps list, or you can run it with:
```shell
com.github.matfantinel.moneta
```

[elementary OS]: https://elementary.io
