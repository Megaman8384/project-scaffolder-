# make-proj CLI Setup

This document contains the commands needed to install `make-proj` as a global terminal command.

Currently tested on macOS and Arch Linux. It should work on other Unix-like systems, but they have not been tested.

I doubt it would work on windows though. 

## 1. Create a local executable directory

```fish
mkdir -p ~/.local/bin
```

This creates:

```text
~/.local/bin/
```

The `-p` option also creates missing parent directories.

---

## 2. Make the Ruby program executable

At the top of `main.rb`, add:

```ruby
#!/usr/bin/env ruby
```

Then, from the `project_scaffolder` directory:

```fish
chmod +x main.rb
```

---

## 3. Install the program

Copy `main.rb` into `~/.local/bin` and rename it:

```fish
cp main.rb ~/.local/bin/make-proj
```

Copy `func.rb` too:

```fish
cp func.rb ~/.local/bin/func.rb
```

Make the command executable:

```fish
chmod +x ~/.local/bin/make-proj
```

---

## 4. Install the project templates

The scaffolder needs its template directories:

```fish
cp -R rb cs cpp ~/.local/bin/
```

The resulting structure should look like:

```text
~/.local/bin/
├── make-proj
├── func.rb
├── rb/
│   ├── main.txt
│   └── def.txt
├── cs/
│   └── main.txt
└── cpp/
    ├── terminal/
    │   ├── main.txt
    │   ├── header.txt
    │   └── makefile.txt
    └── raylib/
        ├── main.txt
        ├── header.txt
        └── make.txt
```

---

## 5. Add `~/.local/bin` to fish's PATH

Run:

```fish
set -U fish_user_paths ~/.local/bin $fish_user_paths
```

Check the PATH:

```fish
echo $PATH
```

You should see:

```text
/Users/YOUR_USERNAME/.local/bin
```

near the beginning.

---

## 6. Make template paths independent of the current directory

The scaffolder should use `__dir__` when reading templates.

For example:

```ruby
File.read("#{__dir__}/rb/main.txt")
```

instead of:

```ruby
File.read("rb/main.txt")
```

This makes the template path relative to `def.rb`, rather than relative to wherever the user happens to run `make-proj`.

Generated projects should still use normal relative paths:

```ruby
Dir.mkdir("new_ruby_project")
```

This means:

```text
Template files
    ↓
relative to make-proj

Generated project
    ↓
relative to the user's current directory
```

---

## 7. Test the command

From anywhere:

```fish
make-proj
```

You can specifically test that it works outside the repository:

```fish
cd ~/Desktop
make-proj
```

If the menu appears, the installation works.

---

## Updating the installed version

When you change `main.rb` or `def.rb`, copy the updated files into `~/.local/bin` again:

```fish
cp main.rb ~/.local/bin/make-proj
cp func.rb ~/.local/bin/func.rb
```

If you change the templates, copy them again:

```fish
cp -R rb cs cpp ~/.local/bin/
```

You do **not** need to redo the PATH setup every time.

---

## Useful checks

Check whether the command exists:

```fish
type -a make-proj
```

Check the installed files:

```fish
ls -l ~/.local/bin/
```

Check the installed `def.rb`:

```fish
head -5 ~/.local/bin/func.rb
```

Run the installed command directly, bypassing PATH:

```fish
~/.local/bin/make-proj
```

---

## Quick reinstall/update

From the `project_scaffolder` directory, the usual update sequence is simply:

```fish
cp main.rb ~/.local/bin/make-proj
cp def.rb ~/.local/bin/def.rb
cp -R rb cs cpp ~/.local/bin/
chmod +x ~/.local/bin/make-proj
```

Then:

```fish
make-proj
```

Done.
