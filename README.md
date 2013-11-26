# Command

In Ruby, there are plenty of ways to run simple commands:

* `` `date` ``
* `%x(date)`
* `exec("date")`
* `system("date")`
* `Open3.capture2("date")`
* `Open3.capture2e("date")`
* `Open3.capture3("date")`

And those are just a few of the ways built into Ruby's Standard Library!

## The Problem

Each of these commands works differently. This can cause confusion for the developer.

In addition, there are often cases where a developer will draw a boundary at shelling out in the test suite. If your codebase uses a mix of all of the methods above, stubbing that boundary is difficult and brittle. The decision to change from `Open3.capture3` to `Open3.capture2` should not break your tests.

## The Solution

All of the methods above have one thing in common: they only require one string argument.

Command provides a simple, object-oriented interface for running simple commands.

```ruby
Command.run("date")
```

And that's all!

*But* if you need more information about what happened, the return value is a `Command` object with all the goodies that you would expect.

```ruby
command = Command.run("date")
command.stdout   # => "Tue Nov 26 14:45:03 EST 2013\n"
command.stderr   # => ""
command.status   # => 0
command.success? # => true
command.pid      # => 32157
```

Now, drawing boundaries in your tests is easy.

```ruby
describe DateGetter do
  describe ".get" do
    it "gets the date" do
      date = "Tue Nov 26 14:45:03 EST 2013"

      expect(Command).to receive(:run).with("date") do
        double(:command, success?: true, stdout: "#{date}\n")
      end

      expect(DateGetter.get).to eq(date)
    end
  end
end
```

## Contribution

Command is open source and contributions from the community are encouraged! No contribution is too small. Please consider:

* adding an awesome feature
* fixing a terrible bug
* updating documentation
* fixing a not-so-bad bug
* fixing typos

For the best chance of having your changes merged, please:

1. Ask us! We'd love to hear what you're up to.
2. Fork the project.
3. Commit your changes and tests (if applicable (they're applicable)).
4. Submit a pull request with a thorough explanation and at least one animated GIF.

## Thank You!

Thank you to [Sven Fuchs](https://github.com/svenfuchs) for granting access to the "command" gem name.
