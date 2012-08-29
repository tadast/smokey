Feature: Search

  Background:
    Given the "search" application has booted
    And I am testing through the full stack
    And I force a varnish cache miss

  Scenario: check search loads
    Then I should be able to visit:
      | Path            |
      | /search         |
      | /search?q=tax   |
      | /browse         |
      | /browse/driving |

  @search
  Scenario Outline:
    When I search for "<query>"
    Then I <imperative> see "<path>" in the top <n> results

  Examples:
    | query                         | imperative | path                                                                     | n  |
    | jobs                          | should     | /jobs-jobsearch                                                          | 2  |
    | jobs                          | should     | /find-job                                                                | 2  |
    | job search                    | should     | /jobs-jobsearch                                                          | 2  |
    | find a job                    | should     | /jobs-jobsearch                                                          | 2  |
    | find a job                    | should     | /find-job                                                                | 2  |
    | job vacancies                 | should     | /jobs-jobsearch                                                          | 2  |
    | jobsearch                     | should     | /jobs-jobsearch                                                          | 2  |
    | job centre                    | should     | /jobs-jobsearch                                                          | 5  |
    | jobcentre                     | should     | /jobs-jobsearch                                                          | 5  |
    | job centre                    | should     | /benefits-adviser                                                        | 5  |
    | jobcentre                     | should     | /benefits-adviser                                                        | 5  |
    | student finance               | should     | /apply-for-student-finance-2012-13                                       | 3  |
    | student finance               | should     | /student-finance-calculator                                              | 3  |
    | passport                      | should     | /apply-renew-passport                                                    | 2  |
    | passports                     | should     | /apply-renew-passport                                                    | 2  |
    | bank holidays                 | should     | /bank-holidays                                                           | 1  |
    | bank holiday                  | should     | /bank-holidays                                                           | 1  |
    | minimum wage                  | should     | /your-right-to-minimum-wage                                              | 3  |
    | national minimum wage         | should     | /your-right-to-minimum-wage                                              | 3  |
    | car tax                       | should     | /car-tax-disc-vehicle-licence                                            | 2  |
    | tax disc                      | should     | /car-tax-disc-vehicle-licence                                            | 2  |
    | taxdisc                       | should     | /car-tax-disc-vehicle-licence                                            | 2  |
    | vehicle tax                   | should     | /car-tax-disc-vehicle-licence                                            | 2  |
    | tax credits                   | should     | /working-tax-credit                                                      | 3  |
    | working tax credit            | should     | /working-tax-credit                                                      | 3  |
    | tax credit                    | should     | /working-tax-credit                                                      | 3  |
    | tax credits                   | should     | /benefits-adviser                                                        | 5  |
    | working tax credit            | should     | /benefits-adviser                                                        | 5  |
    | tax credit                    | should     | /benefits-adviser                                                        | 5  |
    | sole trader                   | should     | /set-up-sole-trader                                                      | 3  |
    | jobseekers                    | should     | /jobseekers-allowance                                                    | 3  |
    | jobseekers allowance          | should     | /jobseekers-allowance                                                    | 3  |
    | job seekers allowance         | should     | /jobseekers-allowance                                                    | 3  |
    | jobseeker's allowance         | should     | /jobseekers-allowance                                                    | 3  |
    | jobseekers allowance          | should     | /benefits-adviser                                                        | 5  |
    | job seekers allowance         | should     | /benefits-adviser                                                        | 5  |
    | jobseeker's allowance         | should     | /benefits-adviser                                                        | 5  |
    | commodity codes               | should     | /trade-tariff                                                            | 3  |
    | customs tariff                | should     | /trade-tariff                                                            | 3  |
    | tariff classification         | should     | /trade-tariff                                                            | 3  |
    | tariff codes                  | should     | /trade-tariff                                                            | 3  |
    | trade tariff                  | should     | /trade-tariff                                                            | 3  |
    | commodity codes               | should     | /finding-commodity-codes                                                 | 3  |
    | customs tariff                | should     | /finding-commodity-codes                                                 | 3  |
    | tariff classification         | should     | /finding-commodity-codes                                                 | 3  |
    | tariff codes                  | should     | /finding-commodity-codes                                                 | 3  |
    | trade tariff                  | should     | /finding-commodity-codes                                                 | 3  |
    | new business                  | should     | /starting-a-business                                                     | 5  |
    | start a business              | should     | /starting-a-business                                                     | 5  |
    | passport fees                 | should     | /passport-fees                                                           | 3  |
    | theory test                   | should     | /driving-theory-test                                                     | 3  |
    | theory test                   | should     | /book-a-driving-theory-test                                              | 3  |
    | council tax                   | should     | /council-tax                                                             | 3  |
    | council tax band              | should     | /council-tax                                                             | 3  |
    | council tax bands             | should     | /council-tax                                                             | 3  |
    | "council tax band"            | should     | /council-tax                                                             | 3  |
    | council tax band              | should     | /council-tax-bands                                                       | 3  |
    | council tax bands             | should     | /council-tax-bands                                                       | 3  |
    | "council tax band"            | should     | /council-tax-bands                                                       | 3  |
    | council tax banding           | should     | /council-tax-bands                                                       | 3  |
    | council tax band a            | should     | /council-tax-bands                                                       | 3  |
    | what council tax band am i    | should     | /council-tax-bands                                                       | 3  |
    | child maintenance             | should     | /calculate-child-maintenance                                             | 5  |
    | child maintenance             | should     | /arranging-child-maintenance-yourself                                    | 5  |
    | child maintenance             | should     | /arranging-child-maintenance-through-child-support-agency                | 5  |
    | child support                 | should     | /calculate-child-maintenance                                             | 5  |
    | child support                 | should     | /arranging-child-maintenance-yourself                                    | 5  |
    | child support                 | should     | /arranging-child-maintenance-through-child-support-agency                | 5  |
    | child support agency          | should     | /arranging-child-maintenance-through-child-support-agency                | 3  |
    | housing benefit               | should     | /housing-benefit                                                         | 3  |
    | housing benefit               | should     | /benefits-adviser                                                        | 3  |
    | disability living allowance   | should     | /dla-disability-living-allowance-benefit                                 | 3  |
    | disability living allowance   | should     | /disability-living-allowance-dla-rates                                   | 3  |
    | dla                           | should     | /dla-disability-living-allowance-benefit                                 | 3  |
    | dla                           | should     | /disability-living-allowance-dla-rates                                   | 3  |
    | provisional                   | should     | /apply-first-provisional-driving-licence                                 | 3  |
    | provisional licence           | should     | /apply-first-provisional-driving-licence                                 | 3  |
    | provisional license           | should     | /apply-first-provisional-driving-licence                                 | 3  |
    | provisional driving licence   | should     | /apply-first-provisional-driving-licence                                 | 3  |
    | provisional driving license   | should     | /apply-first-provisional-driving-licence                                 | 3  |
    | provisional drivers licence   | should     | /apply-first-provisional-driving-licence                                 | 3  |
    | provisional drivers license   | should     | /apply-first-provisional-driving-licence                                 | 3  |
    | apply for provisional licence | should     | /apply-first-provisional-driving-licence                                 | 3  |
    | income support                | should     | /income-support                                                          | 3  |
    | income support                | should     | /benefits-adviser                                                        | 3  |
    | carers allowance              | should     | /carers-allowance                                                        | 3  |
    | carer's allowance             | should     | /carers-allowance                                                        | 3  |
    | carers                        | should     | /carers-allowance                                                        | 5  |
    | carers allowance              | should     | /benefits-adviser                                                        | 5  |
    | carer's allowance             | should     | /benefits-adviser                                                        | 5  |
    | book driving test             | should     | /book-practical-driving-test                                             | 3  |
    | book driving test             | should     | /book-a-driving-theory-test                                              | 3  |
    | book theory test              | should     | /book-a-driving-theory-test                                              | 3  |
    | book theory test              | should     | /book-your-instructor-theory-test                                        | 5  |
    | book practical test           | should     | /book-practical-driving-test                                             | 3  |
    | book test                     | should     | /book-a-driving-theory-test                                              | 3  |
    | book test                     | should     | /book-practical-driving-test                                             | 3  |
    | book test                     | should     | /book-life-in-uk-test                                                    | 5  |
    | book theory                   | should     | /book-a-driving-theory-test                                              | 3  |
    | book practical test           | should     | /book-practical-driving-test                                             | 3  |
    | booking driving test          | should     | /book-practical-driving-test                                             | 3  |
    | booking theory test           | should     | /book-a-driving-theory-test                                              | 3  |
    | booking practical test        | should     | /book-practical-driving-test                                             | 3  |
    | book a driving test           | should     | /book-practical-driving-test                                             | 3  |
    | book driving theory test      | should     | /book-a-driving-theory-test                                              | 3  |
    | book driving practical test   | should     | /book-practical-driving-test                                             | 3  |
    | book my driving test          | should     | /book-practical-driving-test                                             | 3  |
    | book your driving test        | should     | /book-practical-driving-test                                             | 3  |
    | company name                  | should     | /limited-company-formation                                               | 5  |
    | company names                 | should     | /limited-company-formation                                               | 5  |
    | company name                  | should     | /get-information-about-a-company                                         | 5  |
    | company names                 | should     | /get-information-about-a-company                                         | 5  |
    | pay council tax               | should     | /pay-council-tax                                                         | 3  |
    | how much is council tax       | should     | /council-tax                                                             | 3  |
    | council tax rates             | should     | /council-tax                                                             | 3  |
    | stamp duty                    | should     | /stamp-duty-land-tax-rates                                               | 3  |
    | stamp duty                    | should     | /buy-sell-your-home                                                      | 5  |
    | licence                       | should     | /licence-finder                                                          | 3  |
    | music licence                 | should     | /licence-finder                                                          | 3  |
    | background music licence      | should     | /licence-finder                                                          | 3  |
    | license                       | should     | /licence-finder                                                          | 3  |
    | automotive                    | should     | /specialist/automotive-import-and-export-regulations                     | 10 |
    | veterinary                    | should     | /specialist/overseas-veterinary-certificates-and-border-inspection-posts | 10 |
    | protected species             | should     | /specialist/cites-controls-import-and-export-of-protected-species        | 10 |