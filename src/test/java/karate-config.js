function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  // This is where you can define global variable that can be accessible everywhere
  //
  var config = {
    env: env,
    spartan_url: 'http://54.236.150.168:8000/api'
  }



  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}