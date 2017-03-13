Chance
=========

Chance is a library for exploring uncertainty in code. Maybe you always wanted to program with probability?

The idea originated with Numeric#percent and Kernel#maybe, which Marcel Molina posted to Projectionist, a tumblelog.  This led to various snippets for executing code in a fuzzier way than usual, and this library has since been used in the production of the game Firewatch and several others.  You get such handy, wishy-washy methods as:

Date#at_some_point rather than Date#midnight
Array#pick(percentage) rather than iterating over every element

"maybe" is a Kernel method that randomly evaluates to true or false when it is called.

    bob.lucky_winner? = maybe
    # => true

    chauncey.lucky_winner? = maybe
    # => false

Maybe can also be supplied with a block, which will be called only if the Chance happens:

    maybe do
      rotate_logs
    end

Behind the scenes, `maybe` is just constructing a Chance object. It's equivalent to the statement `50.percent.chance.of {rotate_logs}`

By themselves, Chance objects either "happen" or they don't- the probability for each is evaluated the first time you call `Chance.happen?`, and thereafter it's set in stone. See the schroedinger.rb example if this interests you.

Chance Case Statements
--------------------

Chance Cases take any number of args, each one being a probability statement with an outcome block attached.  The probabilities must add to 100 percent (sorry, for once in your life you will have to give less than 110%).  Only one outcome will be evaluated, as you would expect:

    outcome = Chance.case(
      70.percent.chance.will {'snow'},
      20.percent.chance.will {'sleet'},
      8.percent.chance.will {'sun'},
      2.percent.chance.will {'knives'}
    )

Running examples and specs
----------------
Check out the specs for a better idea of how to use Chance. Make sure you have Bundler installed- then run  `bundle exec rake`.

Game Dev
----------------
As we've found in our experience making games like Firewatch, Chance is perfect for use in making video games— it's an insanely easy to read and use DSL for introducing uncertainty into games. For example, the weather system above is a succinct form of the logic you'd find running the hourly weather cycles in a game like _Breath of the Wild_. See `weather.rb` for more examples!

LICENSE
----------------
LICENSE for the copying and use of this code is "MIT-Alike" the file `COPYING` for license details.

"CHANCE" is Copyright (c) 2008—2017 Chance/Agency, All Rights Reserved
