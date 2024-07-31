Feature: Login token
Scenario: Login token
    Given url apiUrl
    * def randomEmail = dataGenerator.getRandomEmail();
    * def randomUserName = dataGenerator.getRandomUserName();

      Given def userData = {"name":#(randomUserName), "gender":"male", "email":#(randomEmail), "status":"active"}
      And header Authorization = 'Bearer ' + token
      Given path '/public/v2/users'
      And request 
      """
      {
        "name": #(userData.name),
        "gender": #(userData.gender),
        "email":#(userData.email),
        "status":#(userData.status),
      }
      """
      And method Post
      Then status 201 
      And match response.name == userData.name
      * def idUser = response.id

