Feature: create user
    Scenario: Create user
        #la variable apiUrl se configura en karate-config
        Given url apiUrl
        Given path 'api/users'
        # And request {"Nombre": 'ismael',"Paterno": 'Sullcamani',"telefono":'202020'}
        And request {"Nombre": "#{nombreG}","Paterno": "#{paternoG}","telefono":'202020'}
        When method Post
        Then status 200
        * def idUser = response.id

