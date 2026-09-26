# make-proj CLI Setup

`make-proj` is a small Ruby CLI for generating project templates.

It currently supports:

* C++ raylib projects
* C++ terminal projects
* Ruby projects
* C# projects
* Raylib Makefiles
* Terminal Makefiles
* Updating the installed `make-proj` files

Currently tested on macOS and Arch Linux. It should work on other Unix-like systems, but they have not been tested.

Windows support is not currently expected.

---

## 1. Create a local executable directory

Create `~/.local/bin`:

```fish
mkdir -p ~/.local/bin
```

This creates:

```text
~/.local/bin/
```

The `-p` option also creates any missing parent directories.

---

## 2. Make the Ruby program executable

At the very top of `main.rb`, add:

```ruby
#!/usr/bin/env ruby
```

Then, from the `project_scaffolder` directory:

```fish
chmod +x main.rb
```

The shebang allows `main.rb` to be executed directly as a terminal command.

---

## 3. Install the program

Copy `main.rb` into `~/.local/bin` and rename it to `make-proj`:

```fish
cp main.rb ~/.local/bin/make-proj
```

Copy `def.rb` as well:

```fish
cp def.rb ~/.local/bin/def.rb
```

Make the installed command executable:

```fish
chmod +x ~/.local/bin/make-proj
```

The resulting files should include:

```text
~/.local/bin/
├── make-proj
└── def.rb
```

`main.rb` requires `def.rb`, so both files must be installed.

---

## 4. Install the project templates

`def.rb` reads the project templates relative to its own directory using `__dir__`.

Copy the template directories into `~/.local/bin`:

```fish
cp -R rb cs cpp ~/.local/bin/
```

The resulting structure should look like:

```text
~/.local/bin/
├── make-proj
├── def.rb
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

You should see something similar to:

```text
/Users/YOUR_USERNAME/.local/bin
```

near the beginning of the PATH.

You only need to perform this setup once.

---

## 6. Make template paths independent of the current directory

The project templates are loaded using `__dir__`:

```ruby
File.read("#{__dir__}/rb/main.txt")
```

This is important because `make-proj` can be executed from anywhere.

For example:

```fish
cd ~/Desktop
make-proj --rb
```

The template is still loaded from:

```text
~/.local/bin/rb/main.txt
```

rather than:

```text
~/Desktop/rb/main.txt
```

Generated projects, however, are created relative to the user's current working directory.

For example:

```ruby
Dir.mkdir('new_ruby_project')
```

means the generated project appears in whatever directory the user is currently in.

The relationship is:

```text
Template files
    ↓
relative to def.rb / make-proj

Generated project
    ↓
relative to the user's current directory
```

---

# Usage

`make-proj` is controlled through command-line arguments.

To see all available commands:

```fish
make-proj --help
```

---

## Generate a C++ raylib project

```fish
make-proj --cpp -r
```

This creates:

```text
new_CPP_raylib_project/
├── main.cpp
├── main.hpp
└── makefile
```

The files are generated from:

```text
cpp/raylib/main.txt
cpp/raylib/header.txt
cpp/raylib/make.txt
```

---

## Generate a C++ terminal project

```fish
make-proj --cpp -t
```

This creates:

```text
new_CPP_teminal_project/
├── main.cpp
├── main.hpp
└── makefile
```

The files are generated from:

```text
cpp/terminal/main.txt
cpp/terminal/header.txt
cpp/terminal/makefile.txt
```

> Note: `teminal` is currently the directory name used by the program.

---

## Generate a Ruby project

```fish
make-proj --rb
```

This creates:

```text
new_ruby_project/
├── main.rb
└── def.rb
```

The files are generated from:

```text
rb/main.txt
rb/def.txt
```

---

## Generate a C# project

```fish
make-proj --cs
```

This creates:

```text
new_C#_project/
└── main.cs
```

The file is generated from:

```text
cs/main.txt
```

---

# Makefile Generation

`make-proj` can also generate Makefiles directly in the current directory without creating a complete project directory.

## Generate a raylib Makefile

```fish
make-proj --mfile -r
```

This reads:

```text
cpp/raylib/make.txt
```

and creates:

```text
makefile
```

in the current directory.

---

## Generate a terminal C++ Makefile

```fish
make-proj --mfile -t
```

This reads:

```text
cpp/terminal/makefile.txt
```

and creates:

```text
makefile
```

in the current directory.

---

# Updating the Installed Version

`make-proj` includes its own update command:

```fish
make-proj --update
```

This runs the equivalent of:

```fish
cp main.rb ~/.local/bin/make-proj
cp def.rb ~/.local/bin/def.rb
cp -R rb cs cpp ~/.local/bin/
chmod +x ~/.local/bin/make-proj
```

This updates:

* `make-proj`
* `def.rb`
* Ruby templates
* C# templates
* C++ templates
* Makefile templates

You do **not** need to redo the PATH setup when updating.

The update command must be run from the `project_scaffolder` directory because it copies the files from the current directory.

For example:

```fish
cd ~/path/to/project_scaffolder
make-proj --update
```

---

# Command Reference

| Command                | Description                                    |
| ---------------------- | ---------------------------------------------- |
| `make-proj --help`     | Display available commands                     |
| `make-proj --cpp -r`   | Generate a C++ raylib project                  |
| `make-proj --cpp -t`   | Generate a C++ terminal project                |
| `make-proj --rb`       | Generate a Ruby project                        |
| `make-proj --cs`       | Generate a C# project                          |
| `make-proj --mfile -r` | Generate a raylib Makefile                     |
| `make-proj --mfile -t` | Generate a terminal C++ Makefile               |
| `make-proj --update`   | Update the installed `make-proj` configuration |

---

# Testing the Installation

After installation, test the help command:

```fish
make-proj --help
```

Then test one of the generators:

```fish
make-proj --rb
```

You should see:

```text
Preparing Ruby project...
Success!
```

and a new directory:

```text
new_ruby_project/
```

You can also test from outside the repository:

```fish
cd ~/Desktop
make-proj --rb
```

If `new_ruby_project` appears on the Desktop, the installation is working correctly.

---

# Useful Checks

Check whether `make-proj` is available:

```fish
type -a make-proj
```

Check the installed files:

```fish
ls -l ~/.local/bin/
```

Check the installed `def.rb`:

```fish
head -5 ~/.local/bin/def.rb
```

Run the installed command directly, bypassing PATH:

```fish
~/.local/bin/make-proj --help
```

Check that the templates were installed:

```fish
ls -R ~/.local/bin/rb ~/.local/bin/cs ~/.local/bin/cpp
```

---

# Quick Installation

From the `project_scaffolder` directory:

```fish
mkdir -p ~/.local/bin

chmod +x main.rb

cp main.rb ~/.local/bin/make-proj
cp def.rb ~/.local/bin/def.rb

cp -R rb cs cpp ~/.local/bin/

chmod +x ~/.local/bin/make-proj

set -U fish_user_paths ~/.local/bin $fish_user_paths
```

Then test:

```fish
make-proj --help
```

