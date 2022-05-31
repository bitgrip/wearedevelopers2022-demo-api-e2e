Feature: test bitgrip jobs endpoint

  Background:
    * url 'https://wearedevelopers2022.netlify.app/api'

  Scenario: get job listings
    Given path '/jobs'
    When method get
    Then status 200
    And match response.jobs[0].title == 'Frontend Developer'
    And match response.jobs[1].title == 'Backend Developer'
    And match response.jobs[2].title == 'Senior Frontend Developer'
    And match response.jobs[3].title == 'QA Test Analyst'
    And match response.jobs[4].title == 'Operations Engineer'
  
  Scenario: filter jobs using tag
    Given path '/jobs'
    And param tag = 'qa'
    When method get
    Then status 200
    And match each response.jobs contains {tag: 'qa'}
