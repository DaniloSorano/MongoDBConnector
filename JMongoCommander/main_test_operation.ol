include "console.iol"
include "./public/interfaces/MongoDbConnector.iol"
include "string_utils.iol"
include "time.iol"

init{
  scope (ConnectionMongoDbScope){
    install (defaulta => valueToPrettyString@StringUtils(ConnectionMongoDbScope)();
             println@Console(s)()
             );
    with (connectValue){
        .host = "localhost";
        .dbname ="prova";
        .port = 27017;
        .timeZone = "Europe/Berlin";
        .jsonStringDebug = true
      };
    connect@MongoDB(connectValue)()
}
}

main {
scope (InsertMongoTest){
  install (default => valueToPrettyString@StringUtils(InsertMongoTest)(s); println@Console(s)());
  q.collection = "users";
  with( q.document ){
    with ( .name ){
      .first="Danilo";
      .last="Sorano"
    };
    .age = 22;
    .birthday = L123124321432;
    with (.birthday){
      .("@type")="Date"
    }
  };
  insert@MongoDB(q)(response);
  valueToPrettyString@StringUtils (response)(s);
  println@Console( s )();


  undef( q );
  undef( response );
  undef(s);

  q.collection = "users";
  with( q.document ){
    with(.name) {
      .first="Chiara";
      .last="Babina"
    };
    .age = 23
  };
  q.filter="{name:'Danilo'}";
  update@MongoDB(q)(response);
  valueToPrettyString@StringUtils (response)(s);
  println@Console( s )()



}
}
