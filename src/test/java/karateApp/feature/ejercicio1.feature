Feature: ejercicio de corrida todo

  Background:
    Given url apiUrl
    * def dataGenerator = Java.type('helpers.DataGenerator')//genera de forma aleatoria un correo y usuario con la librería javafaker

  Scenario: Listar usuarios
    Given path 'public/v2/users'
    And header Authorization = 'Bearer ' + token
    #variables en url
    # And params { page: 2 }
    And method Get
    Then status 200 
    And match each response == 
    """
      {
        "id": "#number",
        "name": "#string",
        "email": "#string",
        "gender": "#string",
        "status": "#string"
    }
    """
    
    Scenario: Crear usuario
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
      * def idUser = response.idUser
      
    
    Scenario: Actualizar usuario
      * def randomEmail = dataGenerator.getRandomEmail();
      * def randomUserName = dataGenerator.getRandomUserName();
      Given def userData = {"name":#(randomUserName), "email":#(randomEmail),"status":"active", "id":idUser}
        And header Authorization = 'Bearer ' + token
      Given path 'public/v2/users/'+userData.id
      And request 
      """
      {
        "name": #(userData.name),
        "email": #(userData.email),
        "status": #(userData.status)
      }
      """
      And method Patch
      Then status 200
      # And match response.updatedAt != null
    
    Scenario: borrar usuario
      # Given def userData = {"id":idUser}
      Given path 'public/v2/users/'+idUser
      And header Authorization = 'Bearer ' + token
      And method delete
      Then status 204