Feature: e2e / UI Test

Background:
  * configure driver = { type: 'chrome', showDriverLog: false }

Scenario: filter for a suitable job (and make an application) 
  # Confirm that all jobs are displayed
  Given driver 'https://wearedevelopers2022.netlify.app/'
  When waitForEnabled('.tags.filter-btn--all').click()
  Then locate('.tags.tags--backend')
  And locate('.tags.tags--qa')
  And locate('.tags.tags--frontend')
  And locate('.tags.tags--operations')

  # Confirm the absence of architecture jobs
  When waitForEnabled('.tags.filter-btn--architecture').click()
  Then match text('.stage__text.spacing--top-60.no-results') == 'No offers at the moment'
  
  # Filter for Frontend jobs
  When waitForEnabled('.tags.filter-btn--frontend').click()
  Then locate('.tags.tags--frontend')
  * if (exists('.tags.tags--qa')) karate.fail("the filter doesn't work correctly")

  # Filter for QA jobs
  When waitForEnabled('.tags.filter-btn--qa').click()
  Then locate('.tags.tags--qa')
  * if (exists('.tags.tags--frontend')) karate.fail("the filter doesn't work correctly")