## About

Web, ads, trackers, irrelevant and unsolicited food blogger's life stories? I
just wanna grill for God's sake.

This is a `man-pages` inspired recipe system. You can install and search through
recipes and open them with the `man` viewer interface.

![cook](https://user-images.githubusercontent.com/28098392/111773254-0ca4d100-8902-11eb-85a0-0855662690df.gif)

## How-to

Recipes are simple `roff` files that can be generated from markdown files. This
repo offers a Makefile to build and install the `roff` files from markdown as
well as a simple script, `cook`, to list, search and open recipes.

### Write recipes

To create new recipes, first edit the `config` file to your convenience.
Especially, if you don't want to have to log in as root every time you add new
recipes, set `COOKPATH` to a folder you have the rights to.

You can then add your recipes in the `src` directory, following the
`src/example.md` file.

Then, simply type

```
make install
```

### Read recipes

If you have already run `make install`, `cook` should be in your PATH.

First, you will need to set the `COOKPATH` variable, if you have installed
recipes in a different place than the default (`/usr/share/cooking`).

- `cook`: list all recipes.
- `cook recipe-name`: opens `recipe-name` in the `man` interface.
- `cook -s query`: list all recipes that contain the word `query`. Case
  insensitive.

### Install recipes from other sources

For now, only my fork of Luke Smith's `based.cooking` offers the possibility to
install recipes in this format, but that's already more than a hundred based
recipes. To install all `based.cooking` recipes:

```bash
git clone https://github.com/sylGauthier/based.cooking.git
cd based.cooking
# edit config to your convenience
make install
```
