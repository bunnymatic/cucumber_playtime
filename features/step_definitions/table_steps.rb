require 'nokogiri' 
require 'capybara'
module Html
  class Table

    def initialize(headers, row_values) 
      @headers = headers
      @row_values = row_values
    end

    def raw_page
      table do
        [ thead do
            tr do
              @headers.map do |head|
                th { head }
              end.join
            end
          end,
          
          tbody do
            tr do
              @row_values.map do |v|
                td { v }
              end.join
            end
          end ].join
      end
    end

    def page
      Capybara::Node::Simple.new(raw_page)
    end

    
    def tbody
      "<tbody>" + yield + "</tbody>"
    end
    def thead
      "<thead>" + yield + "</thead>"
    end
    def table
      "<table>" + yield + "</table>"
    end
    
    def td
      "<td>" + yield + "</td>"
    end
    
    def th
      "<th>" + yield + "</th>"
    end
    
    def tr
      "<tr>" + yield + "</tr>"
    end
  end
end

When(/^I set up a table with contents:$/) do |t|
  table_data = t.hashes.first
  headers = table_data.keys
  row_data = table_data.values
  @html = Html::Table.new(headers, row_data).page
end

Then(/^cucumber sees that it matches the table body:$/) do |expected|
  actual = [@html.find('tbody tr').all('td').map(&:text)]
  expected.diff!(actual)
end
