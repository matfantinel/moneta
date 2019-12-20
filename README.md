<p align="center">
    <img src="data/screenshots/Main.png" alt="Screenshot" />
</p>

# Moneta

Moneta is a handy applet that stays on your desktop and updates the exchange rate of currencies of your choice. It is a fork from the app [Coin](https://github.com/lainsce/coin/) from @lainsce, just adapted to handle real-world currencies instead of virtual ones.

Most of the code, design and icon is copied/based on his. So if you like this, consider sponsoring him on GitHub!

**Moneta is currently under development and is not yet suitable for daily use. If you want to help out, check out the Issues on this repo and open your Pull Request!**

## Built for elementary OS

While Moneta can run in any Linux distribution, it was built with [elementary OS] in mind. I appreciate any help packaging it for more distributions, though!

<!-- [![Get it on AppCenter](https://appcenter.elementary.io/badge.svg)][AppCenter] -->

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

[elementary OS]: https://elementary.io
[AppCenter]: https://appcenter.elementary.io/com.github.matfantinel.moneta
