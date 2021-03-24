## About

Web, ads, trackers, irrelevant and unsolicited food blogger's life stories? I
just wanna grill for God's sake.

This is a `man-pages` inspired recipe system. You can install and search through
recipes and open them with the `man` viewer interface.

![cook](https://user-images.githubusercontent.com/28098392/111773254-0ca4d100-8902-11eb-85a0-0855662690df.gif)

## How-to

Recipes are simple `roff` files that can be generated from markdown files. This
repository offers a simple script, `cook`, that can open, search through and
install recipes.

`cook` reads from and install to the directory pointed by `$COOKPATH` (defaults
to `$HOME/.local/share/cooking`).

### Install cook

Just put it in your `$PATH`, e.g:

```
git clone https://github.com/sylGauthier/cook.git
cd cook
sudo cp cook /usr/bin
sudo chmod +x /usr/bin/cook
```

### Write recipes

`cook` offers a convenient way to interactively create a new recipe. To write a
new recipe using the interactive system, type:

```
cook -n
```

You will be asked to enter the different components of the recipe. `cook` will
automatically perform sanity checks on each field and ensure that your recipe
conforms to some standard.

The recipe will be exported into a markdown file that you can edit before
converting/installing.

### Install recipes

Simply write your recipe as a markdown file. You can take inspiration from
the `example.md`, or use the interactive system above. Once you are done,
you can install it by typing:

```
cook -i <name-of-your-recipe>
```

`cook` will automatically convert it to a `man` page and install it to the
directory pointed to by `$COOKPATH`.

You can of course install multiple recipes at once by specifying multiple files
to `cook -i`. `cook` can also install `*.1` files, that is, files that are
already written in the `groff` language using the `man` macro package.

### Read recipes

Once you have some recipes installed, `cook` can list them, grep for words in
them and display them using `man`:

- `cook`: list all recipes.
- `cook recipe-name`: opens `recipe-name` in the `man` interface.
- `cook -s query`: list all recipes that contain the word `query`. Case
  insensitive.

### Install recipe packages

You can clone [this recipe repository](https://github.com/sylGauthier/recipes),
whose recipes are an improved version of the ones available at Luke Smith's
[based.cooking](https://based.cooking), and install them:

```bash
git clone https://github.com/sylGauthier/recipes.git
cd recipes
cook -i src/*.md
```
