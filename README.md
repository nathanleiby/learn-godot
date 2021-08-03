# Readme

Following tuts from:
https://gdquest.mavenseed.com/lessons/intro
starting with 2d platformer.

## Game Design

### Feel I'm Aiming For

- fast paced
- sense of freedom
  - verticality (bumpers, wings)

### Core Mechanic


- hook - attach to hook points, pull yourself

_every design decision should revolve around this..._
how you fight monsters, how you solve puzzles, etc, etc

What can you do with a hook?
- pull crates and levers
- move to target
- blade? kill enemies


### Requirements

movement
- run/walk/move fairly slowly
- jump to low heights
- move to hook target (points in space)

## Creating a toy

A toy doesn't really have rules / objectives.. it's just something that's fun to interact with by itself

When building a platformer, this can be especially useful, since we want a character and movement that's already fun on its own

## Overview of demo's code structure

```
assets/ -
src/ - source code (.godot and .tscn)
    Autoload/ - globally loaded (in project settings window)
    Main/ - heart of program
        StateMachine/
            State
        Game.tscn - main scene
    Objects/ - hook targets
    Player/
        Camera/
        Hook/ - hook behaviors. theoretically could be reused for a monster, or several players in a multiplayer game
        States/ - player behaviors
        Skin.tscn - player animations
    UI/
        debug/ - debug panel
```



## Future IDEA:
Build a small platformer-y brawler game. multiplayer, some fun movement/weapon like hook
