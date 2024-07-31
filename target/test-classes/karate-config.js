function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiUrl:'https://gorest.co.in/'
  }
  if (env == 'dev') {
    config.token = '700d0c7a86eb84028bf5cd204b11587f812f9d7cd880dc4edbdbd1d407ae9954'
    // config.userEmail='eve.holt@reqres.in'
    // config.userPass='cityslicka'
  } else if (env == 'qa') {
    config.token = '700d0c7a86eb84028bf5cd204b11587f812f9d7cd880dc4edbdbd1d407ae9954'   
  }
  return config;
}