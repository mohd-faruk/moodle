@editor @editor_tiny @tiny_html @javascript
Feature: Edit HTML in TinyMCE
  To write rich text - I need to be able to easily edit the HTML.

  Scenario: View HTML in TinyMCE source code view
    Given I log in as "admin"
    When I open my profile in edit mode
    And I set the field "Description" to "This is my draft"
    And I click on the "View > Source code" menu item for the "Description" TinyMCE editor
    And I should see "Source code"
    Then I should see "<p>This is my draft</p>" source code for the "Description" TinyMCE editor

  Scenario: View multiline HTML with indenting in TinyMCE source code view
    Given I log in as "admin"
    When I open my profile in edit mode
    And I set the field "Description" to "<div><p>This is my draft</p></div>"
    And I click on the "View > Source code" menu item for the "Description" TinyMCE editor
    And I should see "Source code"
    Then I should see this multiline source code for the "Description" TinyMCE editor:
      """
      <div>
        <p>This is my draft</p>
      </div>
      """

  Scenario: Keep TinyMCE source code left-to-right in an RTL language
    Given the following "language customisations" exist:
      | component       | stringid      | value |
      | core_langconfig | thisdirection | rtl   |
    And I log in as "admin"
    When I open my profile in edit mode
    And I set the field "Description" to "This is my draft"
    And I click on the "View > Source code" menu item for the "Description" TinyMCE editor
    And I should see "Source code"
    Then the source code editor should be displayed left-to-right for the "Description" TinyMCE editor
    And I should see "<p>This is my draft</p>" source code for the "Description" TinyMCE editor
