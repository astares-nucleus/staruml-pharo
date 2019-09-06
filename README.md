# staruml-pharo
(White)StarUML extensions for Pharo

# How to use

## Installation 
### Install WhiteStarUML

First install the free [WhitestarUML](https://sourceforge.net/projects/whitestaruml/files/) UML tool on your local Windows machine.

We recommend to install it into the folder

```
c:\astares\tools\WhiteStarUML
```

as you can use other Astares tools then afterwards from this location.

### Install the project

Just clone or copy the contents of this github project into the **module** folder of the WhiteStarUML installation. With this you should end up with a 

```
C:\astares\tools\WhiteStarUML\modules\staruml-pharo
```
folder

## How to use

### Pharo modeling approach

When you create a new WhiteStarUML project by approach you will find a "Pharo Approach" in the 

If you have an existing project you 



# Generating 

There is a small utility package included written in [Pharo](http://www.pharo.org) that allows you to generate the Pharo class hierarchy into a model 

```Smalltalk
XPDFile new write
```

This generates the XDP XML structure and copies the result into the Clipboard. Just save it as a *.unt WhiteStar UML unit control file and use it within the UML tool to browse and model based on Pharo classes.

