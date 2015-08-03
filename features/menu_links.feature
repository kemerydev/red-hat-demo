Feature: Menu links at the Red Hat homepage

  @initial
  Scenario: Open the Red Hat homepage
    Given a public user navigates to the Red Hat homepage at http://www.redhat.com/en
    Then at least 1 Learn more button should be visible
    And the primary menu links should be visible
    And the secondary top nav menu should be visible

  Scenario Outline: Clicking top-level links of the top navigation menu
    Given a user clicks <LinkText> in the secondary menu the page should redirect to <LinkPath>
    Examples:
      | LinkText                | LinkPath     |
      | Customers               | /customers   |
      | Partners                | /partners    |
      | Open source communities | /open-source |

    # a partial check that is quick to write
    Scenario Outline: Primary navigation - parent links
      Given a user clicks <LinkText> then the primary nav menu should slide down with an explore button
      Examples:
        | LinkText           |
        | Technologies       |
        | Services & support |
        | Success stories    |
        | About Red Hat      |

    # a more thorough regression check
    Scenario Outline: Primary navigation - child links
      Given the user clicks to open the <MenuName> option from the primary nav menu
      Then the <ColumnName> column header should be displayed in the primary nav menu
      Given a user clicks <LinkText> in the primary nav menu then the browser should redirect to <LinkUri>
      Examples:
        | LinkUri                                        | MenuName           | ColumnName      | LinkText                                |
        | /technologies                                  | Technologies       | Solutions       | Solutions                               |
        | /technologies/it-infrastructure                | Technologies       | Solutions       | Infrastructure                          |
        | /technologies/infrastructure-as-a-service      | Technologies       | Solutions       | IaaS                                    |
        | /technologies/platform-as-a-service            | Technologies       | Solutions       | PaaS                                    |
        | /technologies/cloud-applications               | Technologies       | Solutions       | Application development and integration |
        | /technologies/all-products                     | Technologies       | Product lines   | Product lines                           |
        | /technologies/linux-platforms                  | Technologies       | Product lines   | Linux platforms                         |
        | /technologies/jboss-middleware                 | Technologies       | Product lines   | JBoss Middleware                        |
        | /technologies/virtualization                   | Technologies       | Product lines   | Virtualization                          |
        | /technologies/cloud-computing                  | Technologies       | Product lines   | Cloud computing                         |
        | /technologies/storage                          | Technologies       | Product lines   | Storage                                 |
        | /technologies/mobile                           | Technologies       | Product lines   | Mobile                                  |
        | /technologies/all-products                     | Technologies       | Product lines   | All products                            |
        | /technologies/industries                       | Technologies       | Industries      | Industries                              |
        | /technologies/industries/financial             | Technologies       | Industries      | Financial services                      |
        | /technologies/industries/government            | Technologies       | Industries      | Government                              |
        | /technologies/industries/health-life-sciences  | Technologies       | Industries      | Healthcare                              |
        | /technologies/industries/telecommunications    | Technologies       | Industries      | Telecommunications                      |
        | /technologies/industries                       | Technologies       | Industries      | All industries                          |
        | /services/support                              | Services & support | Support         | Support                                 |
        | access.redhat.com                              | Services & support | Support         | Customer Portal                         |
        | /services/support/technical-account-management | Services & support | Support         | Technical Account Management            |
        | /support/contact/customerService               | Services & support | Support         | Customer service                        |
        | /success-stories                               | Success stories    | Customers       | Customers                               |
        | /success-stories/adobe                         | Success stories    | Customers       | Adobe                                   |
        | /about                                         | About Red Hat      | Red Hat         | Red Hat                                 |
        | about/company                                  | About Red Hat      | Red Hat         | Company information                     |