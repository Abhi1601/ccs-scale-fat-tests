Feature: GM Journey for FM2 framework (Housing journey part) -> See FM2 Updated schema from https://miro.com/app/board/o9J_kuCrpYQ=/ design link

    #housing, hosing management and maintenance -> Estates
  @FM2Housing1 @FM2_Regression @FM2_Housing @FM2HousingIntTest
  Scenario Outline: To verify Buyer has provided with different recommendations "<recommServices>", service details "<details>" on GM results page after initiating GM journey for framework "<framework>" and after answering different set of question as sector looking for "<sector>", selects Service area as "<serviceArea>" during the journey
    Given User logs in to the CCS application for "<ScenarioID>"
    When User enters "<framework>" details
    And User clicks on the "Start now" button
    And User clicks on the "Start now" button
    And User selects which type of housing is required "<housing>"
    And User clicks on the "Continue" button
    And User selects which type of housing services is required "<housingServices>"
    And User clicks on the "Continue" button
    Then User should be displayed with GM Escape page
    And User is displayed with "<housing>" answer for the question "What type of housing do you need?"
    And User is displayed with "<housingServices>" answer for the question "What type of housing services do you need?"
    And User is displayed with initial search phrase from "<framework>"

    Examples:
      | ScenarioID | framework | housing | housingServices |
      | Scenario 1 | housing   | Housing | Estate services |

    #housing, hosing management and maintenance -> MOD sector and non Mod sector
  @FM2Housing2 @FM2_Regression @FM2_Housing @FM2HousingIntTest
  Scenario Outline: To verify Buyer has provided with different recommendations "<recommServices>", service details "<details>" on GM results page after initiating GM journey for framework "<framework>" and after answering different set of question as sector looking for "<sector>", selects Service area as "<serviceArea>" during the journey
    Given User logs in to the CCS application for "<ScenarioID>"
    When User enters "<framework>" details
    And User clicks on the "Start now" button
    And User clicks on the "Start now" button
    And User selects which type of housing is required "<housing>"
    And User clicks on the "Continue" button
    And User selects which type of housing services is required "<housingServices>"
    And User clicks on the "Continue" button
    And User selects what sector "<sector>"are you buying for radio button
    And User clicks on the "Continue" button
    And User can successfully expand the details section
    Then User should be displayed with recommendations "<frameworkId>" services for lots "<recommendation>"
    And User is displayed with Framework Id "<frameworkId>" and the expiration date "<expirationDate>" and the details "<details>" text
    And User should be displayed with GM Escape page with route to "<frameworkId>"
    And User is displayed with recommendations: "<recommendation>" in the right order
    And User should be displayed with a number of "<lots>" Lot services
    And User is displayed with "<housing>" answer for the question "What type of housing do you need?"
    And User is displayed with "<housingServices>" answer for the question "What type of housing services do you need?"
    And User is displayed with "<sector>" answer for the question "Which sector are you buying for?"
    And User is displayed with initial search phrase from "<framework>"
    And User is displayed with Framework Lot Recommended: "<frameworkId><recommendation>"

    Examples:
      | ScenarioID   | framework | housing | housingServices                    | sector                                                     | frameworkId | expirationDate | details             | recommendation        | lots |
      | Scenario 1   | housing   | Housing | Housing management and maintenance | Ministry of Defence or defence infrastructure organisation | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot2a_fmtwolot2b | 2    |
#      | Scenario 2   | housing   | Housing | Housing management and maintenance | Central Government                                         | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot2c            | 1    |
#      | Scenario 2.1 | housing   | Housing | Housing management and maintenance | Education                                                  | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot2c            | 1    |
#      | Scenario 2.2 | housing   | Housing | Housing management and maintenance | Devolved                                                   | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot2c            | 1    |
#      | Scenario 2.3 | housing   | Housing | Housing management and maintenance | Health                                                     | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot2c            | 1    |
#      | Scenario 2.4 | housing   | Housing | Housing management and maintenance | Blue light                                                 | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot2c            | 1    |
#      | Scenario 2.5 | housing   | Housing | Housing management and maintenance | Housing                                                    | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot2c            | 1    |
#      | Scenario 2.6 | housing   | Housing | Housing management and maintenance | Charities                                                  | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot2c            | 1    |

        #housing, Facilities -> Services multiple -> MOD sector
  @FM2Housing3 @FM2_Regression @FM2_Housing @FM2HousingIntTest
  Scenario Outline: To verify Buyer has provided with different recommendations "<recommServices>", service details "<details>" on GM results page after initiating GM journey for framework "<framework>" and after answering different set of question as sector looking for "<sector>", selects Service area as "<serviceArea>" during the journey
    Given User logs in to the CCS application for "<ScenarioID>"
    When User enters "<framework>" details
    And User clicks on the "Start now" button
    And User clicks on the "Start now" button
    And User selects which type of housing is required "<housing>"
    And User clicks on the "Continue" button
    And User selects which services "<services>" required multi choice checkboxes
    And User clicks on the "Continue" button
    And User selects what sector "<sector>"are you buying for radio button
    And User clicks on the "Continue" button
    And User can successfully expand the details section
    Then User should be displayed with recommendations "<frameworkId>" services for lots "<recommendation>"
    And User is displayed with Framework Id "<frameworkId>" and the expiration date "<expirationDate>" and the details "<details>" text
    And User should be displayed with GM Escape page with route to "<frameworkId>"
    And User is displayed with recommendations: "<recommendation>" in the right order
    And User should be displayed with a number of "<lots>" Lot services
    And User is displayed with "<housing>" answer for the question "What type of housing do you need?"
    And User is displayed with "<services>" answer for the question "Which services do you need?"
    And User is displayed with "<sector>" answer for the question "Which sector are you buying for?"
    And User is displayed with initial search phrase from "<framework>"
    And User is displayed with Framework Lot Recommended: "<frameworkId><recommendation>"

    Examples:
      | ScenarioID   | framework | housing               | services                                            | sector                                                     | frameworkId | expirationDate | details             | recommendation | lots |
      | Scenario 1   | housing   | Facilities Management | Catering services_Statutory inspections and testing | Ministry of Defence or defence infrastructure organisation | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot3      | 1    |
      | Scenario 1.1 | housing   | Facilities Management | Cleaning services_Reception services                | Ministry of Defence or defence infrastructure organisation | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot3      | 1    |
      | Scenario 1.2 | housing   | Facilities Management | Cleaning services_Maintenance services              | Ministry of Defence or defence infrastructure organisation | RM6089      | 24/01/2023     | fmMarketPlacePhase2 | fmtwolot3      | 1    |

   #housing, Facilities -> Services multiple -> non Mod sector
  @FM2Housing4 @FM2_Regression @FM2_Housing @FM2HousingIntTest
  Scenario Outline: To verify Buyer has provided with different recommendations "<recommServices>", service details "<details>" on GM results page after initiating GM journey for framework "<framework>" and after answering different set of question as sector looking for "<sector>", selects Service area as "<serviceArea>" during the journey
    Given User logs in to the CCS application for "<ScenarioID>"
    When User enters "<framework>" details
    And User clicks on the "Start now" button
    And User clicks on the "Start now" button
    And User selects which type of housing is required "<housing>"
    And User clicks on the "Continue" button
    And User selects which services "<services>" required multi choice checkboxes
    And User clicks on the "Continue" button
    And User selects what sector "<sector>"are you buying for radio button
    And User clicks on the "Continue" button
    Then User can successfully expand the details section
    And User should be displayed with recommendations "<frameworkId>" services for lots ""
    And User is displayed with Framework Id "<frameworkId>" and the expiration date "<expirationDate>" and the details "<details>" text
    And User should be displayed with GM Escape page with route to FM
    And User is displayed with "<housing>" answer for the question "What type of housing do you need?"
    And User is displayed with "<services>" answer for the question "Which services do you need?"
    And User is displayed with "<sector>" answer for the question "Which sector are you buying for?"
    And User is displayed with initial search phrase from "<framework>"
    And User is displayed with Framework Lot Recommended: "<frameworkId>"

    Examples:
      | ScenarioID   | framework | housing               | services                                                                            | sector             | frameworkId | expirationDate | details    |
      | Scenario 1   | housing   | Facilities Management | Cleaning services_Reception services                                                | Central Government | RM3830      | 09/07/2022     | fmmDetails |
      | Scenario 1.1 | housing   | Facilities Management | Cleaning services_Maintenance services                                              | Education          | RM3830      | 09/07/2022     | fmmDetails |
      | Scenario 1.2 | housing   | Facilities Management | Grounds maintenance and horticultural services_Waste services                       | Devolved           | RM3830      | 09/07/2022     | fmmDetails |
      | Scenario 1.3 | housing   | Facilities Management | Computer Aided Facility Management (CAFM) and helpdesk provision_Reception services | Health             | RM3830      | 09/07/2022     | fmmDetails |
      | Scenario 1.4 | housing   | Facilities Management | Cleaning services_Security and guarding services                                    | Blue light         | RM3830      | 09/07/2022     | fmmDetails |
      | Scenario 1.5 | housing   | Facilities Management | Cleaning services_Waste services                                                    | Housing            | RM3830      | 09/07/2022     | fmmDetails |
      | Scenario 1.6 | housing   | Facilities Management | Maintenance services_Reception services_Waste services                              | Charities          | RM3830      | 09/07/2022     | fmmDetails |

   #housing, Facilities -> Services: cleaning
  @FM2Housing5 @FM2_Regression @FM2_Housing @FM2HousingIntTest
  Scenario Outline: To verify Buyer has provided with different recommendations "<recommServices>", service details "<details>" on GM results page after initiating GM journey for framework "<framework>" and after answering different set of question as sector looking for "<sector>", selects Service area as "<serviceArea>" during the journey
    Given User logs in to the CCS application for "<ScenarioID>"
    When User enters "<framework>" details
    And User clicks on the "Start now" button
    And User clicks on the "Start now" button
    And User selects which type of housing is required "<housing>"
    And User clicks on the "Continue" button
    And User selects which services "<services>" required multi choice checkboxes
    And User clicks on the "Continue" button
    And User can successfully expand the details section
    Then User should be displayed with recommendations "<frameworkId>" services for lots ""
    And User is displayed with Framework Id "<frameworkId>" and the expiration date "<expirationDate>" and the details "<details>" text
    And User should be displayed with GM Escape page with route to "<frameworkId>"
    And User is displayed with "<housing>" answer for the question "What type of housing do you need?"
    And User is displayed with "<services>" answer for the question "Which services do you need?"
    And User is displayed with initial search phrase from "<framework>"
    And User is displayed with Framework Lot Recommended: "<frameworkId>"

    Examples:
      | ScenarioID | framework | housing               | services          | frameworkId   | expirationDate        | details                             |
      | Scenario 1 | housing   | Facilities Management | Cleaning services | RM3830_RM6130 | 09/07/2022_25/02/2024 | fmmDetails_buildingCleaningServices |

   #housing, Facilities -> Services: Anything else
  @FM2Housing1 @FM2_Regression @FM2_Housing @FM2HousingIntTest
  Scenario Outline: To verify Buyer has provided with different recommendations "<recommServices>", service details "<details>" on GM results page after initiating GM journey for framework "<framework>" and after answering different set of question as sector looking for "<sector>", selects Service area as "<serviceArea>" during the journey
    Given User logs in to the CCS application for "<ScenarioID>"
    When User enters "<framework>" details
    And User clicks on the "Start now" button
    And User clicks on the "Start now" button
    And User selects which type of housing is required "<housing>"
    And User clicks on the "Continue" button
    And User selects which services "<services>" required multi choice checkboxes
    And User clicks on the "Continue" button
    And User can successfully expand the details section
    Then User should be displayed with GM Escape page
    And User is displayed with "<housing>" answer for the question "What type of housing do you need?"
    And User is displayed with "<services>" answer for the question "Which services do you need?"
    And User is displayed with initial search phrase from "<framework>"

    Examples:
      | ScenarioID | framework | housing               | services      |
      | Scenario 1 | housing   | Facilities Management | Anything else |