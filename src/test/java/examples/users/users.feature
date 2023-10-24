Feature: manage users

  Background:
    * url 'http://localhost:3000/'

  Scenario: get all users and then get the last user by id
    Given path 'users'
    When method get
    Then status 200

    * def usersQuantity = response.length
    * print 'USERS FOUND: ', usersQuantity

  Scenario: create a user and then get it by id

    * def user =
      """
      {
        "id":11,
        "name":"Ernesto Guevara",
        "username":"Ernesto.Guevara",
        "email":"Ernesto.Guevara@gmail.com",
        "address":{
          "street":"Kattie Turnpike",
          "suite":"Suite 200",
          "city":"Lebsackbury",
          "zipcode":"31428-2269",
          "geo":{
            "lat":"-38.2387",
            "lng":"57.2238"
          }
        },
        "phone":"024-648-3806",
        "website":"testing.net",
        "company":{
          "name":"Testing LLC",
          "catchPhrase":"Centralized empowering task-force",
          "bs":"target end-to-end models"
        }
      }
      """

    Given path 'users'
    And request user
    When method post
    Then status 201

    * def createdUserId = response.id
    * print 'CREATED USER ID IS: ', createdUserId

    Given path 'users', id
     When method get
     Then status 200
     And match response contains user

    * def usersQuantity = response.length
    * print 'NUMBER OF USERS FOUND AFTER CREATION: ', usersQuantity

  Scenario: delete a user and then search it by id
    Given path 'users'
    When method get
    Then status 200

    * def deleteUserId = response[response.length-1]
    * print 'USER TO DELETE: ', deleteUserId.id

    Given path 'users', deleteUserId.id
    When method delete
    Then status 200

    * print 'DELETED USER ID IS: ', deleteUserId.id

    Given path deleteUserId.id
    When method get
    Then status 404

    * print 'THE DELETED USER IS NO LONGER FOUND WHEN SEARCHING FOR HIM: ', lastUser.id