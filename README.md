# Cucumber Playtime

The code here was a quick spike to investigate issues with Cucumber's `Cucumber::Ast::Table#diff!` method.

There are a few examples of the failure and it basically shows up if you try to compare an array of text with an HTML table where the array has multiple entries that are the same value.  I suspect it has something to do with hash keys derived from the cell value, and as soon as the values are the same in a particular row, then the matcher doesn't know what the correct order is.

More investigation in necessary.

## Running this projects

1.  clone it
2.  bundle it  `bundle`
3.  rake it `bundle exec rake cucumber`
4.  check the rhyme


## The problem child

Here is an example of the failing test that made me start looking into the issue

    Scenario: Simplest Broke Example                     # features/table_test.feature:12
      When I set up a table with contents:               # features/step_definitions/table_steps.rb:60
        | field1 | field2 | field3 |
        | Yes    | No     | Yes    |
      Then cucumber sees that it matches the table body: # features/step_definitions/table_steps.rb:67
        | Yes | No | Yes |
        Tables were not identical (Cucumber::Ast::Table::Different)
        ./features/step_definitions/table_steps.rb:69:in `/^cucumber sees that it matches the table body:$/'
        features/table_test.feature:16:in `Then cucumber sees that it matches the table body:'
