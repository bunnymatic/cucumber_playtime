Feature:
  When I use Cucumber to compare tables that include Yes and No
  I get proper comparisons

Scenario: Simplest Working Example
  When I set up a table with contents:
    | field1 | field2 |
    | Yes    | No     |
  Then cucumber sees that it matches the table body:
    | Yes | No |

Scenario: Simplest Broke Example
  When I set up a table with contents:
    | field1 | field2 | field3 |
    | Yes    | No     | Yes    |
  Then cucumber sees that it matches the table body:
    | Yes | No | Yes |

Scenario: Simplest Broke Example
  When I set up a table with contents:
    | field1 | field2 | field3 |
    | No     | Yes    | No     |
  Then cucumber sees that it matches the table body:
    | No | Yes | No |

Scenario: Failing test where the Yes's are present
  When I set up a table with contents:
    | field1 | field2 | field3 | field4 |
    |      1 |      1 |      1 |      1 |
  Then cucumber sees that it matches the table body:
    | 1 | 1 | 1 | 1 |

Scenario: Case where cucumber can't see the Yes entries
  When I set up a table with contents:
    | field1 | field2 | field3 | field4      |
    | Yes    | No     | Yes    | Other Stuff |
  Then cucumber sees that it matches the table body:
    |      No |      Other Stuff |

Scenario: Case where the word Yes is not used
  When I set up a table with contents:
    | field1   | field2   | field3   |
    | Eat      | at       | Moes     |
  Then cucumber sees that it matches the table body:
    | Eat      | at       | Moes     |

Scenario: Only one yes entry
  When I set up a table with contents:
    | field1      | field2 | field3 | field4      |
    | Yes, indeed | No     | Yes    | Other Stuff |
  Then cucumber sees that it matches the table body:
    | Yes, indeed | No | Yes | Other Stuff |

